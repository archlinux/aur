# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=edgcpp-git
pkgver=r62403.f0e30b6
pkgrel=1
pkgdesc="The EDG C/C++ front end with its C-generating back end (eccp), prelinker and runtime"
arch=('x86_64' 'aarch64')
url="https://edgcpp.org"
license=('Apache-2.0 WITH LLVM-exception')
# gcc compiles the C that eccp generates and supplies the header search
# lists and the predefined macros; edg_eccp_config links g++-emulation
# programs with libstdc++ and libgcc_s. namcap sees none of these uses.
depends=('bash' 'gcc' 'glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'cmake' 'ninja' 'python')
provides=('edgcpp')
conflicts=('edgcpp')
# libC.a is the runtime eccp links into every program: keep it, and keep
# it free of LTO bytecode.
options=('staticlibs' '!lto')
# edgcpp-aarch64-host.patch is the native AArch64 host configuration,
# not yet upstream: branch linux-aarch64-host of github.com/thinkoid/edgcpp
# at b7bfddf. It adds files and one branch to host-defaults.cmake; the
# x86_64 build does not read any of it.
source=("edgcpp::git+https://github.com/edgcpp/compiler.git"
        "edgcpp-aarch64-host.patch"
        "eccp"
        "edg_eccp_config")
sha256sums=('SKIP'
            'ceced79cd33724d912e50c358d03d0a67b66a0d6c3f93ce60af32476ca01b8b5'
            '81831901bda74b2bf54b94519f4953e773a385989404050dc1c3f9cf2169cf1c'
            '6fbf98c33f08bb5270aa9f04bec34c912c61f546285de11e74d11c954aaae939')

# The preset and its build directory, per architecture.
case $CARCH in
    x86_64)  _preset=linux-gcc-release;         _build=build/gcc-release ;;
    aarch64) _preset=linux-aarch64-gcc-release; _build=build/aarch64-gcc-release ;;
esac

pkgver() {
    cd edgcpp
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd edgcpp
    git apply "$srcdir/edgcpp-aarch64-host.patch"
}

# The EDG_BASE the package builds with, tests with and installs: the
# config for the resident gcc, EDG's headers, and a predefined macro
# table generated from the resident gcc. Upstream's shipped tables come
# from other systems' compilers and are not used.
_mkbase() {
    local base="$srcdir/base"
    rm -rf "$base"
    install -Dm644 "$srcdir/edg_eccp_config" "$base/edg_eccp_config"
    ln -s "$srcdir/edgcpp/include_c++" "$base/include"
    ln -s "$srcdir/edgcpp/include_c99" "$base/include_c99"
    mkdir -p "$base/lib"
    # The generator sorts; C collation keeps the table's order the same
    # whatever the build session's locale.
    (cd "$base/lib" && LC_ALL=C sh "$srcdir/edgcpp/util/make_predef_macro_table")
}

build() {
    _mkbase
    cd edgcpp
    # The config in the tree's native base, where the tree has one, is
    # this recipe's file: one source, two copies.
    if [ -e "bases/cmake-native/linux-$CARCH/gcc/edg_eccp_config" ]; then
        cmp "$srcdir/edg_eccp_config" \
            "bases/cmake-native/linux-$CARCH/gcc/edg_eccp_config"
    fi
    # The runtime library is built by eccp itself, in g++ emulation, so
    # it reads $EDG_BASE; system-header mode adds --gnu_version for the
    # resident gcc.
    export EDG_BASE="$srcdir/base" EDG_USE_SYSTEM_HEADERS=1
    # Build type None: makepkg's flags rule. Release would add -static,
    # -O3 and -flto; the macro configuration is the release one for any
    # type but Debug. Upstream links with mold, lld or gold when it finds
    # one, for link speed; the package links with the system linker.
    # The default target (linux_x86_64 or linux_aarch64) reads lib/; an
    # empty EDG_CPP_RT_LIBS builds no per-target runtimes (the x86_64
    # preset lists eight, each needing a lib_<target>/ the base does not
    # have).
    cmake --preset "$_preset" -DEDG_CPP_RT_LIBS= \
          -DCMAKE_BUILD_TYPE=None -DEDG_PREFERRED_LINKER=bfd
    cmake --build "$_build"
    _strict_facts >> "$srcdir/base/lib/predefined_macros.txt"
}

# Target facts for strict mode (-A), which excludes GNU emulation and so
# every gnu/gcc/gpp entry: the macros the resident gcc predefines that its
# freestanding headers (float.h, limits.h, stddef.h, ...) read, less those
# eccp already defines in strict mode, less __STDC_* (the front end's own,
# per dialect). Values are gcc's C spellings, valid C++ too.
_strict_facts() {
    local inc t
    inc=$(gcc -print-file-name=include)
    t=$(mktemp -d)
    gcc -dM -E -x c /dev/null | sort > "$t/gcc"
    awk '{ print $2 }' "$t/gcc" | sort -u > "$t/gcc-names"
    grep -ohE '\b__[A-Za-z0-9_]+__\b' "$inc"/{float,limits,syslimits}.h \
        "$inc"/{stddef,stdarg,iso646,stdbool,stdint}.h |
        sort -u > "$t/hdr-names"
    echo 'int x;' > "$t/e.cpp"
    env -u EDG_USE_SYSTEM_HEADERS \
        "$_build/bin/eccp" -A --list_macros -E "$t/e.cpp" 2>&1 |
        awk '/#define/ { print $2 }' | sort -u > "$t/have"
    echo
    echo "# strict: target facts the resident gcc's freestanding headers read"
    comm -12 "$t/gcc-names" "$t/hdr-names" | comm -23 - "$t/have" |
        grep -v '^__STDC_' |
        while read -r n; do grep "^#define $n " "$t/gcc"; done |
        sed 's/^#define /strict no /'
    rm -rf "$t"
}

check() {
    cd edgcpp
    # The installed default: strict mode cannot run under g++ emulation,
    # which build() exported for the runtime.
    export EDG_BASE="$srcdir/base"
    unset EDG_USE_SYSTEM_HEADERS
    cat > "$srcdir/smoke.cpp" <<'SMOKE'
#include <float.h>
#include <stdio.h>
#include <typeinfo>
struct B { virtual ~B () { } virtual int f () const = 0; };
struct D : B { int f () const { return 21; } };
template <class T> T twice (T x) { return x + x; }
int main ()
{
    try {
        D d;
        const B& b = d;
        if (typeid (b) != typeid (D))
            return 1;
        throw twice (b.f ());
    }
    catch (int n) {
        return printf ("%d %d\n", n, DBL_DIG) < 0 || 42 != n;
    }
}
SMOKE
    "$_build/bin/eccp" -A -x "$srcdir/smoke.cpp" -o "$srcdir/smoke"
    "$srcdir/smoke"
}

package() {
    cd edgcpp
    local base="$pkgdir/usr/lib/edgcpp"
    local b
    for b in cpfe cpfe-cp edg_munch edg_decode edg_prelink cdisp; do
        install -Dm755 "$_build/bin/$b" "$base/bin/$b"
    done
    install -Dm755 util/eccp.sh "$base/bin/eccp.sh"
    install -Dm644 "$srcdir/edg_eccp_config" "$base/edg_eccp_config"
    install -Dm644 "$_build/lib/libC.a" "$base/lib/libC.a"
    install -Dm644 "$srcdir/base/lib/predefined_macros.txt" \
            "$base/lib/predefined_macros.txt"
    cp -r --no-preserve=ownership include_c++ "$base/include"
    cp -r --no-preserve=ownership include_c99 "$base/include_c99"
    install -Dm755 "$srcdir/eccp" "$pkgdir/usr/bin/eccp"
    install -Dm644 LICENSE.txt \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=edgcpp-git
pkgver=r62403.f0e30b6
pkgrel=3
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

# The preset and its build directory, per architecture. _target is the
# default target's own name (LEGACY_TARGET_CONFIGURATION_NAME in the
# platform file): eccp reads lib_<target>/ for any --target, the
# default's name included, and cpfe reads the macro table there;
# upstream's test suite passes it.
case $CARCH in
    x86_64)  _preset=linux-gcc-release;         _build=build/gcc-release ;;
    aarch64) _preset=linux-aarch64-gcc-release; _build=build/aarch64-gcc-release ;;
esac
_target=linux_$CARCH

pkgver() {
    cd edgcpp
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd edgcpp
    git apply "$srcdir/edgcpp-aarch64-host.patch"
    # No named cross targets. Upstream's x86_64 platform imports seven
    # (linux_i686, win64, win32, linux_aarch64, linux_armv7,
    # linux_riscv64, linux_riscv32) for its test harness, each served by
    # a macro table and a runtime in upstream's own base. The package
    # ships neither (the tables describe other systems' compilers), and
    # a target the front end knows but the base cannot serve dies in
    # cpfe with "cannot open predefined macro file"; one it does not
    # know is a command-line error naming the target, as on aarch64,
    # whose platform imports none. Each import is a comment, an import
    # line and a TARGET_CONFIGURATION_<n> entry; all three go.
    local pf=cmake/macro-conf/support/platform/linux-x86_64/base.cmakedef
    sed -i '/^# Import the named .* target as target configuration/,/^TARGET_CONFIGURATION_[0-9]*=/d' "$pf"
    sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$pf"
    ! grep -e '^import <support/target/' -e '^TARGET_CONFIGURATION_' "$pf"
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
    # One target, one table: under --target <default> cpfe reads
    # lib_<target>/predefined_macros.txt. A link cannot drift from lib/.
    ln -s lib "$base/lib_$_target"
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
    # empty EDG_CPP_RT_LIBS builds no per-target runtimes. The presets
    # list the default target's own name (and, on x86_64, the seven
    # cross targets prepare() removed); its runtime is lib/libC.a
    # already, and the link below stands for it.
    cmake --preset "$_preset" -DEDG_CPP_RT_LIBS= \
          -DCMAKE_BUILD_TYPE=None -DEDG_PREFERRED_LINKER=bfd
    cmake --build "$_build"
    # eccp links --target programs with lib_<target>/libC.a.
    ln -sfn lib "$_build/lib_$_target"
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
    # The same program under the default target's own name, as the test
    # suite compiles: cpfe must find lib_<target>/predefined_macros.txt
    # in the base and eccp lib_<target>/libC.a in the build directory.
    # The driver only warns about a missing lib_<target>/; the warning
    # fails the check too.
    "$_build/bin/eccp" -A --target "$_target" -x "$srcdir/smoke.cpp" \
        -o "$srcdir/smoke-target" 2> "$srcdir/smoke-target.err" ||
        { cat "$srcdir/smoke-target.err"; return 1; }
    ! grep -e 'target-specific' -e 'is unset' "$srcdir/smoke-target.err"
    "$srcdir/smoke-target"
    # And no cross target: a name the base cannot serve must be unknown
    # to the front end, not a dead end in cpfe (prepare()).
    if "$_build/bin/eccp" -A --target linux_i686 -x "$srcdir/smoke.cpp" \
        -o "$srcdir/smoke-fixture" 2> "$srcdir/smoke-fixture.err"; then
        echo "linux_i686 is still a target of this build"; return 1
    fi
    grep -q 'no "linux_i686" --target configuration exists' \
        "$srcdir/smoke-fixture.err" || { cat "$srcdir/smoke-fixture.err"; return 1; }
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
    # The installed EDG_BASE and library directory are one tree, so one
    # link serves cpfe's table and eccp's runtime under --target.
    ln -s lib "$base/lib_$_target"
    cp -r --no-preserve=ownership include_c++ "$base/include"
    cp -r --no-preserve=ownership include_c99 "$base/include_c99"
    install -Dm755 "$srcdir/eccp" "$pkgdir/usr/bin/eccp"
    install -Dm644 LICENSE.txt \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

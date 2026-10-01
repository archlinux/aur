# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=edgcpp-git
pkgver=r62398.158320e
pkgrel=1
pkgdesc="The EDG C/C++ front end with its C-generating back end (eccp), prelinker and runtime"
arch=('x86_64')
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
source=("edgcpp::git+https://github.com/edgcpp/compiler.git"
        "eccp"
        "edg_eccp_config")
sha256sums=('SKIP'
            '81831901bda74b2bf54b94519f4953e773a385989404050dc1c3f9cf2169cf1c'
            '6aa27d5470ea36693f1c7e6f7479d79ac17b6e7c96c0544567b0136deb8e6206')

pkgver() {
    cd edgcpp
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
    (cd "$base/lib" && sh "$srcdir/edgcpp/util/make_predef_macro_table")
}

build() {
    _mkbase
    cd edgcpp
    # The runtime library is built by eccp itself, in g++ emulation, so
    # it reads $EDG_BASE; system-header mode adds --gnu_version for the
    # resident gcc.
    export EDG_BASE="$srcdir/base" EDG_USE_SYSTEM_HEADERS=1
    # Build type None: makepkg's flags rule. Release would add -static,
    # -O3 and -flto; the macro configuration is the release one for any
    # type but Debug. Upstream links with mold, lld or gold when it finds
    # one, for link speed; the package links with the system linker.
    # The default target is named linux_x86_64 and reads lib/; an empty
    # EDG_CPP_RT_LIBS builds no per-target runtimes (the preset lists
    # eight, each needing a lib_<target>/ the base does not have).
    cmake --preset linux-gcc-release -DEDG_CPP_RT_LIBS= \
          -DCMAKE_BUILD_TYPE=None -DEDG_PREFERRED_LINKER=bfd
    cmake --build build/gcc-release
}

check() {
    cd edgcpp
    # The installed default: strict mode cannot run under g++ emulation,
    # which build() exported for the runtime.
    export EDG_BASE="$srcdir/base"
    unset EDG_USE_SYSTEM_HEADERS
    cat > "$srcdir/smoke.cpp" <<'SMOKE'
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
        return printf ("%d\n", n) < 0 || 42 != n;
    }
}
SMOKE
    build/gcc-release/bin/eccp -A -x "$srcdir/smoke.cpp" -o "$srcdir/smoke"
    "$srcdir/smoke"
}

package() {
    cd edgcpp
    local base="$pkgdir/usr/lib/edgcpp"
    local b
    for b in cpfe cpfe-cp edg_munch edg_decode edg_prelink cdisp; do
        install -Dm755 "build/gcc-release/bin/$b" "$base/bin/$b"
    done
    install -Dm755 util/eccp.sh "$base/bin/eccp.sh"
    install -Dm644 "$srcdir/edg_eccp_config" "$base/edg_eccp_config"
    install -Dm644 build/gcc-release/lib/libC.a "$base/lib/libC.a"
    install -Dm644 "$srcdir/base/lib/predefined_macros.txt" \
            "$base/lib/predefined_macros.txt"
    cp -r --no-preserve=ownership include_c++ "$base/include"
    cp -r --no-preserve=ownership include_c99 "$base/include_c99"
    install -Dm755 "$srcdir/eccp" "$pkgdir/usr/bin/eccp"
    install -Dm644 LICENSE.txt \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

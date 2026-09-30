# Maintainer: Liviu Nicoara <lnicoara at thinkoid dot org>

pkgname=edgcpp-git
pkgver=r62396.90b6647
pkgrel=1
pkgdesc="The EDG C/C++ front end with its C-generating back end (eccp), prelinker and runtime"
arch=('x86_64')
url="https://edgcpp.org"
license=('Apache-2.0 WITH LLVM-exception')
# gcc compiles the C that eccp generates; edg_eccp_config links every
# program with libstdc++ and libgcc_s. namcap sees neither use.
depends=('bash' 'gcc' 'glibc' 'libgcc' 'libstdc++')
makedepends=('git' 'cmake' 'ninja' 'python')
provides=('edgcpp')
conflicts=('edgcpp')
# libC.a is the runtime eccp links into every program: keep it, and keep
# it free of LTO bytecode.
options=('staticlibs' '!lto')
source=("edgcpp::git+https://github.com/edgcpp/compiler.git"
        "eccp")
sha256sums=('SKIP'
            '81831901bda74b2bf54b94519f4953e773a385989404050dc1c3f9cf2169cf1c')

pkgver() {
    cd edgcpp
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd edgcpp
    # The runtime library is built by eccp itself, which reads its
    # configuration from $EDG_BASE.
    export EDG_BASE="$PWD/bases/docker/dev-env/gcc"
    # Build type None: makepkg's flags rule. Release would add -static,
    # -O3 and -flto; the macro configuration is the release one for any
    # type but Debug. Upstream links with mold, lld or gold when it finds
    # one, for link speed; the package links with the system linker.
    cmake --preset linux-gcc-release -DEDG_CPP_RT_LIBS=linux_x86_64 \
          -DCMAKE_BUILD_TYPE=None -DEDG_PREFERRED_LINKER=bfd
    cmake --build build/gcc-release
}

check() {
    cd edgcpp
    export EDG_BASE="$PWD/bases/docker/dev-env/gcc"
    cat > "$srcdir/smoke.cpp" <<'SMOKE'
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
        return 42 != n;
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
    install -Dm644 bases/docker/dev-env/gcc/edg_eccp_config \
            "$base/edg_eccp_config"
    install -Dm644 build/gcc-release/lib/libC.a "$base/lib/libC.a"
    install -Dm644 bases/docker/dev-env/gcc/lib/predefined_macros.txt \
            "$base/lib/predefined_macros.txt"
    cp -r --no-preserve=ownership include_c++ "$base/include"
    cp -r --no-preserve=ownership include_c99 "$base/include_c99"
    install -Dm755 "$srcdir/eccp" "$pkgdir/usr/bin/eccp"
    install -Dm644 LICENSE.txt \
            "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

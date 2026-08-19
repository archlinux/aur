pkgname=homerhevc-git
pkgver=3.0.r2.g825e370
pkgrel=1
pkgdesc="HOMER (Hevc Open Mpeg EncodeR) is an open-source HEVC encoder to encode YUV420 video sequences to the HEVC(H.265) stream format (git version)"
arch=('any')
url="https://www.homerhevc.com"
license=('LGPL2.1')
depends=()
makedepends=('git' 'make')
source=("git+https://github.com/jcasal-homer/HomerHEVC.git")
md5sums=('SKIP')

pkgver() {
  cd HomerHEVC/build/Linux

  git describe --long --tags \
    | sed -e 's/^[^_]*_//' \
    | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//g'
}

build() {
    cd HomerHEVC/build/Linux

    export CFLAGS="-O3 -march=native -mtune=native \
                    -funroll-loops -falign-functions=32 -falign-loops=32 -falign-jumps=32 \
                    -fno-math-errno -fno-trapping-math \
                    -fmerge-all-constants -fipa-pta -fipa-cp-clone \
                    -fpredictive-commoning -fgcse-after-reload -ftree-vectorize \
                    -fomit-frame-pointer -fno-plt -flto -fPIC -pipe -Wall"
    export CXXFLAGS="$CXXFLAGS"
    export LDFLAGS="-Wl,--icf=safe, -Wl,-O3 -Wl,--gc-sections -fuse-ld=lld -flto -fno-plt"

    make -j"$(nproc)"
}

package() {
    cd HomerHEVC

    # Install binary
    install -Dm755 build/Linux/homer_app/Release/homer_app \
        "$pkgdir/usr/bin/homer_app"

    # Install static library
    install -Dm644 build/Linux/homer_lib/Release/libhomer_lib.a \
        "$pkgdir/usr/lib/libhomer_lib.a"

    # Install license (LGPL 2.1)
    install -Dm644 src/license.txt \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

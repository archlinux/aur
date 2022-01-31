# Maintainer: Konsonanz <maximilian.lehmann@protonmail.com>
pkgname=gpgfrontend
pkgver=2.0.4
pkgrel=1
pkgdesc="OpenPGP crypto tool and gui frontend for modern GnuPG"
arch=('x86_64')
url="https://github.com/saturneric/GpgFrontend"
license=('GPL3')
depends=('boost' 'gnupg' 'gpgme' 'libassuan' 'libconfig' 'libgpg-error' 'qt5-base')
makedepends=('cmake' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz"
        "0000-link-against-shared.patch")
sha256sums=('c904497e44d2100a20607df0117d152a9470ec552f3cc92a665797cef81ea798'
            '8c2dc3835057119092a72846ed6cd0c91b923b04636221acd9da49684d6eeff9')

prepare() {
    cd "$srcdir/GpgFrontend-$pkgver"
    mkdir build

    patch -Np1 -i ../0000-link-against-shared.patch
}

build() {
    cd "$srcdir/GpgFrontend-$pkgver/build"

    cmake .. -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DGENERATE_LINUX_INSTALL_SOFTWARE=ON
    ninja
}

package() {
    cd "$srcdir/GpgFrontend-$pkgver/build"

    # TODO: ninja has no install target currently, check if will be added in future release
    cp -dr --no-preserve='ownership' \
        "$srcdir/GpgFrontend-$pkgver/build/release/gpgfrontend/usr" \
        "$pkgdir/usr"
}

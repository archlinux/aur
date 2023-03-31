# Maintainer: Matthias Mailänder <matthias@mailaender.name>
pkgname=openhv
pkgver=20230305
pkgrel=1
pkgdesc="An open-source pixel-art science-fiction real-time-strategy game."
arch=('any')
url="https://www.openhv.net"
license=('GPL3')
depends=('dotnet-sdk-6.0' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme'
         'gtk-update-icon-cache' 'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip')
options=(!debug)
source=("git+https://github.com/OpenHV/OpenHV.git#tag=${pkgver}"
        install.patch
        man.patch
        libs.patch)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd OpenHV

    patch --forward --strip=1 --input="${srcdir}/install.patch"
    patch --forward --strip=1 --input="${srcdir}/man.patch"
    patch --forward --strip=1 --input="${srcdir}/libs.patch"

    make version
}

build() {
  cd OpenHV

  make RUNTIME=net6 TARGETPLATFORM=unix-generic
}

package() {
  cd OpenHV

  make prefix=/usr TARGETPLATFORM=unix-generic DESTDIR="$pkgdir" install
}

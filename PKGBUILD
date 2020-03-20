# Based on uefitool-git
# Contributor: xsmile <sascha_r at gmx dot de>
# Contributor: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>

pkgname=uefitool
_pkgname=UEFITool
_tools=('UEFIPatch' 'UEFIReplace')
pkgver=0.27.0
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor and utilities'
arch=('armv7h' 'i686' 'x86_64')
url='https://github.com/LongSoft/UEFITool'
license=('BSD')
depends=('qt5-base')
makedepends=('git' 'qt5-base')
provides=(${pkgname}-git)
conflicts=(${pkgname}-git)
source=("https://github.com/LongSoft/UEFITool/archive/${pkgver}.tar.gz")
sha512sums=('97bcb465081b78704ac26f232f66e2c7b3e9b02fa7bfa3ad79dacc2ac1e37b40dbfb10d748ebd14ff00715b2045d77d511a83855972ec9d9fa84f0931e235be5')

_build() {
  qmake QMAKE_CFLAGS_RELEASE="$CFLAGS" QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"
  make
}

build() {
  # UEFITool
  cd "$srcdir/${_pkgname}-${pkgver}"
  _build
  # Other tools
  for tool in "${_tools[@]}"; do
    cd "$srcdir/${_pkgname}-${pkgver}/${tool}"
    _build
  done
}

package() {
  # UEFITool
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -d -m755 "$pkgdir/usr/bin/"
  install -D -m755 UEFITool "$pkgdir/usr/bin/"
  # Other tools
  for tool in "${_tools[@]}"; do
    install -D -m755 "$tool/$tool" "$pkgdir/usr/bin/${tool,,}"
  done
  # Install patches.txt
  install -D -m644 UEFIPatch/patches.txt "$pkgdir/usr/share/$pkgname/patches.txt"
  # License
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Based on uefitool-git by xsmile <>

pkgname=uefitool
_pkgname=UEFITool
_tools=('UEFIExtract' 'UEFIFind')
pkgver=A59
pkgrel=1
pkgdesc='UEFI firmware image viewer and editor and utilities'
arch=('armv7h' 'aarch64' 'i686' 'x86_64')
url='https://github.com/LongSoft/UEFITool'
license=('BSD')
depends=('qt5-base')
makedepends=('cmake')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('efcaebe644c43e9550d62a3b20885f9c6a7f0235a0ae6acd97ccf9c9fa9be868')

_cbuild() {
  cmake .
  cmake --build .
}

_qbuild() {
  qmake \
    QMAKE_CFLAGS_RELEASE="$CFLAGS" \
    QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS" \
    QMAKE_LFLAGS_RELEASE="$LDFLAGS"
  make
}

build() {
  cd "$_pkgname-$pkgver/$_pkgname"
  _qbuild
  cd ..

  for tool in "${_tools[@]}"; do
    cd "$tool"
    _cbuild
    cd ..
  done
}

package() {
  cd "${_pkgname}-${pkgver}"

  __tools=("${_pkgname}" "${_tools[@]}")
  for tool in "${__tools[@]}"; do
    install -Dm755 "$tool/$tool" "$pkgdir/usr/bin/${tool,,}"
  done

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

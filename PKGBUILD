# Maintainer: Ken Miller <ken plus aur at miller dot ec>
# Contributor: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Karel Louwagie <aur at karellouwagie dot net>
# Contributor: Serge Pavlyuk <flopss at gmail dot com>
# Contributor: phi-mah

pkgname=toggldesktop
pkgver=7.5.363
pkgrel=3
pkgdesc="Toggl time tracking software"
arch=('x86_64')
url="https://github.com/toggl-open-source/toggldesktop"
license=('BSD')
depends=(
  'libxss'
  'qt5-base'
  'qt5-webengine'
  'qt5-x11extras'
  'qt5-networkauth'
  'openssl'
  'poco'
  'lua'
  'jsoncpp'
)
makedepends=('cmake')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/toggl-open-source/toggldesktop/archive/v${pkgver}.tar.gz"
  "jsoncpp.patch"
)

sha512sums=(
  '9d1b70994d7d9853291544e6125f9e0aba9b10afb5097ee6ca510168cad5263b79fe61f5f572eec1b5ac38f29bfcd753b988a19a891a9ce284b5f8d3d70b5209'
  '05813df185163e1361d99cf24291bd44bdfefeee050b56f2923fb909c2c57d532e0a459cdaea96504ed10d27004fe3ee9f3c34ec35bcc9f9f2e064cccd8cfe77'
)

conflicts=('toggldesktop-bin' 'toggl-bin')

prepare() {
    cd "${pkgname}-${pkgver}"

    # patch to build
    patch -p1  < ../jsoncpp.patch
}

build() {
  mkdir -p build
  cd build
  cmake ../${pkgname}-${pkgver}\
    -DCMAKE_INSTALL_PREFIX=/usr\
    -DTOGGL_VERSION:STRING="${pkgver}"\
    -DTOGGL_PRODUCTION_BUILD=ON\
    -DTOGGL_ALLOW_UPDATE_CHECK=ON\
    -DUSE_BUNDLED_LIBRARIES=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install

  cd "../${pkgname}-${pkgver}"

  # license file in standard location
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

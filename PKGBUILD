# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Contributor: Karel Louwagie <karel@louwagie.net>
# Contributor: Serge Pavlyuk <flopss at gmail dot com>
# Contributor: phi-mah

pkgname=toggldesktop
pkgver=7.4.1102
pkgrel=1
pkgdesc="Toggl time tracking software"
arch=('x86_64')
url="https://github.com/toggl-open-source/toggldesktop"
license=('BSD')
depends=(
  'libxss'
  'qt5-base'
  'qt5-webengine'
  'qt5-x11extras'
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
  '73a6465337d12776afb5b7f0ba204dd50e82bd17126a103adc8fb5c10672eedcad4006f7e0e9968d43c1ab2493b3e70484e670b6c1e94108a66661e3dd886954'
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

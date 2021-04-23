# Maintainer: Jules Sam. Randolph <jules.sam.randolph@gmail.com>
# Contributors: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>
#               Dimitris Kiziridis <ragouel at outlook dot com>


pkgname=flipper
pkgver=0.86.0
pkgrel=1
pkgdesc="A desktop debugging platform for mobile developers"
arch=('x86_64')
url='https://fbflipper.com'
license=('MIT')
depends=('gtk3'
         'libsecret'
         'nss'
         'nodejs'
         'openssl')
optdepends=('watchman: Required for a fully functional install'
            'android-sdk: Required for a fully functional install')
makedepends=('git' 'yarn' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/facebook/flipper/archive/v${pkgver}.tar.gz")
sha256sums=('083445f925f9f26ee7a53f51e28ce5b3bedc7dc28dcca72f9e6466487ec8b5bc')
conflicts=('flipper-bin')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/desktop"
  mkdir -p ${srcdir}/yarn_cache
  yarn --cache-folder=${srcdir}/yarn_cache
  # See https://github.com/electron-userland/electron-builder/issues/2665#issuecomment-370452193
  NO_PROXY=* yarn build --linux
}

package() {
  mkdir -p "${pkgdir}/opt/flipper"
  cp -aR "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/." "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/flipper/flipper" "$pkgdir/usr/bin/flipper"
  gendesk -f -n --pkgname "flipper" --pkgdesc "${pkgdesc}" --exec="flipper" --categories=Application\;Development --icon flipper
  install -Dm644 "${srcdir}/flipper.desktop" "${pkgdir}/usr/share/applications/flipper.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/desktop/static/icon.png" "${pkgdir}/usr/share/pixmaps/flipper.png"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

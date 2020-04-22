# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>

pkgname=flipper
pkgver=0.38.0
pkgrel=1
pkgdesc="A desktop debugging platform for mobile developers"
arch=('any')
url='https://fbflipper.com/'
license=('MIT')
depends=('gtk3'
    		 'libsecret'
    		 'libxss'
    		 'nss')
optdepends=('watchman: An inotify-based file watching and job triggering command line utility'
			      'android-sdk: Android debugging support')
makedepends=('git' 'yarn' 'gendesk')
source=("https://github.com/facebook/flipper/archive/v${pkgver}.tar.gz")
sha512sums=('a7b2534834c57e3c54b74927623c13d1a65164bc2ec1a4a18d1f3ff50575417cae1810593788704850c6deff4f3a017ab276a829cb803c73c70465fa3c73c352')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/desktop"
  mkdir -p ${srcdir}/yarn_cache
  yarn --cache-folder=${srcdir}/yarn_cache
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/desktop"
  yarn build --cache-folder=${srcdir}/yarn_cache --linux --version $pkgver 
}

package() {
  mkdir -p "${pkgdir}/opt/flipper"
  cp -aR "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/." "${pkgdir}/opt/flipper"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/flipper/flipper" "$pkgdir/usr/bin/flipper"
  gendesk -f -n --pkgname "flipper" --pkgdesc "${pkgdesc}" --exec="flipper" --categories=Application\;Development --icon flipper
  install -Dm644 "${srcdir}/flipper.desktop" "${pkgdir}/usr/share/applications/flipper.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/desktop/static/icon.png" "${pkgdir}/usr/share/pixmaps/flipper.png"
}
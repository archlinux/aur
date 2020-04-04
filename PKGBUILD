# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: renyuneyun (Rui ZHAO) <renyuneyun@gmail.com>

pkgname=flipper
pkgver=0.35.0
pkgrel=2
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
makedepends=('git' 'yarn')
source=("https://github.com/facebook/flipper/archive/v${pkgver}.tar.gz"
		'flipper.desktop')
md5sums=('664a436410b002c86acb8ff9f3bfbc85'
		 '3835f5d90a60f80dc644259c9aa713e5')

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
  ln -s "/opt/flipper/flipper-project" "$pkgdir/usr/bin/flipper"
  install -Dm644 "${srcdir}/flipper.desktop" "${pkgdir}/usr/share/applications/flipper.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-unpacked/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/flipper.png"
}
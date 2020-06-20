# Maintainer: Daniel Maslowski <info@orangecms.org>

pkgname=pslab-desktop
pkgver=2.1.0
pkgrel=1
pkgdesc="PSLab Desktop App"
arch=('x86_64')
url="https://pslab.io"
license=('GPL3')
depends=('electron' 'python-pslab-git')
makedepends=('git' 'npm')
provides=("${pkgname}")
conflicts=("${pkgname}-latest")
install=
source=(
  "https://github.com/fossasia/${pkgname}/archive/v${pkgver}.tar.gz"
  "pslab.sh"
)
sha256sums=('c9ca59a8fef8aaa2ff5e716b4eccdd27f249c92f9a4acefef0fb4215c3e99b6b'
            '840e44427a4c582bfd0b6be431187cd77c85acf44b44514ea7d61143824bca1b')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	npm install
	npm run react-build
	npm run pack
  # Avoid having Electron in the final build, have it stripped, which takes a
  # long time, and use it from the system instead.
  rm -r "dist/linux-unpacked/resources/app/node_modules"
  rm -rf ../app
  mv dist/linux-unpacked/resources/app ../
  cp package-lock.json ../app/
  cd ../app/
  rm -rf "../${pkgname}-${pkgver}"
  npm install --production
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/"
  cp -a app "$pkgdir/opt/pslab"
  install -Dm 755 pslab.sh "$pkgdir/usr/bin/pslab"
  # TODO: desktop file
  #install -Dm 755 pslab.desktop "$pkgdir/usr/share/applications/pslab.desktop"
}

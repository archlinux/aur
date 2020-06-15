# Maintainer: our Name <youremail@domain.com>

_appname=pslab-desktop
pkgname=pslab-desktop-latest
pkgver=2.0.0
pkgrel=1
pkgdesc="PSLab Desktop App - latest version"
arch=('x86_64')
url="https://pslab.io"
license=('GPL3')
depends=('electron' 'python-pslab-git')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%}")
install=
source=(
  "https://github.com/fossasia/$_appname/archive/development.tar.gz"
  "pslab.sh"
)
sha256sums=('98d1b444b6a1c8f53ae222db172f6beb5f0b9593d826d719a9f4b705843dce66'
            '840e44427a4c582bfd0b6be431187cd77c85acf44b44514ea7d61143824bca1b')

build() {
	cd "$srcdir/${_appname}-development"
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
  rm -rf "../${_appname}-development"
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

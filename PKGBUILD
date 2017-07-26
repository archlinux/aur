# Maintainer: Your Name <youremail@domain.com>
pkgname=terminus-terminal-git
_pkgname=terminus
pkgver=v1.0.0.alpha.22.r6.de29e34
pkgrel=1
pkgdesc="A terminal for a more modern age"
arch=('x86_64')
url="https://github.com/Eugeny/terminus"
license=('MIT')
depends=('nodejs')
makedepends=('git' 'npm' 'yarn') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("terminus-terminal")
conflicts=("terminus-terminal")
replaces=('terminus-terminal')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${_pkgname}"
  npm install shelljs npmlog
  node ./scripts/install-deps.js
}

build() {
	cd "$srcdir/${_pkgname}"
  yarn install
  node ./scripts/build-native
  node ./scripts/build-linux
}

package() {
	cd "$srcdir/${_pkgname}"
  appdir=/opt/${_pkgname}
  install -d "${pkgdir}"${appdir}
  cp -r dist/linux-unpacked/* "${pkgdir}"${appdir}
  unp dist/*.deb
  unp data.tar.xz
  cp -r usr/ $pkgdir
  install -d $pkgdir/usr/bin
  ln -s /opt/$_pkgname/$_pkgname $pkgdir/usr/bin/$_pkgname
}

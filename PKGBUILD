# Maintainer: Youngbin Han <sukso96100@gmail.com>
# Submitter: Youngbin Han <sukso96100@gmail.com>

pkgname=irccloud-electron-git
_pkgname=IRCCloud
pkgver=42.13d2e17
pkgrel=1
pkgdesc="Mac App, Win App and Linux app for IRCCloud. (An Electron wrapper for IRCCloud.) "
arch=('any')
url="https://github.com/dalinaum/${_pkgname}"
license=('MIT')
depends=('nodejs')
makedepends=('nodejs' 'npm' 'git')
source=("${_pkgname}"::"git+https://github.com/dalinaum/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  sed irccloud-election.desktop.in > irccloud-election.desktop
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm install
  npm run build
  rm -rf dist
  mkdir dist
  ./generate-icon
  ./build-linux.js ${_pkgname} $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}"
  install -Dm644 irccloud-election.desktop "$pkgdir/usr/share/applications/irccloud-election.desktop"
  install -Dm644 "${srcdir}/${_pkgname}" "$pkgdir/usr/share/irccloud-election"
}

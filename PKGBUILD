# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=cqrlog-git
_pkgname=cqrlog
_authorname=ok2cqr
pkgver=1.9.0
pkgrel=1
pkgdesc="An advanced ham radio logger using MariaDB - GIT version."
arch=('i686' 'x86_64')
url="http://www.cqrlog.com"
license=('GPL')
depends=('xdg-utils'
	 'desktop-file-utils'
	 'gtk2'
	 'mariadb')
makedepends=('lazarus'
             'git')
optdepends=('winkeydaemon: usb cw xmit'
	    'cwdaemon: transmitting cw'
	    'masterscp: supercheckpartial files'
	    'cty: country files'
	    'bigcty: contest version country files'
	    'hamlibs: rig control'
	    'trustedqsl: upload logs'
 	    'hamradio-menus: XDG compliant menuing'
	    'xplanet: gui location'
	    'glabels: print qsl labels')
provides=('cqrlog')
conflicts=('cqrlog' 'cqrlog-source')
install=$_pkgname.install
source=("${_pkgname}::git://github.com/${_authorname}/${_pkgname}.git")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

_gitname=master

prepare() {
	cd "$srcdir"
	msg "Cloning into build directory...."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_pkgname" "$srcdir/$_gitname-build"

	cd "$srcdir/$_gitname-build"
	sed -i 's/--ws=gtk2 src/--lazarusdir=\/usr\/lib\/lazarus --ws=gtk2 src/g' Makefile
}

build() {
	cd "$srcdir/$_gitname-build"
	msg "Starting build..."

	make
}

package() {
	cd "$srcdir/$_gitname-build"
	msg "Starting packaging..."

	make DESTDIR="$pkgdir/" install
}
md5sums=('SKIP')
sha256sums=('SKIP')

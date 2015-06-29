# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>
# Contributor: AdriÃƒÂ¡n Chaves FernÃƒÂ¡ndez, aka Gallaecio <adriyetichaves@gmail.com>

pkgname=speed-dreams-svn
pkgver=5400
pkgrel=1
pkgdesc="Speed Dreams is a fork of TORCS which aims to implement exciting new features, improving visual and physics realism."
arch=('i686' 'x86_64')
url="http://speed-dreams.sourceforge.net/"
license=('GPL2')
depends=('freealut' 'freeglut' 'libpng' 'libxi' 'libxmu' 'libxrandr' 'plib>=1.8.3' 'libjpeg' 'zlib' 'enet')
makedepends=('cmake' 'svn')
source=("${pkgname}.desktop")
md5sums=('9a0a63c897668ee18bcd6c5d65fe2111')
_svntrunk=https://speed-dreams.svn.sourceforge.net/svnroot/speed-dreams/trunk
_svnmod=speed-dreams-svn

build() {
	msg "\033[31;1m Note that the disk space required to build this package is about 10GB. AUR helpers using a subfolder of /tmp as build dir could thus cause build problems! You are therefore recommended to use makepkg in a directory on a partition with enough disk space. \033[0m"
   cd $srcdir
   msg "Connecting to Speed-Dreams SVN server...."
   svn co $_svntrunk $_svnmod --config-dir ./
	msg "SVN checkout done or server timeout"
   msg "Starting make..."
   cd $_svnmod
   cmake . || return 1
   make || return 1
}

package() {
	cd $srcdir/$_svnmod
	make DESTDIR=$pkgdir install || return 1
	install -D -m644 "${pkgdir}/usr/local/share/games/speed-dreams-2/data/icons/icon.png" "${pkgdir}/usr/share/pixmaps/speed-dreams-2.png" && \
	install -D -m644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/speed-dreams-svn.desktop"
}

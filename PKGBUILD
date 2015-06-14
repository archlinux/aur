# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Kaos < gianlucaatlas_AT_gmail_DOT_com >

pkgname=xf86-input-synaptics-git
pkgver=20121007
pkgrel=2
pkgdesc="Synaptics driver for notebook touchpads"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/wiki/"
license=('custom')
depends=('libxi>=1.2.1' 'libxtst')
makedepends=('pkgconfig' 'xorg-server' 'git' 'xorg-server-devel')
provides=('synaptics' 'xf86-input-synaptics')
conflicts=('synaptics')
groups=('xorg-input-drivers')
options=('!libtool' 'zipman')
source=('50-synaptics.conf.patch')
sha1sums=('587b85127187a515345f81bb3e363cba64ac11a8')

_gitroot="git://anongit.freedesktop.org/xorg/driver/xf86-input-synaptics"
_gitname="xf86-input-synaptics"

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	./autogen.sh
	./configure --prefix=/usr --with-xorg-conf-dir=/etc/X11/xorg.conf.d
	make
	patch conf/50-synaptics.conf < $srcdir/50-synaptics.conf.patch
}
package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="${pkgdir}" install
	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
} 

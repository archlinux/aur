# Contributor: MutantMonkey <mutantmonkey@gmail.com>
pkgname=pianobar-git
pkgver=20130210
pkgrel=1
pkgdesc="A free/open-source, console-based replacement for Pandora's Flash player"
url="http://6xq.net/0017"
arch=('i686' 'x86_64')
license=('MIT')
depends=('libao' 'faad2' 'libmad' 'readline' 'json-c')
optdepends=('libmad')
makedepends=('pkgconfig>=0.9' 'git' 'automake')
provides=('pianobar')
conflicts=('pianobar')
source=()
md5sums=()
sha256sums=()

_gitroot="git://github.com/PromyLOPh/pianobar.git"
_gitname="pianobar"

build() {
	cd $srcdir
	msg "Connecting to the pianobar git repository..."

	if [ -d $srcdir/$_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf $srcdir/$_gitname-build	
	cp -r $srcdir/$_gitname $srcdir/$_gitname-build
	cd $srcdir/$_gitname-build/

	make || return 1
	make DESTDIR=$pkgdir PREFIX=/usr install || return 1

	install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/" || return 1
}

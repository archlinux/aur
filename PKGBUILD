# Mainteneur: sputnick <gilles DOT quenot AT gmail DOT com>
# Contributor: cryptocrack <archlinux AT cryptocrack DOT de>
pkgname=xwax-jack
_ownedpkgname=xwax
pkgver=1.7
pkgrel=1
pkgdesc="Open-source digital vinyl emulation software."
arch=('i686' 'x86_64')
url="http://www.xwax.co.uk/"
license=("GPL")
depends=('ttf-dejavu' 'alsa-lib' 'jack')
makedepends=('sdl' 'sdl_ttf')
optdepends=(
	"oggdeg: for OGG import"
	"faad: for AAC import"
	"cdparanoia: for CD import"
	"mpg123: for MP3 import"
	"flac: for FLAC import"
	"ffmpeg: for video fallback import"
)
provides=('xwax')
conflicts=('xwax')

source=(http://www.xwax.co.uk/releases/$_ownedpkgname-$pkgver.tar.gz)
md5sums=('0be222a89d58fc6c7167a6fcbdab7e09')

build() {
	cd $startdir/src/$_ownedpkgname-$pkgver

	# Patching rig.c to use default Archlinux rtprio value ( see /etc/security/limits.conf )
	sed -i 's/^#define REALTIME_PRIORITY 80/#define REALTIME_PRIORITY 65/' ./rig.c

	./configure '--enable-alsa' '--enable-jack' '--prefix /usr'
	make PREFIX=$pkgdir/usr EXECDIR=$pkgdir/usr/share/${pkgname} || return 1
}

package() {
	cd $startdir/src/$_ownedpkgname-$pkgver
	make EXECDIR=$pkgdir/usr/share/${pkgname} PREFIX=$pkgdir/usr install || return 1
}

# vim:ts=4:sw=4 

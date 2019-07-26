# Maintainer: Johannes Arnold <johannes.arnold@stud.uni-hannover.de>
pkgname=shairport-sync-git
pkgver=3.3.2.r0.gb4c54fc
pkgrel=1
pkgdesc="AirPlay audio player. Shairport Sync adds multi-room capability with Audio Synchronisation"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/mikebrady/shairport-sync"
license=('custom')
depends=('openssl' 'avahi' 'libdaemon' 'autoconf' 'automake' 'libtool' 'popt' 'libconfig')
optdepends=(	'pulseaudio: PulseAudio support'
		'libsoxr: libsoxr-based resampling'
		'alac-git: Apple ALAC decoder'
		)
provides=('shairport-sync')
conflicts=('shairport-sync')
source=("git+https://github.com/mikebrady/shairport-sync.git")
md5sums=(SKIP)

_gitname="shairport-sync"

pkgver() {
	cd "$srcdir/$_gitname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_gitname"
	autoreconf -i -f
	./configure --prefix=/usr --sysconfdir=/etc --with-alsa --with-pa --with-avahi --with-ssl=openssl --with-metadata --with-soxr --with-systemd
	make
}

package() {
	cd "$srcdir/$_gitname"
	install -Dm644 LICENSES "$pkgdir/usr/share/licenses/$pkgname/LICENSES"
	make DESTDIR="$pkgdir/" install
}

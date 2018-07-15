# Maintainer: Bart De Vries <devriesb@gmail.com>

pkgname=snapcast
pkgver=0.15.0
pkgrel=1
pkgdesc="Synchronous multi-room audio player"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/badaix/snapcast"
license=('GPL')
groups=()
depends=(alsa-lib avahi libvorbis flac)
makedepends=(git alsa-utils)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/default/snapserver' 'etc/default/snapclient')
options=()
install=snapcast.install
changelog=
source=("git+https://github.com/badaix/${pkgname}.git#tag=v${pkgver//_/-}")
noextract=()
validpgpkeys=()
md5sums=('SKIP')

prepare() {
        cd "$pkgname"
        cd externals
        # update all submodules
        git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm755 -g root -o root server/snapserver ${pkgdir}/usr/bin/snapserver
	install -Dm644 -g root -o root server/snapserver.1 ${pkgdir}/usr/share/man/man1/snapserver.1

	install -Dm755 -g root -o root client/snapclient ${pkgdir}/usr/bin/snapclient
	install -Dm644 -g root -o root client/snapclient.1 ${pkgdir}/usr/share/man/man1/snapclient.1

	install -Dm644 -g root -o root server/debian/snapserver.service ${pkgdir}/usr/lib/systemd/system/snapserver.service
	install -Dm644 -g root -o root server/debian/snapserver.default ${pkgdir}/etc/default/snapserver
	install -Dm644 -g root -o root client/debian/snapclient.service ${pkgdir}/usr/lib/systemd/system/snapclient.service
	install -Dm644 -g root -o root client/debian/snapclient.default ${pkgdir}/etc/default/snapclient
}


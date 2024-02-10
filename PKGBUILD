# Contributor: Anton Leontiev <scileont /at/ gmail.com>
pkgname=nmead-git
pkgver=r3.b4ae028
pkgrel=1
pkgdesc='Service that distributes NMEA data over the network'
arch=('i686' 'x86_64' 'arm')
url='https://github.com/chriscokid/nmead'
license=('GPL3')
source=("${pkgname%-git}::git+https://github.com/chriscokid/nmead.git"
	nmead.service nmead.conf.d)
backup=('etc/conf.d/nmead')
md5sums=('SKIP'
         '4d2505768521deeae59bf1b3b928c257'
         'd04be962e193de6b7a7b6a72ef7f88cf')

# Taken from https://wiki.archlinux.org/title/VCS_package_guidelines#Git
pkgver() {
	cd ${pkgname%-git}
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | \
			sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" \
				   "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd ${pkgname%-git}
	make CC=gcc LIBS=-lpthread
}

package() {
	install -Dm755 ${pkgname%-git}/nmead "$pkgdir/usr/bin/nmead"
	install -Dm644 nmead.service "$pkgdir/usr/lib/systemd/system/nmead.service"
	install -Dm644 nmead.conf.d "$pkgdir/etc/conf.d/nmead"
}

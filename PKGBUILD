# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=bees-git
pkgver=v0.5.r161.gf053e0e
pkgrel=1
pkgdesc="Best-Effort Extent-Same, a btrfs deduplicator daemon"
arch=('any')
url="https://github.com/Zygo/bees"
license=('GPL3')
depends=()
makedepends=('git' 'make' 'gcc' 'markdown')
source=("$pkgname"::'git://github.com/zygo/bees.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make
	make scripts
}

package() {
	cd "$pkgname"

	make install DESTDIR="${pkgdir}"

	mkdir -p "${pkgdir}/usr/bin/"

	if [ -f "${pkgdir}/usr/sbin/beesd" ]; then
		mv -v "${pkgdir}/usr/sbin/beesd" "${pkgdir}/usr/bin/beesd"
	fi

	if grep "$pkgname" "${pkgdir}/usr/bin/beesd"; then
		exit 1
	fi

	find ${pkgdir} -empty -delete -print
}

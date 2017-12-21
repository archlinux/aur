# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=bees-git
pkgver=v0.4.r49.gbfb768a
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

	make install PREFIX="${pkgdir}"
	make install_scripts PREFIX="${pkgdir}"

	mkdir -p "${pkgdir}/usr/bin/"

	if [ -f "${pkgdir}/usr/sbin/beesd" ]; then
		mv -v "${pkgdir}/usr/sbin/beesd" "${pkgdir}/usr/bin/beesd"
		sed -i -e 's#/usr/sbin/beesd#/usr/bin/beesd#g' "${pkgdir}/lib/systemd/system/beesd@.service"
	fi

	if grep "$pkgname" "${pkgdir}/usr/bin/beesd"; then
		exit 1
	fi

	mkdir -p "${pkgdir}/usr/lib/systemd/system/"
	mv -v "${pkgdir}/lib/systemd/system/beesd@.service" "${pkgdir}/usr/lib/systemd/system/"
	find ${pkgdir} -empty -delete -print
}

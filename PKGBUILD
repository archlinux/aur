# Maintainer: Janne Heß <jannehess@gmail.com>

pkgname=multistrap
pkgver=2.2.9
pkgrel=2
pkgdesc='A more flexible debootstrap'
url='https://packages.qa.debian.org/m/multistrap.html'
license=('GPL3')
depends=('perl' 'perl-config-auto' 'perl-parse-debian-packages')
makedepends=('po4a')
conflicts=("${pkgname}-git")
source=("git+https://git.dgit.debian.org/multistrap#tag=debian/${pkgver}")
sha512sums=('SKIP')
arch=('any')

build() {
	cd "${srcdir}/${pkgname}"

	make install docbuild
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 multistrap "${pkgdir}/usr/bin/multistrap"
	# Other scripts
	install -Dm755 check-deps.sh "${pkgdir}/usr/share/multistrap/check-deps.sh"
	install -Dm755 device-table.pl "${pkgdir}/usr/share/multistrap/device-table.pl"
	# Locales
	cp -rp "debian/multistrap/usr" "${pkgdir}/"
	# man
	cp -rp doc/multistrap/man "${pkgdir}/usr/share/"
	# Bash completion
	install -Dm644 bash/multistrap "${pkgdir}/usr/share/bash-completion/completions/multistrap"
	# Examples
	mkdir -p "${pkgdir}/usr/share/doc/multistrap/examples"
	cp -rp examples/* "${pkgdir}/usr/share/doc/multistrap/examples"
	cd "${pkgdir}/usr/share/doc/multistrap/examples"
	for f in {trusty{,-ports},wheezy,squeeze,jessie,stretch,sid,chroot}.conf chroot.sh; do
		mv "${f}" ..
	done
}


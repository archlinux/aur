# Maintainer: Frederic Boltz <frederic.boltz@gmail.com>

pkgname=nct6687d-dkms-git
pkgver=r13.b7a988d
pkgrel=1
pkgdesc="Nuvoton module for NCT6687-R synced with latest upstream kernel."
arch=('i686' 'x86_64')
url="https://github.com/Fred78290/nct6687d"
license=('GPLv2')
makedepends=('git')
depends=('dkms')
source=("${pkgname}::git://github.com/Fred78290/nct6687d.git"
        "dkms.conf.in")
sha256sums=('SKIP'
            '22c57de66af431804e9f4e9e4fd435f6f24d7d0b5b562b5574b331f5919e5915')

pkgver() {
	cd "${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"

	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -a LICENSE README* *.c "${pkgdir}/usr/src/${pkgname}-${pkgver}"

	sed -e "s/(shell uname -r)/{TARGET}/" Makefile > \
		"${pkgdir}/usr/src/${pkgname}-${pkgver}/Makefile"

	sed -e "s/@PACKAGE_VERSION@/${pkgver}/" "${srcdir}/dkms.conf.in" > \
		"${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}

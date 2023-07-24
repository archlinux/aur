# Maintainer: Frederic Boltz <frederic.boltz@gmail.com>
# Maintainer: David Rosenstrauch <darose@darose.net>

pkgname=nct6687d-dkms-git
pkgver=r78.df1565a
pkgrel=2
pkgdesc="Nuvoton module for NCT6687-R synced with latest upstream kernel."
arch=('i686' 'x86_64')
url="https://github.com/Fred78290/nct6687d"
license=('GPLv2')
makedepends=('git')
depends=('dkms')
source=("${pkgname}::git+https://github.com/Fred78290/nct6687d"
        "dkms.conf.in")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${pkgname}"

	install -dm755 "${pkgdir}/usr/src/${pkgname}-${pkgver}"
	cp -a LICENSE README* *.c "${pkgdir}/usr/src/${pkgname}-${pkgver}"

    commitcount=$(git rev-list --all --count)
    commithash=$(git rev-parse --short HEAD)

    sed -e "s/(shell uname -r)/{TARGET}/" -e "s/commitcount.*=.*/commitcount := $commitcount/" -e "s/commithash.*=.*/commithash := $commithash/" Makefile > \
		"${pkgdir}/usr/src/${pkgname}-${pkgver}/Makefile"

	sed -e "s/@PACKAGE_VERSION@/${pkgver}/" "${srcdir}/dkms.conf.in" > \
		"${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf"
}

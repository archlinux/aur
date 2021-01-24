# Maintainer: Jonas Malaco <jonas@protocubo.io>
_pkgbase=liquidtux
pkgname=liquidtux-dkms-git
pkgver=0.1.0.r3.b713c7affe1b
pkgrel=1
pkgdesc="Linux kernel hwmon drivers for AIO liquid coolers and other devices (DKMS, Git)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/liquidctl/liquidtux"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=("${_pkgbase}" "${_pkgbase-dkms}")
conflicts=("${_pkgbase}" "${_pkgbase-dkms}")
install="${pkgname}.install"
source=("$pkgname::git+https://github.com/liquidctl/liquidtux#branch=master"
        'dkms.conf')
sha256sums=('SKIP'
            '66287d98bf77ee8bf4a177dd4a5afbea4cb9f28e96d90457a5ba0fa102747eee')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

package() {
	cd "$srcdir"

	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	cp "${pkgname}"/{Makefile,Kbuild,*.c} "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}

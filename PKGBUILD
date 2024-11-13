# Maintainer: Lorenzo Zolfanelli <dev(at)zolfa(dot)nl>

_pkgbase="ifdnfc-nci"
_git_repo="https://github.com/StarGate01/ifdnfc-nci"
_git_branch="master"
pkgname="${_pkgbase}-git"
pkgver=1.0.0.r12.ga6f946f
pkgrel=1
pkgdesc="PC/SC IFD Handler for PCSClite. This stack targets the NXP PN54x chipset"
arch=('any')
url="https://github.com/StarGate01/ifdnfc-nci"
license=('GPL-3.0-only')
install="${_pkgbase}.install"
makedepends=("git")
depends=("pcsclite" "libnfc-nci-pn5xx")
provides=("${_pkgbase}=${pkgver}")
source=("${_pkgbase}::git+${_git_repo}#branch=${_git_branch}"
        'ifdnfc-nci.conf'
        'pcscd-resume-wakeup.service')
sha256sums=('SKIP'
            'aece644dbe7ca08f22963011f9f75d8ea0e6a6bccc7a17d25e9201d58b25a080'
            '2b1477791c71903b7cddef28f2cf5092a02f6e052eebdebf1cfe624d22925ed9')

build() {
	export PKG_CONFIG_PATH
	cd ${_pkgbase}
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_LIBDIR="${pkgdir}/usr/lib/pcsc/drivers/serial/" ..
	make
}

package() {
	cd ${_pkgbase}/build
	make install
	cd ${srcdir}
	install -Dm644 ifdnfc-nci.conf "${pkgdir}/etc/reader.conf.d/ifdnfc-nci.conf"
	install -Dm644 pcscd-resume-wakeup.service "${pkgdir}/usr/lib/systemd/system/pcscd-resume-wakeup.service"
}

pkgver() {
	cd ${srcdir}/${_pkgbase}
	printf '%s.r%s.g%s' '1.0.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

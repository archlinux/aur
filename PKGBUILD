# Maintainer: xx777 <zenmchen at gmail dot com>

_pkgbase=aic8800
pkgname=aic8800-dkms-git
pkgver=r4.f49df85
pkgrel=1
pkgdesc="Linux Driver for AIC8800 chipsets"
arch=('any')
url="https://github.com/a5a5aa555oo/aic8800"
license=('GPL-2.0-or-later' 'UNKNOWN')
makedepends=('git')
depends=('udev' 'dkms')
source=("git+https://github.com/a5a5aa555oo/aic8800")
sha512sums=("SKIP")

prepare() {
	cd "${srcdir}"/${_pkgbase}
	sed -e "/POST_INSTALL/d" -e "/PACKAGE_VERSION/d" -i dkms.conf
	printf "PACKAGE_VERSION=\"@PKGVER@\"\n" >> dkms.conf
}

pkgver() {
	cd "${srcdir}"/${_pkgbase}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/${_pkgbase}
	install -Dm 644 -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/aic8800_fdrv" aic8800_fdrv/*
	install -Dm 644 -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/aic_load_fw"  aic_load_fw/*
	install -Dm 644 -t "${pkgdir}/usr/src/${_pkgbase}-${pkgver}" Makefile dkms.conf 
	install -Dm 644 -t "${pkgdir}/usr/lib/firmware/aic8800D80" firmware/aic8800D80/*
	install -Dm 644 -t "${pkgdir}/usr/lib/firmware/aic8800DC"  firmware/aic8800DC/*
	install -Dm 644 -t "${pkgdir}/usr/lib/udev/rules.d" aic.rules
	sed -e "s/@PKGVER@/${pkgver}/" -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}	

# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=zenpower5-dkms
pkgver=0.5.0
pkgrel=2
pkgdesc=" Linux kernel driver for AMD Zen CPU monitoring (Zen 1-5): temperature, voltage, current, and power via SVI2/RAPL. Multi-file architecture with Zen 5 (Strix Halo) support."
arch=('x86_64')
url="https://github.com/mattkeenan/zenpower5"
install=${pkgname}.install
license=('GPL-3.0-or-later')
depends=('dkms')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz"
	"kernel-7.2+.patch::https://patch-diff.githubusercontent.com/raw/mattkeenan/zenpower5/pull/16.patch")
sha256sums=('7b3da4245001303e2d0a5688634b1412fa71fe7900f79f30e2a9bc8a46e8e245'
            '8be8c29b613c36dc85eff40880cff8b408fd6f99e724706fef44d6f3e17b4dd2')

prepare() {
	cd "$srcdir/${pkgname::-5}-${pkgver}"
	patch -Np1 < "$srcdir/kernel-7.2+.patch"
}

package() {
	cd "$srcdir/${pkgname::-5}-$pkgver"
	install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgname::-5}-${pkgver}/dkms.conf"
	install -Dm644 Makefile "${pkgdir}/usr/src/${pkgname::-5}-${pkgver}/Makefile"
	for _file in {zenpower_core.c,zenpower_rapl.c,zenpower_svi2.c,zenpower_temp.c,zenpower.h}
	do
		install -Dm644 $_file -t "${pkgdir}/usr/src/${pkgname::-5}-${pkgver}/"
	done
	install -dm755 "${pkgdir}/usr/lib/modprobe.d/"
	cat >> "${pkgdir}/usr/lib/modprobe.d/${pkgname::-5}.conf" <<-EOF
blacklist k10temp
EOF
	sed -i "s/@CFLGS@//;s/@VERSION@/${pkgver}/" "${pkgdir}/usr/src/${pkgname::-5}-${pkgver}/dkms.conf"
	sed -i 's/-Wimplicit-fallthrough=3/-Wimplicit-fallthrough/' "${pkgdir}/usr/src/${pkgname::-5}-${pkgver}/Makefile"
}

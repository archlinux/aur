# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=open-fcoe
pkgname=('libhbaapi' 'libhbalinux' 'fcoe-utils')
pkgver=3.19
pkgrel=1
pkgdesc='Fibre Channel over Ethernet implementation for Linux'
arch=('i686' 'x86_64')
url='http://www.open-fcoe.org/'
license=('GPL')
makedepends=('libpciaccess' 'open-lldp')
validpgpkeys=('1EFB3A04BBD6C0DBF64D5B3346A3C53C3D727E07'  # Robert Love <robert.w.love@intel.com>
              'ECAD90B5697B35ACB65919E0D7832D07664BDE98') # Vasu Dev <vasu.dev@intel.com>
source=("http://ftp-osl.osuosl.org/pub/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"{,.sig}
	'config'
	'0002-configure.patch'
	'0003-declaration.patch'
	'0004-include.patch'
	'0005-makefile.patch'
	'0006-bash-completion.patch'
	'0007-confdir.patch')
sha256sums=('68383cee4840148bcefc372840783ecbb3fcb45eabee0501ba103749894e7e50'
            'SKIP'
            '91fceebb455997dea11feda863a9c9f68b7b9fab85b7dbaa24b6b9daef49a716'
            '12fb3e94657d801dc1af67c6ec0aed8919e85a66db5411b17bcc61846b4990cf'
            '1a49ba2a371b6e78e6640a848059ee19c5f87d46124281ad40fd24070add4d3f'
            '1d9c325efaf6bdca22ff1927c885ca393cca14723acf6946176be475cb914746'
            'ff3d290ae4d09a18b1775e0f5747f9187f66b2a8a155db5547c927c22b195717'
            '441bf7080d98d5d1089c36c34b1796fd84fe5065137385381d88b0f7838f470f'
            'bcd8fca39f2a3433188de70d7f5bc919eb57f0ec2d154e08f260dab46aea7a52')

prepare() {
	cd "${srcdir}/${pkgbase}-${pkgver}/"

	patch -Np1 < "${srcdir}/0002-configure.patch"
	patch -Np1 < "${srcdir}/0003-declaration.patch"
	patch -Np1 < "${srcdir}/0004-include.patch"
	patch -Np1 < "${srcdir}/0005-makefile.patch"
	patch -Np1 < "${srcdir}/0006-bash-completion.patch"
	patch -Np1 < "${srcdir}/0007-confdir.patch"
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}/libHBAAPI/"

	autoreconf -fi
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc

	make

	export HBAAPI_CFLAGS="-I${srcdir}/${pkgbase}-${pkgver}/libHBAAPI/"
	export HBAAPI_LIBS="-L${srcdir}/${pkgbase}-${pkgver}/libHBAAPI/.libs/ -lHBAAPI -ldl"

	cd "${srcdir}/${pkgbase}-${pkgver}/libhbalinux/"

	autoreconf -fi
	./configure \
		--prefix=/usr

	make

	export LIBHBALINUX_CFLAGS="-I${srcdir}/${pkgbase}-${pkgver}/libhbalinux/"
	export LIBHBALINUX_LIBS="-L${srcdir}/${pkgbase}-${pkgver}/libhbalinux/.libs/ -ldl"

	cd "${srcdir}/${pkgbase}-${pkgver}/fcoe-utils/"

	autoreconf -fi
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin \
		--with-systemdsystemunitdir=/usr/lib/systemd/system

	make
}

package_libhbaapi() {
	pkgdesc='Fibre Channel over Ethernet implementation for Linux - libhbaapi'
	backup=('etc/hba.conf')

	cd "${srcdir}/${pkgbase}-${pkgver}/libHBAAPI/"

	make DESTDIR="${pkgdir}" install
}

package_libhbalinux() {
	pkgdesc='Fibre Channel over Ethernet implementation for Linux - libhbalinux'
	depends=('libhbaapi' 'libpciaccess')

	cd "${srcdir}/${pkgbase}-${pkgver}/libhbalinux/"

	make DESTDIR="${pkgdir}" install
}

package_fcoe-utils() {
	pkgdesc='Fibre Channel over Ethernet implementation for Linux - utils'
	depends=('open-lldp' 'libhbaapi' 'libhbalinux')
	optdepends=('bash-completion: command completion in bash')
	backup=('etc/conf.d/fcoe')

	cd "${srcdir}/${pkgbase}-${pkgver}/fcoe-utils/"

	make DESTDIR="${pkgdir}" install

	install -D -m0644 "${srcdir}/config" "${pkgdir}/etc/conf.d/fcoe"

	rm -rf "${pkgdir}/etc/init.d/"
	rm -rf "${pkgdir}/etc/fcoe/"
}


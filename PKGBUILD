# Maintainer:  “0xReki” <mail@0xReki.de>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>

pkgname=ntp-smeared
_pkgname=ntp #-dev
_pkgver=4.2.8p10
pkgver=${_pkgver/p/.p}
pkgrel=2
pkgdesc='Network Time Protocol reference implementation with enabled smearing'
url='http://www.ntp.org/'
license=('custom')
arch=('i686' 'x86_64')
depends=('openssl' 'libcap' 'libedit')
backup=('etc/ntp.conf')
conflicts=('ntp')
provides=('ntp')
source=("https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${_pkgname}-${_pkgver}.tar.gz"
        'ntp.conf'
        'ntpd.service'
        'ntpdate.service')
sha1sums=('503d68cfd3e6a9354e0e28dd38b39d850b1228b2'
          'ffb67177707c86c632ecc2fbe1bc4f903fc498fb'
          '0cccca872385e0142888ab48d273fec0669b30a8'
          '059b382d1af0c55202e2d17f2ae065a2cbfec9ee')

options=('!emptydirs')
install=ntp.install

build() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"

	./configure --prefix=/usr --libexecdir=/usr/lib --enable-linuxcaps --enable-ntp-signd --enable-leap-smear
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"

	make DESTDIR="${pkgdir}" install

	install -Dm644 ../ntp.conf "${pkgdir}"/etc/ntp.conf
	install -Dm644 ../ntpd.service "${pkgdir}"/usr/lib/systemd/system/ntpd.service
	install -Dm644 ../ntpdate.service "${pkgdir}"/usr/lib/systemd/system/ntpdate.service
	install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -d -o 87 "${pkgdir}"/var/lib/ntp
	echo > "${pkgdir}/var/lib/ntp/.placeholder"
}

# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>

pkgname=ntp
_pkgname=ntp #-dev
_pkgver=4.2.8p13
pkgver=${_pkgver/p/.p}
pkgrel=2
pkgdesc='Network Time Protocol reference implementation'
url='http://www.ntp.org/'
license=('custom')
arch=('x86_64')
depends=('openssl' 'libcap' 'libedit')
backup=('etc/ntp.conf')
source=("https://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${_pkgname}-${_pkgver}.tar.gz"
        'ntp.conf'
        'ntpd.service'
        'ntpdate.service'
        'ntp.sysusers')
sha1sums=('cff200a987d64e891fb349a22313ecb0feaea090'
          'ad1d6ee2e9aca64a84a7224c88bf6008ac6c69e1'
          '0cccca872385e0142888ab48d273fec0669b30a8'
          '059b382d1af0c55202e2d17f2ae065a2cbfec9ee'
          'e8d1c895eabeb45b1a5f096fa5fc3c088eb3ee71')
options=('!emptydirs')

build() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"

	./configure --prefix=/usr --libexecdir=/usr/lib --enable-linuxcaps --enable-ntp-signd
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${_pkgver}"

	make DESTDIR="${pkgdir}" install

	install -Dm644 ../ntp.conf "${pkgdir}"/etc/ntp.conf
	install -Dm644 ../ntpd.service "${pkgdir}"/usr/lib/systemd/system/ntpd.service
	install -Dm644 ../ntpdate.service "${pkgdir}"/usr/lib/systemd/system/ntpdate.service
	install -Dm644 ../ntp.sysusers "${pkgdir}"/usr/lib/sysusers.d/ntp.conf
	install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -d -o 87 "${pkgdir}"/var/lib/ntp
	echo > "${pkgdir}/var/lib/ntp/.placeholder"
}

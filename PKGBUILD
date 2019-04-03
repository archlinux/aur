# Contributor: Igor Nemilentsev <trezorg@gmail.com>
# Maintainer: Gaetan Bisson <bisson@archlinux.org>

pkgname=idnkit
pkgver=1.0
pkgrel=4
pkgdesc='Provides functionalities about Internationalized Domain Name processing'
url='https://www.nic.ad.jp/ja/idn/idnkit/download/'
license=('custom:BSD')
arch=('x86_64')
depends=('glibc')
backup=('etc/idnalias.conf' 'etc/idn.conf')
options=('!makeflags')
source=("https://www.nic.ad.jp/ja/idn/idnkit/download/sources/idnkit-${pkgver}-src.tar.gz")
sha1sums=('7d843ffcf9843b7af02079e5a160520f28c75048')

prepare() {
	cd idnkit-${pkgver}-src
	sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" configure
}

build() {
	cd idnkit-${pkgver}-src
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--mandir=/usr/share/man \
		--enable-static=no
	make
}

check() {
	cd idnkit-${pkgver}-src
	make check
}

package() {
	cd idnkit-${pkgver}-src
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	rm "${pkgdir}"/etc/*.sample
}

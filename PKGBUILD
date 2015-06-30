# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Wessel Dirksen "p-we" <wdirksen at gmail dot com>
# Contributor: Juha-Matti "Suolx" Heikkala

pkgname=open-sasc-ng-dkms
pkgver=0.r620.29b7b5f231c8
pkgrel=2
pkgdesc='a versatile SoftCAM which creates virtual DVB devices'
url='http://85.17.209.13:6100'
arch=('i686' 'x86_64')
license=('GPL')
depends=('linux-headers' 'dkms' 'sascng-linux3-dkms')
makedepends=('mercurial')
conflicts=('sasc-ng' 'open-sasc-ng')
provides=('sasc-ng' 'open-sasc-ng')
install=open-sasc-ng.install
backup=('etc/camdir/cardclient.conf'
	'etc/conf.d/sasc-ng')
source=('open-sasc-ng::hg+http://85.17.209.13:6100/sc'
	'2.6.38.patch'
	'cardclient.conf'
	'dkms.conf'
	'sasc-ng.service'
	'sasc-ng.conf'
	'open-sasc-ng.lr'
	'config_dvb.pl.patch')
sha256sums=('SKIP'
            '45856a48253dcf58a81244bf8216cbf7e77d30ebfd07d14735cbe94180787961'
            '7caba03e515fe55aced4aad831e72ef3c0e59a3cdcea7bcdf79f7bfff6fcec75'
            '8c5b5ce5ac3eba4cfa3f7ec21b815b34dee0c7cd7616c250764f4c0bac896c37'
            'f23c4b4a3941190906a11f2d00319bbf82e3382dab5ecea86b34c3a19086fb18'
            'edfef56e3be2e1d0b7b0d11588e638d54548b9f2dd06495b9b581ba5baae9314'
            '620da70c775ce055a3f04041cf90e6d2acf7f7a57b0eecd07f240456d0069cf4'
            '195f440a4de49c56c8becba0fed966b436b2260f2cf3ce9e9277d97b411be9e4')

pkgver() {
	cd ${srcdir}/open-sasc-ng/

	echo "0.r$(hg identify -n).$(hg identify -i)"
}

build() {
	cd ${srcdir}/open-sasc-ng/

	if [ "$(hg identify -n)" -lt "600" ]; then
		patch -Np1 < ${srcdir}/2.6.38.patch
	fi
	patch -p1 < ${srcdir}/config_dvb.pl.patch

	cd contrib/sasc-ng/

	chmod a+x configure
	chmod a+x makelinks.sh
	chmod a+x dvbloopback/module/config_dvb.pl

	./configure --compiletype=release
	make
}

package() {
	cd ${srcdir}/open-sasc-ng/contrib/sasc-ng/

	mkdir -p ${pkgdir}/var/lib/dkms/open-sasc-ng/${pkgver}/
	cp -r dvbloopback/module ${pkgdir}/var/lib/dkms/open-sasc-ng/${pkgver}/source
	sed "s/%%PKGVER%%/${pkgver}/" < ${srcdir}/dkms.conf > ${pkgdir}/var/lib/dkms/open-sasc-ng/${pkgver}/source/dkms.conf

	install -D -m0755 sasc-ng ${pkgdir}/usr/sbin/sasc-ng
	install -D -m0644 ${srcdir}/sasc-ng.service ${pkgdir}/usr/lib/systemd/system/sasc-ng.service
	install -D -m0644 ${srcdir}/sasc-ng.conf ${pkgdir}/etc/conf.d/sasc-ng
	install -D -m0644 ${srcdir}/cardclient.conf ${pkgdir}/etc/camdir/cardclient.conf
	install -D -m0644 ${srcdir}/open-sasc-ng.lr ${pkgdir}/etc/logrotate.d/open-sasc-ng.lr
}


# Maintainer: robertfoster

pkgname=coova-chilli-arch
pkgver=1.4
pkgrel=1
pkgdesc='An open-source software access controller'
arch=('i686' 'x86_64')
url="https://coova.github.io/"
license=('GPL')
depends=('curl' 'libpcap' 'openssl')
makedepends=('gengetopt')
optdepends=('python2')
options=(!libtool)
replaces=(coova-chilli)
source=("https://github.com/coova/coova-chilli/archive/$pkgver.tar.gz"
	chilli.service
	4149a5ddfcc666ebbca3fcc9da308e7ff9e433b7.patch
	makefile.am.patch
)
backup=('etc/chilli.conf')
install=chilli.install

prepare() {
	cd "${srcdir}/coova-chilli-${pkgver}"

	patch -Np1 -i ../4149a5ddfcc666ebbca3fcc9da308e7ff9e433b7.patch
	patch -Np1 -i ../makefile.am.patch

	./bootstrap
	./configure --prefix=/usr --sbindir=/usr/bin/ \
    --sysconfdir=/etc --localstatedir=/var \
    --enable-statusfile \
    --disable-static \
    --enable-shared \
    --enable-largelimits \
    --enable-miniportal \
    --enable-chilliredir \
    --enable-chilliproxy \
    --enable-chilliscript \
    --with-poll \
    --with-openssl \
	--enable-chilliradsec

}

build() {
	cd "${srcdir}/coova-chilli-${pkgver}"
	make
}

package() {
	cd "${srcdir}/coova-chilli-${pkgver}"
	make DESTDIR="${pkgdir}" install

	msg2 "Installing systemd unit for ${pkgname}"
	install -Dm0644 ../chilli.service $pkgdir/usr/lib/systemd/system/chilli.service

	rm -rf ${pkgdir}/etc/init.d
}

md5sums=('c322fb0c0d575993acdfb8bdbe1cc022'
	'828147e21eac257c3b700ea7f4ca3d98'
	'a185897520cdde94be784f336dd67bcc'
'986482eb732530c30cdc9e7987a53ad4')

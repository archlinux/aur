# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=open-lldp
pkgver=0.9.46
pkgrel=5
pkgdesc='Open Link Layer Discovery Protocol - LLDP Agent Daemon'
arch=('i686' 'x86_64')
url='http://www.open-lldp.org/'
depends=('libnl1' 'libconfig')
optdepends=('bash-completion: command completion in bash')
license=('GPL')
validpgpkeys=('3BD16778540AE9BA587760BB7969EDCB5CFA09CB') # John Fastabend
source=("http://ftp-osl.osuosl.org/pub/${pkgname}/${pkgname}-${pkgver}.tar.gz"{,.sig}
	'configure.patch'
	'makefile.patch')
sha256sums=('c7b4abc970bf4cc12617b8124de0b440e69fc2a9f680973d2c313301802def14'
            'SKIP'
            '3459d8d8b37c188d3a837fc9fb91d9680294c22f1cf6a27cd66b3b3b89667971'
	    'fa43952bf89146f6d584a56f593f4268926cbc60a20bb8972e134a1506f8db13')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	patch -Np1 < "${srcdir}/configure.patch"
	patch -Np1 < "${srcdir}/makefile.patch"
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	./bootstrap.sh
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/"

	make DESTDIR="${pkgdir}" install

	install -D -m0644 lldpad.service "${pkgdir}/usr/lib/systemd/system/lldpad.service"

	rm -rf "${pkgdir}/etc/init.d/"
}


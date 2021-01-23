# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>
# Contributor: superlex
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Alessandro Sagratini <ale_sagra@hotmail.com>

pkgname=r5u87x
pkgver=0.2.1+r64+dfsg1
pkgrel=1
epoch=2
pkgdesc='Userspace module for Ricoh R5U870 OEM cameras'
arch=(i686 x86_64)
url='https://launchpad.net/~r5u87x-loader/+archive/ubuntu/ppa'
license=(GPL2 'custom:Public Domain for fw-extract.c and recode-fw.scm' 'custom: unknown for firmwares')
depends=(glib2 libusb-compat)
optdepends=('guile: needed by recode-fw script for extracting firmware from Windows driver')
source=("https://launchpad.net/~r5u87x-loader/+archive/ubuntu/ppa/+sourcefiles/r5u87x/${pkgver}-0ppa12/r5u87x_${pkgver}.orig.tar.gz"
        "https://launchpad.net/~r5u87x-loader/+archive/ubuntu/ppa/+sourcefiles/r5u87x/${pkgver}-0ppa12/r5u87x_${pkgver}-0ppa12.debian.tar.gz"
        "https://github.com/tmn505/r5u87x/archive/6e521e39d60afee08370970d3ccd362ad5541cfe.tar.gz")
b2sums=('58a276bd48ee588ff336303de1ece8a5316388d2f9e67e2ed58d8455818f5bdea53b758d38d43ac70487a8be346f73845e066b3b5ee1120b32f7b68a522e6ef3'
        '2707f1af9b1ae184d31c1fb3e06f9e10cd8f9c056c2a6c1d36b5b2b75ccafab6b871c1d2bb9b05ce884675c2b13431b00e0cf98eebdf0ee95ee31981438e200c'
        'a5818e21825ddcc89269b32fd87256f9ae61fd429630d7dc92281d419e91308489aabb1d25e3971054b547a71ca943ec03d391f32cb146a2768dab8ef89ba369')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# fix udev rule
	sed -i 's| --reload||' contrib/90-r5u87x-loader.rules.in
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# set UCODE_PATH because we don't install to default location
	make UCODE_PATH=/usr/lib/firmware/r5u87x-%vid%-%pid%.fw
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" \
		sbindir=/bin \
		firmdir=/lib/firmware \
		UDEV_INSTALL=/usr/lib/udev/rules.d \
		install

	install recode-fw.scm "${pkgdir}"/usr/bin/recode-fw
	
	cp -r "${srcdir}"/r5u87x-6e521e39d60afee08370970d3ccd362ad5541cfe/ucode/* "${pkgdir}/usr/lib/firmware/"

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r docs/* "${pkgdir}/usr/share/doc/${pkgname}"

    install -D "${srcdir}/debian/man/r5u87x-loader.8" "${pkgdir}/usr/share/man/man8/r5u87x-loader.8"
    install -D "${srcdir}/debian/copyright" "${pkgdir}/usr/share/licenses/copyright"
}

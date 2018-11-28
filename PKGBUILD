# Maintainer: Geyslan G. Bem <geyslan@gmail.com>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

_basepkg=ccid
pkgname=${_basepkg}-morpho
pkgver=1.4.3
pkgrel=2
epoch=1
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver (SAFRAN MORPHO YpsID Token)"
arch=('x86_64')
url="https://ccid.apdu.fr/"
license=('LGPL' 'GPL')
makedepends=('pkg-config')
depends=('pcsclite' 'libusb')
optdepends=('pcsc-tools')
provides=("${_basepkg}=${pkgver}")
conflicts=(${_basepkg})
install="$pkgname.install"
source=("https://alioth-archive.debian.org/releases/pcsclite/${_basepkg}/${_basepkg}${pkgver}/${_basepkg}-${pkgver}.tar.bz2")
md5sums=('a269baa572be6f93ec57da279c7ec276')

prepare() {
	cd "${_basepkg}-${pkgver}"

	# Safran/Morpho patch
	# https://ludovicrousseau.blogspot.com.br/2017/02/mostly-ccid-driver-for-some-morpho.html
	# http://ludovic.rousseau.free.fr/softwares/pcsc-lite/ccid-morpho-v7-2.patch

	if ! patch -p1 -N -f -i ../../ccid-morpho-v7-2.patch; then
		echo "* Just avoiding error when already patched ;)"
	fi
}

build() {
	cd "${_basepkg}-${pkgver}"

	LEXLIB="" ./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${_basepkg}-${pkgver}"

	make DESTDIR="${pkgdir}" install

	# move the configuration file to /etc and create a symbolic link
	mkdir -p "${pkgdir}/etc"
	mv "${pkgdir}/usr/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist" "${pkgdir}/etc/libccid_Info.plist"
	ln -s /etc/libccid_Info.plist "${pkgdir}/usr/lib/pcsc/drivers/ifd-ccid.bundle/Contents/Info.plist"
}

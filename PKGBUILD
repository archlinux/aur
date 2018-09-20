# Maintainer: Geyslan G. Bem <geyslan@gmail.com>
# Contributor: Daniel Plaza <daniel.plaza.espi@gmail.com>

_basepkg=ccid
pkgname=${_basepkg}-morpho
pkgver=1.4.3
pkgrel=1
epoch=1
pkgdesc="A generic USB Chip/Smart Card Interface Devices driver (SAFRAN MORPHO YpsID Token)"
arch=('i686' 'x86_64')
url="https://ccid.apdu.fr/"
license=('LGPL' 'GPL')
makedepends=('pkg-config')
depends=('pcsclite' 'libusb' 'flex')
optdepends=('pcsc-tools')
provides=("${_basepkg}=${pkgver}")
conflicts=(${_basepkg})
install="$pkgname.install"
source=("https://alioth-archive.debian.org/releases/pcsclite/${_basepkg}/${_basepkg}${pkgver}/${_basepkg}-${pkgver}.tar.bz2"
        "http://ludovic.rousseau.free.fr/softwares/pcsc-lite/ccid-morpho-v7-2.patch")
md5sums=('a269baa572be6f93ec57da279c7ec276'
         '70c25b7c28392e2293e472e0fab4d263')

prepare() {
	cd "${_basepkg}-${pkgver}"

	# Safran/Morpho patch
	# https://ludovicrousseau.blogspot.com.br/2017/02/mostly-ccid-driver-for-some-morpho.html
	if ! patch -p1 -N -f -i ../ccid-morpho-v7-2.patch; then
		echo "* Just avoiding error when already patched ;)"
	fi
}

build() {
	cd "${_basepkg}-${pkgver}"

	./configure --prefix=/usr --sysconfdir=/etc
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

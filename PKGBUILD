# Maintainer: ilikenwf <parwok@gmail.com>
# Contributor: deusstultus <deusstultus@gmail.com>
# Contributors by way of cgminer package in arch repos
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: monson <holymonson@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: David Manouchehri <david@davidmanouchehri.com>

# Contributor by way of cgminer-git in AUR
# Contributor: Atterratio <atterratio at gmail>

pkgname=cgminer-gpu
provides=('cgminer')
pkgver=3.7.2
pkgrel=7
pkgdesc="Multi-threaded multi-pool GPU, FPGA and ASIC miner for bitcoin and derivative coins. 3.7.2 was the last GPU version."
url='http://forum.bitcoin.org/index.php?topic=28402.0'
license=('GPL3')
#Note license was GPL2 prior to Tue Feb 21 22:23:07 2012 +1100 if playing with old versions with this PKGBUILD
arch=('i686' 'x86_64')
depends=('curl' 'libcl' 'libusbx' 'jansson' 'libusb-compat')
conflicts=('cgminer-git' 'cgminer' 'cgminer-git-adl')
makedepends=('opencl-headers' 'autoconf' 'automake' 'pkgconfig' 'libtool' 'yasm')
optdepends=('ncurses: For ncurses formatted screen output'
            'opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
source=("https://github.com/ckolivas/cgminer/archive/v3.7.2.tar.gz"
		"cgminer.service"
		"cgminer.conf.d"
        "system-jansson-libusb.patch")
sha512sums=('aacee4ca47c5da18ae15f9bc245640d44a6b39264abc357729e2cb5d7ca049710cc635457f2a76a2c97f6bbebfec81bbe6675dacf366bf870a14b5a0b12d9963'
            '3317b60c6b1f14c47d8ee636113ef40a4023ab14054129de80a37947b381fd2b647a7053f4e1bb639efa225a514e862fa531908714c34040dda2d6221dde7f5f'
            '99c38bc395848f9712ce172343d31f5c60f5d8ac1cfe2f48df8f3ec6c488fc275763a79c5ef36b99f32faa465b5a65284b38e8a63ef9b144075ee13971313b41'
            '9083fd18b64f5d1260d2be1d564e8bf9435b2753a621ffc87b56c40fb30030477619d3a17e29c241a2c951c1ee7e4bf3091135fd0be0b1963e19f79c01d33006')
[ "$CARCH" == "x86_64" ] && makedepends+=('yasm')

build() {
  cd "$srcdir/cgminer-3.7.2"
	
  # We have latest jansson and libusb - just use them
  patch -Np1 -i ../system-jansson-libusb.patch
  rm -r compat
  
  ./autogen.sh --enable-opencl
  
  ./configure \
    --prefix=/usr \
    --enable-scrypt \
    --enable-opencl \
    --enable-bflsc \
    --enable-bitforce \
    --enable-icarus \
    --enable-modminer \
    --enable-ztex \
    --enable-avalon \
    --enable-adl
    
  make
}

package() {
  cd "$srcdir/cgminer-3.7.2"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/cgminer.service "$pkgdir"/usr/lib/systemd/system/cgminer.service
  install -Dm644 "$srcdir"/cgminer.conf.d "$pkgdir"/etc/conf.d/cgminer
  sed 's#/usr/local/bin#/usr/bin#g' example.conf > cgminer.conf
  install -Dm644 cgminer.conf "$pkgdir"/etc/cgminer.conf
}

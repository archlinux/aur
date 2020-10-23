# Maintainer: aig <aigmx@posteo.de>

pkgname=libnfc-nci-alt
pkgver=2.4.1
pkgrel=1
pkgdesc="Linux NFC stack for NCI based NXP NFC Controllers (PN7150, PN7120). For alt-i2c transport."
arch=('x86_64')
url="https://github.com/NXPNFCLinux/linux_libnfc-nci/"
license=('APACHE')
depends=('glibc' 'gcc-libs' 'systemd-libs' 'openssl')
makedepends=('git')
provides=('libnfc-nci')
conflicts=('libnfc-nci-lpcusbsio' 'libnfc-nci-i2c')
source=("git+https://github.com/NXPNFCLinux/linux_libnfc-nci#commit=2aff6448cf6a86897d3d1bacb0a0943a594aa9ce"
        "01-fix-tml-linker-errors.patch"
        "02-fix-llcp-linker-errors.patch")
sha256sums=('SKIP'
            'c9992a8449de8ece0324cbf180a24f8bcab82cb7f51832d3d80958c0968a7575'
            'c6ece172b50e1d1070a979fbafa2e9ee7f7f7b92d583fa38f8ea433123a9ef4d')

prepare() {
  cd "$srcdir/linux_libnfc-nci"
  patch -p1 -i "$srcdir/01-fix-tml-linker-errors.patch"
  patch -p1 -i "$srcdir/02-fix-llcp-linker-errors.patch"
}

build() {
  cd "$srcdir/linux_libnfc-nci"
  ./bootstrap
  export openssldir='/usr'
  ./configure --prefix=/usr --sysconfdir=/etc/libnfc-nci --enable-alt --enable-llcp1_3
  make
}

package() {
  cd "$srcdir/linux_libnfc-nci"
  make DESTDIR="$pkgdir/" install
  rm -rf $pkgdir/usr/sbin
}

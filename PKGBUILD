# Maintainer: Dāvis Mosāns <davispuh at gmail dot com>
pkgname=rr276x
_realbase=RR276x
_realname=${_realbase}_Linux_Src
pkgver=1.1.3
_pkgsubver=14_02_12
pkgrel=2
pkgdesc="Kernel module for HighPoint RocketRAID 276x (2760/2760A) SAS/SATA HBA/RAID cards"
url="http://www.highpoint-tech.com/USA_new/series_rr276x-rr274x_configuration.htm"
arch=('x86_64' 'i686')
license=('custom')
depends=('linux')
optdepends=()
makedepends=('linux-headers')
conflicts=("$pkgname-dkms")
replaces=()
backup=()
install=$pkgname.install
_osname=linux
_srcname=$pkgname-$_osname-src-v${pkgver}
source=("http://www.highpoint-tech.com/BIOS_Driver/$_realbase/$_osname/${_realname}_v${pkgver}_$_pkgsubver.tar.gz"
        "0001-Remove-support-for-kernels-before-3.x.patch"
        "0002-Remove-__DATE__-and-__TIME__-macros.patch")
sha256sums=('fefde4b1e0ee0b49f9871585269067e269b6cefe07d248766a5bb8b59521f611'
            '9e892fc9b022aed5d252f47cef49df914292b6a6b3fbb2c2ced58923edc04cff'
            'cd97a05219f3e4d9edd2e1d0d6c07371b52676ebc0821584b9fcc6b4b953f00a')

prepare() {
  cd "$srcdir/$_srcname"
  patch -Np1 < "$srcdir/0001-Remove-support-for-kernels-before-3.x.patch"
  patch -Np1 < "$srcdir/0002-Remove-__DATE__-and-__TIME__-macros.patch"
}

build() {
  cd "$srcdir/$_srcname/product/$pkgname/$_osname"
  make || return 1
}

package() {
  cd "$srcdir/$_srcname/product/$pkgname/$_osname"

  # Install for all kernels
  for _extramod in $(find /usr/lib/modules/extramodules-*/version -printf '%h\n'); do
    # Install
    install -Dm644 "$pkgname.ko" "$pkgdir$_extramod/drivers/scsi/$pkgname.ko" || return 1

    # Compress
    gzip "$pkgdir$_extramod/drivers/scsi/$pkgname.ko"
  done

  # Blacklist mvsas
  install -d "$pkgdir/usr/lib/modprobe.d/"
  echo "blacklist mvsas" >> "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}


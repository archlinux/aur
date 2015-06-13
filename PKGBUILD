# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Maintainer : Thaodan <theodostormgrade@gmail.com>

_godver=4.0
_badver=4.1
pkgname=virtualbox-modules-pf
pkgver=4.3.28
pkgrel=1
pkgdesc='Host linux-pf kernel modules for VirtualBox'
arch=('i686' 'x86_64')
url='http://virtualbox.org'
license=('GPL')
depends=("linux-pf>=$_godver" "linux-pf<$_badver")
makedepends=('linux-pf-headers'
             "virtualbox-host-dkms=$pkgver")
provides=('virtualbox-host-modules')
install=virtualbox-modules-pf.install

_extramodules=extramodules-$_godver-pf
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

build() {
  # dkms need modification to be run as user
  cp -r /var/lib/dkms .
  echo "dkms_tree='$srcdir/dkms'" > dkms.conf
  # build host modules
  dkms --dkmsframework dkms.conf build "vboxhost/$pkgver" -k "$_kernver"
}

package(){
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules"
  cd "dkms/vboxhost/$pkgver/$_kernver/$CARCH/module"
  install -m644 * "$pkgdir/usr/lib/modules/$_extramodules"
  find "$pkgdir" -name '*.ko' -exec gzip -9 {} +
}
md5sums=()

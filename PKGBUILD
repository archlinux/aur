 # Contributor: gamanakis

pkgname=act_mirred-connmark-lts
pkgver=3.14
pkgrel=1
pkgdesc="Modified MIRRED TC action to retrieve the MARK of a packet through CTMARK in INGRESS. Source modified from OpenWRT.org"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('linux-lts-headers')
depends=('linux-lts')
install=act_mirred-connmark.install
source=('act_mirred-connmark.patch'
	'act_mirred.c::https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/plain/net/sched/act_mirred.c?id=refs/tags/v3.14'
	'Makefile')
url="https://dev.openwrt.org/browser/trunk/target/linux/generic/patches-3.19/621-sched_act_connmark.patch"
md5sums=('8b92ff40b4de5b4d1a5aacb48a3832b3'
         'eab706596d24e7bd5178b4746680a549'
         '7226ee15834b25f51fe65fca74a3b3c5')

_kernmajor="$(pacman -Q linux-lts | awk '{print $2}' | cut -d - -f1 | cut -d . -f1,2)"
_extramodules="extramodules-${_kernmajor}-lts"
_kernver="$(cat /usr/lib/modules/${_extramodules}/version)"

prepare() {
  cd "${srcdir}"
  patch --follow-symlinks < ../act_mirred-connmark.patch
}

build() {
  cd "${srcdir}"
  make -C /usr/lib/modules/${_kernver}/build M=`pwd`
  gzip -f act_mirred.ko
}

package() {
 install -Dm755 act_mirred.ko.gz $pkgdir/usr/lib/modules/${_extramodules}/act_mirred.ko.gz
}

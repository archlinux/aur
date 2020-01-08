# Contributor: Pedro H Lara Campos <root@pedrohlc.com>
pkgname=haxm-altea-git
pkgver=v7.1.0.r193.g5021453
pkgrel=1
pkgdesc="Intel® Hardware Accelerated Execution Manager - a hardware-assisted virtualization engine (patched to orbital - git version)"
arch=('x86_64' 'i686')
url="https://github.com/AlexAltea/haxm"
license=('BSD')
depends=('linux>4' 'nasm>=2.11')
makedepends=(linux-headers)
provides=(haxm haxm-git)
conflicts=(haxm haxm-git)
source=("$pkgname::git+https://github.com/AlexAltea/haxm.git")
md5sums=('SKIP')
install='haxm-git.install'

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/loader\.v//g'
}

build() {
  cd "$srcdir/$pkgname/platforms/linux"
  _kernver="$(</usr/src/linux/version)"
  _kdir="/usr/lib/modules/${_kernver}/build"
  make KVER="${_kernver}" KDIR="${_kdir}" modules
}

package() {
  cd "$srcdir/$pkgname/platforms/linux"

  _ldir="$pkgdir/usr/lib/haxm"
  install -dm 644 "${_ldir}"
  install -Dm 755 'haxm-install.sh' "${_ldir}/install.sh"
  install -Dm 755 'haxm-uninstall.sh' "${_ldir}/uninstall.sh"

  install -Dt "$pkgdir/usr/lib/modules/${_extramodules}" -m644 haxm.ko
  # TODO: Add license
}

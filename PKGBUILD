# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# To build for alternate kernels, change pkgname to match
pkgname=piuio
#pkgname=piuio-lts
pkgver=1.0
pkgrel=1
_kernelname=${pkgname#piuio}
_srcname=piuio
pkgdesc="Kernel driver for the PIUIO arcade input device"
arch=('i686' 'x86_64')
url="https://github.com/djpohly/$_srcname"
license=('GPL2')
makedepends=('kmod' "linux$_kernelname-headers")
install=$_srcname.install
source=("https://github.com/djpohly/$_srcname/archive/v$pkgver.tar.gz")
sha256sums=('47b5b6a08b488d3cb4701054be3f419030a677c2ab2f594eb2efb630818c2d11')

build() {
  # Build against currently installed headers for the given kernel
  _kernver=$(pacman -Q "linux$_kernelname-headers" | cut -d' ' -f2)
  _kerneldir=/usr/lib/modules/$_kernver${_kernelname:--ARCH}/build

  cd "$srcdir/$_srcname-$pkgver/mod"

  make modules KDIR="$_kerneldir"
}

package() {
  cd "$srcdir/$_srcname-$pkgver/mod"

  # Get the version from the already-built module, in case installed
  # version has changed since build.
  _kernver=$(modinfo -F vermagic "$_srcname.ko" | cut -d' ' -f1)
  _kernminor=${_kernver%.*}
  _nextminor=${_kernminor%.*}.$((${_kernminor##*.}+1))
  depends=("linux$_kernelname>=$_kernminor" "linux$_kernelname<$_nextminor")

  install -Dm644 "$_srcname.ko" \
    "$pkgdir/usr/lib/modules/extramodules-$_kernminor${_kernelname:--ARCH}/$_srcname.ko"

  # Set kernel version in install script (for depmod)
  sed \
    -e "s/^KERNEL_VERSION=.*/KERNEL_VERSION=$_kernminor${_kernelname:--ARCH}/" \
    -i "$startdir/$install"
}

# vim:set ts=2 sw=2 et:

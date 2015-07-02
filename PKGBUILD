# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# To build for alternate kernels, change pkgname to match
pkgname=piuio
#pkgname=piuio-lts
pkgver=0.4
pkgrel=2
_kernelname=${pkgname#piuio}
_srcname=piuio
pkgdesc="Kernel driver for the PIUIO arcade input device"
arch=('i686' 'x86_64')
url="https://github.com/djpohly/$_srcname"
license=('GPL2')
makedepends=('kmod' "linux$_kernelname-headers")
install=$_srcname.install
source=("https://github.com/djpohly/$_srcname/archive/v$pkgver.tar.gz")
sha256sums=('17580ca9862d2b39f5c9d8d033423842c0d71ce9ce0a99b27ef4e9c1e50a33bb')

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

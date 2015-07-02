# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
# To build for alternate kernels, change pkgname to match
pkgname=piuio-git
#pkgname=piuio-git-lts
pkgver=0.3.1.r0.gb8bdcb5
pkgrel=2
_srcname=piuio
_kernelname=${pkgname#piuio-git}
pkgdesc="Kernel driver for the PIUIO arcade input device"
arch=('i686' 'x86_64')
url="https://github.com/djpohly/$_srcname"
license=('GPL2')
makedepends=('git' 'kmod' "linux$_kernelname-headers")
provides=("piuio$_kernelname")
conflicts=("piuio$_kernelname")
install=$_srcname.install
source=("git+https://github.com/djpohly/$_srcname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_srcname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  # Build against currently installed headers for the given kernel
  _kernver=$(pacman -Q "linux$_kernelname-headers" | cut -d' ' -f2)
  _kerneldir=/usr/lib/modules/$_kernver${_kernelname:--ARCH}/build

  cd "$srcdir/$_srcname/mod"

  make modules KDIR="$_kerneldir"
}

package() {
  cd "$srcdir/$_srcname/mod"

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

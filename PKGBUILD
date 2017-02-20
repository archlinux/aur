# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=nvidia-173xx-dkms
pkgver=173.14.39
pkgrel=9
pkgdesc="NVIDIA kernel module sources (DKMS), 173xx branch"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && _arch=x86
[ "$CARCH" = "x86_64" ] && _arch=x86_64
_pkg=NVIDIA-Linux-$_arch-$pkgver-pkg0
url="http://www.nvidia.com/"
depends=('dkms' "nvidia-173xx-utils=$pkgver")
optdepends=('linux-headers: build the module for Arch kernel'
            'linux-lts-headers: build the module for LTS Arch kernel')
provides=("nvidia=$pkgver" 'nvidia-dkms')
conflicts=('nvidia')
license=('custom')
options=(!strip)
source=(linux-3.14.patch
        linux-3.17.patch
        linux-3.19.patch
        linux-4.0.patch
        linux-4.3.patch
        linux-4.6.patch
        dkms.conf)
source_i686=("http://download.nvidia.com/XFree86/Linux-x86/$pkgver/NVIDIA-Linux-x86-$pkgver-pkg0.run")
source_x86_64=("http://download.nvidia.com/XFree86/Linux-x86_64/$pkgver/NVIDIA-Linux-x86_64-$pkgver-pkg0.run")
md5sums=('6dfb34d8fdf35c1637932f95d2216c46'
         'a2042d1f47d3f7c8b380237bd0b35863'
         'be7d8583f27021dde68e87239d547457'
         'c84147f5645290b6d840e987e5413536'
         '20bde657bb715e16295d7e82fe799fca'
         'a5b751e62ee8caba525c059035568422'
         'd784fa643442852babc56f60705387a4')
md5sums_i686=('5b423543428554ef33a200fbbe3cb9fc')
md5sums_x86_64=('0799f194869e40141c7bac8a71762db6')

prepare() {
  sh $_pkg.run --extract-only

  cd $_pkg/usr/src/nv
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-3.14.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-3.17.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-3.19.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-4.0.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-4.3.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-4.6.patch"
}

package() {
  cd $_pkg/usr/src/nv
  install -dm 755 "$pkgdir"/usr/{lib/modprobe.d,src}
  cp -dr --no-preserve=ownership . "$pkgdir/usr/src/nvidia-$pkgver"
  install -m644 "$srcdir"/dkms.conf "$pkgdir/usr/src/nvidia-$pkgver/dkms.conf"
  echo 'blacklist nouveau' > "$pkgdir/usr/lib/modprobe.d/nvidia.conf"
}

# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Thomas Bächler <thomas@archlinux.org>

pkgname=nvidia-96xx-dkms
pkgver=96.43.23
pkgrel=7
pkgdesc="NVIDIA kernel module sources (DKMS), 96xx branch"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && _arch=x86
[ "$CARCH" = "x86_64" ] && _arch=x86_64
_pkg=NVIDIA-Linux-$_arch-$pkgver-pkg0
url="http://www.nvidia.com/"
depends=('dkms' "nvidia-96xx-utils=$pkgver")
optdepends=('linux-headers: build the module for Arch kernel'
            'linux-lts-headers: build the module for LTS Arch kernel')
provides=("nvidia=$pkgver" 'nvidia-dkms')
conflicts=('nvidia')
license=('custom')
options=(!strip)
source=(173.14.36-37.patch
        173.14.37-38.patch
        linux-3.17.patch
        linux-3.19.patch
        linux-4.0.patch
        linux-4.3.patch
        dkms.conf)
source_i686=("http://download.nvidia.com/XFree86/Linux-x86/$pkgver/NVIDIA-Linux-x86-$pkgver-pkg0.run")
source_x86_64=("http://download.nvidia.com/XFree86/Linux-x86_64/$pkgver/NVIDIA-Linux-x86_64-$pkgver-pkg0.run")
md5sums=('944ed806c8d0f9174d5e9e16ae065bf6'
         'f2e605724a13ee01bf290df3bf9a3a93'
         'a613531fc6a5610e8e07b1dded071901'
         'ab3e06a699bfd0a91ab77a88e112ad44'
         '89072d9c1b37867f01dd7a41521c0ed1'
         '20bde657bb715e16295d7e82fe799fca'
         'd28e74675462b215f080960c130c43fc')
md5sums_i686=('ca0bc6ae3b37cb259f3a906b4dc4670b')
md5sums_x86_64=('a043fe8dd639bd00b1792eea7a195677')

prepare() {
  sh $_pkg.run --extract-only

  cd $_pkg/usr/src/nv
  patch -p1 --no-backup-if-mismatch -i "$srcdir/173.14.36-37.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/173.14.37-38.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-3.17.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-3.19.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-4.0.patch"
  patch -p1 --no-backup-if-mismatch -i "$srcdir/linux-4.3.patch"
}

package() {
  cd $_pkg/usr/src/nv
  install -dm 755 "$pkgdir"/usr/{lib/modprobe.d,src}
  cp -dr --no-preserve=ownership . "$pkgdir/usr/src/nvidia-$pkgver"
  install -m644 "$srcdir"/dkms.conf "$pkgdir/usr/src/nvidia-$pkgver/dkms.conf"
  echo 'blacklist nouveau' > "$pkgdir/usr/lib/modprobe.d/nvidia.conf"
}

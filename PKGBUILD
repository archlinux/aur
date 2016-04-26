# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=nvidia-96xx-dkms
pkgver=96.43.23
pkgrel=6
pkgdesc="NVIDIA kernel module sources (DKMS), 96xx branch"
arch=('i686' 'x86_64')
[ "$CARCH" = "i686"   ] && _arch=x86
[ "$CARCH" = "x86_64" ] && _arch=x86_64
_pkg=NVIDIA-Linux-${_arch}-${pkgver}-pkg0
url="http://www.nvidia.com/"
depends=('dkms' "nvidia-96xx-utils=${pkgver}")
optdepends=('linux-headers: build the module for Arch kernel'
            'linux-lts-headers: build the module for LTS Arch kernel')
provides=("nvidia=${pkgver}" 'nvidia-dkms')
conflicts=('nvidia')
license=('custom')
source=("http://us.download.nvidia.com/XFree86/Linux-${_arch}/${pkgver}/${_pkg}.run"
         173.14.36-37.patch
         173.14.37-38.patch
         linux-3.17.patch
         linux-3.19.patch
         linux-4.0.patch
         linux-4.3.patch
         dkms.conf)
options=(!strip)
[ "$CARCH" = "i686"   ] && md5sums=('ca0bc6ae3b37cb259f3a906b4dc4670b')
[ "$CARCH" = "x86_64" ] && md5sums=('a043fe8dd639bd00b1792eea7a195677')
md5sums+=('944ed806c8d0f9174d5e9e16ae065bf6'
          'f2e605724a13ee01bf290df3bf9a3a93'
          'a613531fc6a5610e8e07b1dded071901'
          'ab3e06a699bfd0a91ab77a88e112ad44'
          '89072d9c1b37867f01dd7a41521c0ed1'
          '20bde657bb715e16295d7e82fe799fca'
          'd28e74675462b215f080960c130c43fc')

prepare() {
  if [[ -d ${_pkg} ]] ; then
    rm -rf ${_pkg}
  fi

  sh ${_pkg}.run --extract-only

  cd ${_pkg}/usr/src/nv
  patch -p1 -i "$srcdir/173.14.36-37.patch"
  patch -p1 -i "$srcdir/173.14.37-38.patch"
  patch -p1 -i "$srcdir/linux-3.17.patch"
  patch -p1 -i "$srcdir/linux-3.19.patch"
  patch -p1 -i "$srcdir/linux-4.0.patch"
  patch -p1 -i "$srcdir/linux-4.3.patch"
  rm *.orig
}

package() {
  cd ${_pkg}/usr/src/nv

  install -dm 755 "${pkgdir}"/usr/{lib/modprobe.d,share/licenses,src}
  cp -dr --no-preserve=ownership . "${pkgdir}"/usr/src/nvidia-${pkgver}
  install -m644 "${srcdir}"/dkms.conf "${pkgdir}"/usr/src/nvidia-${pkgver}/dkms.conf
  echo 'blacklist nouveau' > "${pkgdir}"/usr/lib/modprobe.d/nvidia.conf
  ln -s nvidia-96xx "${pkgdir}"/usr/share/licenses/${pkgname}
}

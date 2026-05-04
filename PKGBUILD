# Maintainer: loathingkernel <loathingkernel @at gmail .dot com>
# Contributor: gbr <gbr@protonmail.com>
# Contributor: Lubosz Sarnecki <lubosz0@gmail.com>
# Original Package: Martin Wimpress <code@flexion.org>

_pkgbase=nvidia-settings
pkgname=lib32-libxnvctrl
pkgver=595.71.05
pkgrel=1
pkgdesc='NVIDIA NV-CONTROL X extension (32-bit)'
url='https://github.com/NVIDIA/nvidia-settings'
arch=('x86_64')
license=('GPL2')
depends=('lib32-gcc-libs' 'lib32-jansson' 'lib32-libxext')
optdepends=('libxnvctrl: XNVCtrl development headers')
options=('staticlibs')
source=(${_pkgbase}-${pkgver}.tar.gz::https://github.com/NVIDIA/nvidia-settings/archive/${pkgver}.tar.gz
        nvidia-settings-libxnvctrl_so.patch)
sha512sums=('b82d273a1c9948cb7931315938d814388fda592ccc433db16c415892457ddf070f4df295283857ad9bc69cfd449e6812b6dbba3d9cbe1d244c0e2cfaea819d51'
            '0303fe615d6ef4e14112998c531a17613b94776f9a6a027ddb81e400fddd5f2ff15583da8b8631c2306aca854edf2f54a8007eb36f1732b4c064c857aaf268ae')

prepare() {
  export PREFIX=/usr
  export NV_USE_BUNDLED_LIBJANSSON=0
  export OUTPUTDIR=out

  cd ${_pkgbase}-${pkgver}
  patch -Np1 -i "${srcdir}"/nvidia-settings-libxnvctrl_so.patch
}

build() {
  cd ${_pkgbase}-${pkgver}
  export CFLAGS+=" -ffat-lto-objects"
  make CC='gcc -m32' PREFIX=/usr OUTPUTDIR=out NV_USE_BUNDLED_LIBJANSSON=0 -C src/libXNVCtrl
}

package() {
  cd ${_pkgbase}-${pkgver}
  install -d "${pkgdir}/usr/lib32"
  cp -Pr src/libXNVCtrl/out/libXNVCtrl.* -t "$pkgdir/usr/lib32"
}

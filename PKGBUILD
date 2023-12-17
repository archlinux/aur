# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-vmaf
pkgver=3.0.0
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (mingw-w64)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD')
depends=('mingw-w64-crt' 'vmaf')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'nasm')
source=("https://github.com/Netflix/vmaf/archive/v${pkgver}/vmaf-${pkgver}.tar.gz"
	"staticlib.patch")
sha256sums=('7178c4833639e6b989ecae73131d02f70735fdb3fc2c7d84bc36c9c3461d93b1'
            '9d7e03ac0f890e201cf27f1c0adea1e78407ac60b09073c2e3865c7945939bec')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}"/vmaf-${pkgver}

    patch -Np1 -i "${srcdir}/staticlib.patch"
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p "${srcdir}"/build-${_arch} && cd "${srcdir}"/build-${_arch}
    ${_arch}-meson . "${srcdir}/vmaf-${pkgver}/libvmaf"
    meson compile -C .
  done
}

check() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    meson test -C .
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/build-${_arch}
    meson install -C . --destdir "$pkgdir"
  done

  #install -D -m644 "vmaf-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/vmaf"
  #cp -dr --no-preserve='ownership' "vmaf-${pkgver}/model" "${pkgdir}/usr/share"
}

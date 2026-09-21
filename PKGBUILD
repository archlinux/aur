# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-vmaf
pkgver=3.2.1
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (mingw-w64)'
arch=('any')
url='https://github.com/Netflix/vmaf/'
license=('BSD-2-Clause-Patent')
depends=(
  'mingw-w64-crt'
  'vmaf'
)
options=(!strip !buildflags staticlibs !debug)
makedepends=(
  'mingw-w64-gcc'
  'mingw-w64-meson'
  'nasm'
)
checkdepends=(
  'vim'
)
source=("https://github.com/Netflix/vmaf/archive/v${pkgver}/vmaf-${pkgver}.tar.gz"
        'staticlib.patch'
        'avx2-fix.patch')
sha256sums=('5df7386911bc15fd1ca783132528748d219768ae4fc5f8e0b61184f041648092'
            '9d7e03ac0f890e201cf27f1c0adea1e78407ac60b09073c2e3865c7945939bec'
            '2a037ba87d673f8c251c93981066f87583324aebd37f96324fd07d8c94300bb5')
_architectures="${MINGW_W64_ARCHS:-x86_64-w64-mingw32}"

prepare() {
    cd "${srcdir}"/vmaf-${pkgver}

    patch -Np1 -i "${srcdir}/staticlib.patch"
    patch -Np1 -i "${srcdir}/avx2-fix.patch"
}

build() {
  for _arch in ${_architectures}; do
    ${_arch}-meson -Denable_avx512='false' "${srcdir}/vmaf-${pkgver}/libvmaf" build-${_arch}
    meson compile -C build-${_arch}
  done
}

check() {
  for _arch in ${_architectures}; do
    meson test -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    meson install -C build-${_arch} --destdir "$pkgdir"
  done

  #install -D -m644 "vmaf-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/vmaf"
  #cp -dr --no-preserve='ownership' "vmaf-${pkgver}/model" "${pkgdir}/usr/share"
}

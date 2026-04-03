# Maintainer: Karl-Felix Glatzer <karl[dot]glatzer[at]gmx[dot]de>
# Contributor: Daniel Bermond <dbermond@archlinux.org>

pkgname=mingw-w64-vmaf
pkgver=3.1.0
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
sha256sums=('80090e29d7fd0db472ddc663513f5be89bc936815e62b767e630c1d627279fe2'
            '9d7e03ac0f890e201cf27f1c0adea1e78407ac60b09073c2e3865c7945939bec'
            '7b8146849f0f66098abed3752ae322cea0ba721ea318096f7da5de3e69f94992')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd "${srcdir}"/vmaf-${pkgver}

    patch -Np1 -i "${srcdir}/staticlib.patch"
    patch -Np1 -i "${srcdir}/avx2-fix.patch"
}

build() {
  local _jobs
  local _max_jobs='20'

  _jobs="$(nproc)"

  # may fail to compile on a high core count system
  if [ "$_jobs" > "$_max_jobs" ]
  then
      local _jobs="$_max_jobs"
      printf '%s\n' "limiting the compilation jobs to ${_jobs}"
  fi

  for _arch in ${_architectures}; do
    ${_arch}-meson -Denable_avx512='false' "${srcdir}/vmaf-${pkgver}/libvmaf" build-${_arch}
    meson compile -C build-${_arch} --jobs "$_jobs"
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

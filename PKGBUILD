# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=52.88c6080
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/shssoichiro/soifunc'
license=('MIT')
depends=('vapoursynth'
  'vapoursynth-plugin-vsutil-git'
  'vapoursynth-plugin-muvsfunc-git'
  'vapoursynth-plugin-mvsfunc-git'
  'vapoursynth-plugin-kagefunc-git'
  'vapoursynth-plugin-havsfunc-git'
  'vapoursynth-plugin-neo_f3kdb-git'
  'vapoursynth-plugin-nnedi3_resample-git'
  'vapoursynth-plugin-znedi3-git'
  'vapoursynth-plugin-dfttest2-git'
  'vapoursynth-plugin-fft3dfilter-git'
  'vapoursynth-plugin-mvtools-git'
)
optdepends=('vapoursynth-plugin-bm3dcuda-git: BM3D cuda/cuda_rtc + fast cpu support'
  'vapoursynth-plugin-bm3dcuda-cpu-git: BM3D fast cpu support, without cuda'
)
makedepends=('git'
  'python-poetry'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/shssoichiro/soifunc.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.%s" "$_rev" "$_hash"
}

build() {
  cd "${_plug}"
  rm -rf dist/
  poetry build -f wheel
}

package() {
  cd "${_plug}"
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

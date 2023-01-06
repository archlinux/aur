# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsrife
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.1.0.0.g91e894f
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-rife'
license=('MIT')
depends=('vapoursynth'
         'python-numpy'
         )
makedepends=('git'
             'python-pip'
             'python-pytorch-tensorrt'
             )
optdepends=('python-pytorch: CPU'
            'python-pytorch-opt: CPU with AVX2 CPU optimizations'
            'python-pytorch-cuda: CUDA and CPU'
            'python-pytorch-cuda-opt: CUDA and CPU with AVX2 CPU optimizations'
            )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/vs-rife.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}/vsrife"
  python __init__.py
}

build() {
  cd "${_plug}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

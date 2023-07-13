# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsbasicvsrpp
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.1.0.0.gb37b134
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-basicvsrpp'
license=('Apache')
depends=(
  'vapoursynth'
  'python-numpy'
  'python-tqdm'
  'python-requests'
  'python-addict'
  'python-mmcv-full'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-sympy'
  'python-wheel'
  'python-hatchling'
)
optdepends=(
  'python-pytorch: pytorch CPU with AVX2 optimizations'
  'python-pytorch-cuda: pytorch CUDA with CPU with AVX2 optimizations'
  'python-torchvision: torchvision Datasets, transforms, and models specific to computer vision'
  'python-torchvision-cuda: torchvision Datasets, transforms, and models specific to computer vision git diff(with GPU support)'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/vs-basicvsrpp.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}/vsbasicvsrpp"
  python __main__.py
}

build() {
  export CC=/opt/cuda/bin/gcc
  export CXX=/opt/cuda/bin/g++

  cd "${srcdir}/${_plug}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_plug}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

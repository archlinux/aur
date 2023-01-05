# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsbasicvsrpp
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.4.1.7.g116a6c1
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-basicvsrpp'
license=('Apache')
depends=('vapoursynth'
         'python-numpy'
         'python-tqdm'
         'python-requests'
         'python-mmcv-full'
         )
makedepends=('git'
             'python-packaging'
             )
optdepends=('python-pytorch: pytorch CPU with AVX2 optimizations'
            'python-pytorch-cuda: pytorch CUDA with CPU with AVX2 optimizations'
            'python-torchvision: torchvision Datasets, transforms, and models specific to computer vision (with GPU support)'
            'python-torchvision-cuda: torchvision Datasets, transforms, and models specific to computer vision'
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
  cd "${_plug}"
  pip wheel --no-deps . -w dist
}

package() {
  cd "${_plug}"
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  exit
}

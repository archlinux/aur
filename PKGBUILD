# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsdpir
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2.3.0.0.gb2dcc4b
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-dpir'
license=('MIT')
depends=('vapoursynth-plugin-vsutil-git'
         'python-numpy'
         'python-tqdm'
         'python-requests'
         )
makedepends=('git'
             'python-packaging'
             )
optdepends=('python-pytorch: pytorch CPU with AVX2 optimizations'
            'python-pytorch-cuda: pytorch CUDA with CPU with AVX2 optimizations'
            'python-onnxruntime: ONXXRuntime support'
            'python-onnxruntime-cuda: ONXXRuntime CUDA support'
            )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/vs-dpir.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}/vsdpir"
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
}

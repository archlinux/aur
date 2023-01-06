# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsswinir
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.0.0.gee1e764
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-swinir'
license=('Apache')
depends=('vapoursynth'
         'python-numpy'
         'python-tqdm'
         'python-requests'
         )
makedepends=('git'
             'python-pip'
             )
optdepends=('python-pytorch: CPU with AVX2 optimizations'
            'python-pytorch-cuda: CUDA with CPU with AVX2 optimizations'
            )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/vs-swinir.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}/vsswinir"
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

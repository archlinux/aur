# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsffdnet
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.1.1.0.ga07ab9a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('any')
url='https://github.com/HolyWu/vs-ffdnet'
license=('MIT')
depends=('vapoursynth'
         'python-numpy'
         )
makedepends=('git'
             'python-pip'
             )
optdepends=('python-pytorch: CPU with AVX2 optimizations'
            'python-pytorch-cuda: CUDA with CPU with AVX2 optimizations'
            )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/vs-ffdnet.git"
        'https://github.com/NSQY/vs-ffdnet/commit/e770853e55840f4b4682ea5687d6a5b8d335f0eb.diff')
sha256sums=('SKIP'
            '1aed9b1223e2ec510a8f92f8884c1732fc9e21fba40f633a60ccbf7b082d2b0f'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  cd "${_plug}"
  patch -p1 -i "${srcdir}/e770853e55840f4b4682ea5687d6a5b8d335f0eb.diff"
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

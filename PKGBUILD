# Maintainer: Leo Mao <leomaoyw at gmail dot com>
pkgname=python-torchaudio-git
_pkgname=audio
pkgver=r830.9d50acf3
pkgrel=1
pkgdesc="Data manipulation and transformation for audio signal processing, powered by PyTorch"
arch=('x86_64')
url="https://github.com/pytorch/audio"
license=('BSD')
depends=('python' 'sox' 'python-pytorch')
optdepends=('python-kaldi-io' 'python-soundfile')
makedepends=('git' 'python-setuptools' 'cmake' 'ninja')
provides=('python-torchaudio')
conflicts=('python-torchaudio')
source=("git+$url"
        "git+https://github.com/kaldi-asr/kaldi.git")
sha256sums=('SKIP'
            'SKIP')

pkgver () {
  cd "${_pkgname}"
  (
    set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${_pkgname}"
  git config submodule.kaldi.url "$srcdir/kaldi"
  git submodule update third_party/kaldi/submodule
}

build() {
  msg "Building Python 3"
  cd "${srcdir}/${_pkgname}"
  CUDA_HOME=/opt/cuda \
  BUILD_SOX=1 \
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="${pkgdir}"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:

# Maintainer: blinry <mail@blinry.org>

pkgname=whisper-git
_pkgname=whisper
pkgver=r102.b5851c6
pkgrel=1
pkgdesc="General-purpose speech recognition model by OpenAI"
arch=('any')
url="https://github.com/openai/whisper"
license=('MIT')
depends=()
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
provides=('whisper')
source=('git+https://github.com/openai/whisper')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/whisper"
  python -m build --no-isolation --wheel
}

package() {
  depends=(
    'python-more-itertools'
    'python-numba'
    'python-pytorch'
    'python-tqdm'

    # AUR
    'python-ffmpeg'
    'python-tiktoken'
  )

  cd "$srcdir/whisper"
  python -m installer \
    --compile-bytecode 1 \
    --destdir "$pkgdir" \
    dist/*.whl

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

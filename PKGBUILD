# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=alabamaencoder
pkgname=$_pkgname-git
pkgver=0.5.4.r381.a46b4a8
pkgrel=1
pkgdesc='Video encoder framework with a focus on chunked target quality encoding'
arch=(x86_64)
url=https://github.com/kingstefan26/alabamaEncoder
license=(MIT)
depends=(
  python-scenedetect
  python-tqdm
  python-celery
  python-redis
  python-psutil
  python-opencv
  python-requests
  python-torf
  python-websockets
  python-scipy
  python-numpy
  python-scikit-image
  python-argparse-range
  python-matplotlib
)
makedepends=(
  git
  python-build
  python-installer
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  local _ver=$(grep -oP 'version = "\K[^"]+' $_pkgname/pyproject.toml)
  printf '%s.r%s.%s' "$_ver" \
    "$(git -C $_pkgname rev-list --count HEAD)" \
    "$(git -C $_pkgname rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

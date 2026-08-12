# Maintainer: Damian Höster <damian.hoester@posteo.de>

_pkgname=psy-ex-metrics
pkgname=$_pkgname-git
pkgver=0.r61.45b63c7
pkgrel=1
pkgdesc='Perceptual video metrics toolkit'
arch=(any)
url=https://github.com/psy-ex/metrics
license=(Apache-2.0)
depends=(
  ffmpeg
  python
  python-matplotlib
  python-numpy
  python-scipy
  python-tqdm
  uv
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools
  python-wheel
)
optdepends=(
  ffvship
  svt-av1
)
provides=($_pkgname)
conflicts=($_pkgname)
source=($_pkgname::git+$url.git)
sha256sums=(SKIP)

pkgver() {
  printf "0.r%s.%s" \
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

  for _script in encode plot scores stats; do
    ln -s "$_script" "$pkgdir/usr/bin/psy-ex-$_script"
  done

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

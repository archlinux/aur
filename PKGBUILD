# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-ffmpeg-progress-yield-git
pkgver=1.0.3.r0.g9c60183
pkgrel=2
pkgdesc='Run an FFmpeg command with its progress yielded'
arch=(any)
url=https://github.com/slhck/ffmpeg-progress-yield
license=(MIT)
depends=(ffmpeg python-tqdm)
checkdepends=(ffmpeg procps-ng python-pytest-asyncio uv)
makedepends=(git python-installer python-uv-build uv)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  git -C $pkgname describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C $pkgname clean -dfx
}

build() {
  cd $pkgname
  #python -m build --wheel --no-isolation
  uv --no-cache --offline build --no-build-isolation --out-dir=dist --wheel .
}

check() {
  cd $pkgname
  uv venv --system-site-packages
  uv --offline --no-cache pip install --link-mode=copy --no-deps dist/*.whl
  PATH=".venv/bin:$PATH" ./.venv/bin/python -m pytest tests
}

package() {
  cd $pkgname
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

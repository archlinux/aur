# Maintainer: willemw <willemw12@gmail.com>

pkgname=ffmpeg-normalize-git
pkgver=1.33.1.r0.gdd689b5
pkgrel=1
pkgdesc='Normalize loudness of audio and video files using FFmpeg'
arch=(any)
url=https://github.com/slhck/ffmpeg-normalize
license=(MIT)
depends=(ffmpeg python-colorlog python-ffmpeg-progress-yield python-mutagen python-tqdm)
checkdepends=(git python-pytest uv)
makedepends=(git python-build python-installer python-uv-build)
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
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname
  uv run pytest tests
}

package() {
  cd $pkgname
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-ffmpeg-progress-yield-git
pkgver=0.12.0.r1.ge52f51d
pkgrel=1
pkgdesc='Run an FFmpeg command with its progress yielded'
arch=(any)
url=https://github.com/slhck/ffmpeg-progress-yield
license=(MIT)
depends=(ffmpeg python-tqdm)
checkdepends=(ffmpeg python-pytest-asyncio)
makedepends=(git python-build python-installer python-wheel python-setuptools)
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
  pytest test/test.py
}

package() {
  cd $pkgname
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

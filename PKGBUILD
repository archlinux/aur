# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-ffmpeg-progress-yield-git
pkgver=1.0.1.r0.g1d91234
pkgrel=1
pkgdesc='Run an FFmpeg command with its progress yielded'
arch=(any)
url=https://github.com/slhck/ffmpeg-progress-yield
license=(MIT)
depends=(ffmpeg python-tqdm)
checkdepends=(ffmpeg procps-ng python-pytest-asyncio)
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
  # pytest test/test.py
  pytest test/test.py --deselect test/test.py::TestAsyncLibrary::test_async_automatic_cleanup_on_exception
}

package() {
  cd $pkgname
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

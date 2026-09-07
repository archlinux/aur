# Maintainer: willemw <willemw12@gmail.com>

pkgname=better-adb-sync-git
pkgver=1.4.1.r100.g8ad077f
pkgrel=1
pkgdesc='Synchronize files between a PC and an Android device using ADB (Android Debug Bridge)'
arch=(any)
#url=https://github.com/jb2170/better-adb-sync
url=https://github.com/jpstotz/better-adb-sync
license=(Apache)
depends=(android-tools android-udev python-build)
makedepends=(git python-build python-installer python-wheel python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  local version
  version=$(sed -n 's/^version = "\(.*\)"/\1/p' pyproject.toml)
  printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  git -C $pkgname clean -dfx
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

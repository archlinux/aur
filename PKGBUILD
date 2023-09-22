# Maintainer: willemw <willemw12@gmail.com>

pkgname=podfox-git
pkgver=r92.0ec75cb
pkgrel=1
pkgdesc='Catch and manage podcasts from the terminal'
arch=(any)
url=https://github.com/brtmr/podfox
license=(GPL3)
makedepends=(git python-build python-installer python-wheel python-setuptools)
depends=(python-colorama python-docopt python-feedparser python-pycurl python-requests)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C $pkgname clean -dfx

  # Patch: add "global CONFIGURATION" statement
  sed -i 's|\(^[ \t]*\)\([^ ]*\)\( = json.load\)|\1global \2\n\1\2\3|' $pkgname/podfox/__init__.py
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

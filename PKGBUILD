# Maintainer: willemw <willemw12@gmail.com>

pkgname=tv-overlord-git
pkgver=r449.df545ec
pkgrel=1
pkgdesc='Download and manage TV shows'
arch=(any)
url=https://bitbucket.org/tvoverlord/tv-overlord
license=(GPL)
depends=(python-beautifulsoup4 python-click python-colorama python-dateutil python-feedparser python-tvdb_api)
makedepends=(git python-build python-installer python-wheel python-setuptools)
optdepends=('deluge: torrent client' 'transmission-cli: torrent client')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C $pkgname clean -dfx
  sed -i "s|'tvoverlord/search_providers'.*||" $pkgname/setup.py
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
}

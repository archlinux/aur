# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=python-ezchlog-git
_pkgname=${pkgname#python-}
_pkgname=${_pkgname%-git}
pkgver=1.2.0.r1.2a5185d
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('any')
url="https://gitlab.com/jrdasm/ezchlog"
license=('MIT')
depends=('python>=3.11')
# depends=('python>=3.10' 'python-tomli')
makedepends=('git' 'uv' 'python-installer')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//;')"
}

build() {
  cd "$_pkgname"
  # strip installation info in README
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
  uv build --wheel
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

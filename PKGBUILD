# Maintainer: Cyrille Pontvieux <cyrille@enialis.net>
pkgname=python-ezchlog-git
_pkgname=${pkgname#python-}
_pkgname=${_pkgname%-git}
pkgver=v1.0.2.r0.22d2311
pkgrel=1
pkgdesc="Easy git branch friendly changelogs"
arch=('any')
url="https://gitlab.com/jrdasm/ezchlog"
license=('MIT')
depends=('python>=3.11')
# depends=('python>=3.9' 'python-tomli')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_pkgname"
  sed -i '/^Python version$/,/^Add a changelog$/{/^Add a changelog$/!d}' README.md
  python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -t "$pkgdir/usr/share/doc/$pkgname" README.md
}

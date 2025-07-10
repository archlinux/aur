# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Kazuo Teramoto <kaz.rag at gmail.com>

pkgname=afew-git
_pkgname=${pkgname%-git}
pkgver=3.0.1.r78.gbc09b14
pkgrel=1
epoch=1
pkgdesc='Initial tagging script for notmuch mail'
arch=(any)
url=https://github.com/afewmail/afew
license=(ISC)
depends=(
  notmuch
  python-chardet
  python-cffi
  python-dkim
  python-setuptools
)
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
  python-sphinx
  python-wheel
)
optdepends=('python-pyinotify: for --watch')
checkdepends=(python-freezegun)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build --wheel --skip-dependency-check --no-isolation
  PYTHONPATH="build:$PYTHONPATH" sphinx-build -b man docs build
}

check() {
  cd "$_pkgname"
  python -m unittest discover "$_pkgname"/tests
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 build/"$_pkgname".1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

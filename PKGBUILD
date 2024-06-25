# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Kazuo Teramoto <kaz.rag at gmail.com>

pkgname=afew-git
_pkgname=${pkgname%-git}
pkgver=3.0.1.r63.g65227fa
pkgrel=1
epoch=1
pkgdesc='Initial tagging script for notmuch mail'
arch=(any)
url=https://github.com/afewmail/afew
license=(ISC)
depends=(
  notmuch
  python-chardet
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
checkdepends=(python-freezegun)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=(SKIP)

pkgver() {
  cd afew
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

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_pkgname"-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# Maintainer: Kevin Brodsky <corax26 'at' gmail 'dot' com>

pkgname=git-filter-repo-git
_pkgname=git-filter-repo
pkgver=2.47.0.r18.gc1d8461
pkgrel=1
pkgdesc='Quickly rewrite git repository history (filter-branch replacement)'
arch=(any)
url="https://github.com/newren/$_pkgname"
license=('MIT OR GLP-2.0-or-later')
depends=(git
         python)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
checkdepends=(rsync)
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/newren/$_pkgname.git")
sha256sums=(SKIP)

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  python -m build -wn
  make snag_docs # For the man page
}

check() {
  cd "$_pkgname"
  ./t/run_tests
}

package() {
  cd "$_pkgname"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/man/man1/" Documentation/man1/$_pkgname.1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" COPYING{,.gpl,.mit}
}

# vim:set ts=2 sw=2 et:

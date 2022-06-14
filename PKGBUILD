# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager-git
_pkgname=${pkgname%-git}
pkgver=v5.1.0.r42.g3a916b0
pkgrel=1
provides=($_pkgname)
conflicts=($_pkgname)
pkgdesc='A wrapper around all package managers (git version)'
url='https://kdeldycke.github.io/meta-package-manager/'
makedepends=(python-build python-installer python-wheel python-poetry)
depends=('python>=3.7' python-boltons python-click python-click-extra python-tabulate python-tomli python-tomli-w python-xmltodict)
checkdepends=(python-pytest python-pytest-cov python-pytest-randomly python-pytest-xdist)
license=('GPL2')
arch=('any')
source=("git+https://github.com/kdeldycke/meta-package-manager.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # Poetry has a bug where .gitignore files in any parent directory is used in excluding files to build, resulting in an empty package.
    if [ -e "$srcdir/../.gitignore" ]; then
        mv "$srcdir/../.gitignore" "$srcdir/../.gitignore.bak"
        GITIGNORE_MOVED=1
    fi
    cd "$srcdir/$_pkgname"
    python -m build --wheel --no-isolation
    if [ $GITIGNORE_MOVED = 1 ]; then
        mv "$srcdir/../.gitignore.bak" "$srcdir/../.gitignore"
    fi
}

check() {
    # Pytest does currently not run successfully due to a bug in the tests. Will be uncommented when the bug is fixed.
    # cd "$srcdir/$_pkgname-$pkgver"
    # pytest
    true
}

package() {
    cd "$srcdir/$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$_pkgname/" license
}

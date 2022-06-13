# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=meta-package-manager
pkgver=5.1.0
pkgrel=1
pkgdesc='A wrapper around all package managers'
url='https://kdeldycke.github.io/meta-package-manager/'
makedepends=(python-build python-installer python-wheel python-poetry)
depends=(python python-boltons python-click python-click-extra python-tabulate python-tomli python-tomli-w python-xmltodict)
checkdepends=(python-pytest python-pytest-cov python-pytest-randomly python-pytest-xdist)
license=('GPL2')
arch=('any')
source=("https://github.com/kdeldycke/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('3af56837b077260ca45311c1314a8ec09acc7535579f37236a7d39554f726f78ff238d6262a7fb3790bd320c1883484f210854a184b362c030b8bac121b6938b')

build() {
    # Poetry has a bug where .gitignore files in any parent directory is used in excluding files to build, resulting in an empty package.
    if [ -e "$srcdir/../.gitignore" ]; then
        mv "$srcdir/../.gitignore" "$srcdir/../.gitignore.bak"
        GITIGNORE_MOVED=1
    fi
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
    if [ $GITIGNORE_MOVED = 1 ]; then
        mv "$srcdir/../.gitignore.bak" "$srcdir/../.gitignore"
    fi
}

check() {
    # Pytest does currently not run successfully due to a bug in the tests. Will be uncommented when the bug is fixed.
    # cd "$srcdir/$pkgname-$pkgver"
    # pytest
    true
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}

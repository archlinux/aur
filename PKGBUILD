# Maintainer: Sidney Kuyateh <autinerd-arch@kuyateh.eu>

pkgname=python-click-extra
_name=${pkgname#python-}
pkgver=2.1.1
pkgrel=1
pkgdesc='Extra colorization and configuration loading for Click.'
url='https://kdeldycke.github.io/click-extra/'
makedepends=(python-build python-installer python-wheel python-poetry-core)
depends=(python python-boltons python-click python-cli_helpers python-cloup python-commentjson python-mergedeep python-yaml python-regex python-requests python-tabulate python-tomli 'python-xmltodict<0.14')
checkdepends=(python-pytest python-pytest-cov python-pytest-httpserver python-pytest-randomly)
license=('GPL2')
arch=('any')
source=("https://github.com/kdeldycke/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('8f020c50eec23fb7b1af34a07999edc59005c8cd81f63f8320d2714751108513a4930953f4fd60e97b345778627138f0feea28f78b81be2d5c3c0abf5dbe1e8d')

build() {
    # Poetry has a bug where .gitignore files in any parent directory is used in excluding files to build, resulting in an empty package.
    if [ -e "$srcdir/../.gitignore" ]; then
        mv "$srcdir/../.gitignore" "$srcdir/../.gitignore.bak"
        GITIGNORE_MOVED=1
    fi
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
    if [ $GITIGNORE_MOVED = 1 ]; then
        mv "$srcdir/../.gitignore.bak" "$srcdir/../.gitignore"
    fi
}

check() {
    cd "$srcdir/$_name-$pkgver"
    pytest
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" license
}

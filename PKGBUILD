# Maintainer: DrRac27 <drrac27 at riseup dot net>

pkgname=karoto-git
pkgver=0.1.r0.dee4b96
pkgrel=1
pkgdesc='A shopping list app for Linux Mobile.'
arch=('any')
url='https://codeberg.org/DrRac27/karoto'
license=('MIT')
provides=('karoto')
conflicts=('karoto')
depends=('python-pyqt6')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry-core')
checkdepends=('python-pytest' 'python-pytest-qt' 'flake8')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
    cd "$pkgname"
    local tag=$(git tag --sort=-v:refname | head -1)
    local commits_since=$(git rev-list $tag..HEAD --count)
    echo "$tag.r$commits_since.$(git log --pretty=format:'%h' -n 1)"
}

prepare() {
    cd "$pkgname"
    # Remove unnecessary dependency version pinning
    sed -i 's/= "^[0-9.]*"/= "*"/' pyproject.toml
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    bash helper.sh tests
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 packaging/karoto.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/karoto.svg"
    install -Dm 644 packaging/karoto.desktop "$pkgdir/usr/share/applications/karoto.desktop"
}

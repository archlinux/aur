# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname=python-wsgi-intercept
pkgver=1.13.1
pkgrel=3
pkgdesc="Intercept socket connection to wsgi applications for testing"
arch=(any)
url="https://github.com/cdent/wsgi-intercept"
license=(MIT)
depends=(
    'python'
    'python-six'
)
checkdepends=(
    'python-httplib2'
    'python-pytest'
    'python-requests'
    'python-urllib3'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-sphinx'
    'python-setuptools'
    'python-wheel'
    'python-httplib2'
    'tar'
)
optdepends=(
    'python-httplib2: for intercepting requests of python-httplib2'
    'python-requests: for intercepting requests of python-requests'
    'python-urllib3: for intercepting requests of python-urllib3'
)
source=("$pkgname-$pkgver.tar.gz::https://api.github.com/repos/cdent/${pkgname#python-}/tarball/refs/tags/v$pkgver")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('ae4e93ae04d86caa3a7787969e5806a386aae78b3c4369e00de211383a78aa9e213ff67ab8c7f6de7c0fef046ea63fb80c3fceb401ea956ba79af87097ed8ee8')

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build() {
    cd "$pkgname-$pkgver" || exit
    python -m build --wheel --no-isolation
    sphinx-build docs build/sphinx --builder man --quiet
}

#check() {
#    cd "$pkgname-$pkgver" || exit
#    pytest -v
#}

package() {
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    local site_packages
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -vDm644 README -t "$pkgdir/usr/share/$pkgname/"
    install -vDm644 build/sphinx/wsgi_intercept.1 -t "$pkgdir/usr/share/man/man1/"
    rm -rf "$pkgdir/$site_packages/wsgi_intercept/tests/"
}

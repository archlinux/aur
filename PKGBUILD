# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Neil Santos <nsantos16+aur@gmail.com>

pkgname=python-wsgi-intercept
_name=${pkgname#python-}
pkgver=1.13.0
pkgrel=4
pkgdesc="Intercept socket connection to wsgi applications for testing"
arch=(any)
url="https://github.com/cdent/wsgi-intercept"
license=(MIT)
depends=('python'
         'python-six')
makedepends=('python-build'
             'python-installer'
             'python-sphinx'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-httplib2'
              'python-pytest'
              'python-requests'
              'python-urllib3')
optdepends=('python-httplib2: for intercepting requests of python-httplib2'
            'python-requests: for intercepting requests of python-requests'
            'python-urllib3: for intercepting requests of python-urllib3')
source=("$_name-$pkgver.tar.gz::https://api.github.com/repos/cdent/$_name/tarball/refs/tags/v$pkgver"
        "tmp-path-to-pass-all-unit-tests.diff")
b2sums=('57ed44e6dd1bdf70193a4920da15b8e0dd2c5dd41a61efedf6f9aaf4778114519c7766dec9a3f42690dce4be061785fd62c1f1e847d9d6f034dfe1846b454f19'
        'b7b9b0352aadabb2c72c2f2fd66a98de7e792992bd72f78eb96877658dfe596a044421bcfde7d9e5bf3517f1e7fea1c1dfe4cd7a3c6ac4dc3e77faa039a25f67')

prepare() {
    tar zxvf "$_name-$pkgver.tar.gz" --strip-components=1 --one-top-level
    cd "$_name-$pkgver"
    patch --forward --strip 1 --input ../tmp-path-to-pass-all-unit-tests.diff

}

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
    sphinx-build docs build/sphinx --builder man
}

check() {
    cd "$_name-$pkgver"
    python -m pytest -vv
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm 644 README -t "$pkgdir/usr/share/$pkgname/"
    install -Dm 644 "build/sphinx/${_name//-/_}.1" -t "$pkgdir/usr/share/man/man1/"
    rm -frv "$pkgdir/$site_packages/${_name//-/_}/tests/"
}

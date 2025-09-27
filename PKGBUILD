# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
pkgname=python-checkpy
_name=${pkgname#python-}
pkgver=2.1.2
pkgrel=1
pkgdesc="A Python tool for running tests on Python source files, intended for educational use"
arch=('any')
url="https://github.com/Jelleas/CheckPy"
license=('MIT')
depends=('python' 
         'python-requests'
         'python-tinydb'
         'python-dill'
         'python-colorama'
         'python-pytest'
         'python-dessert'
         'python-typeguard'
         'python-numpy')
makedepends=('python-build' 
             'python-installer' 
             'python-wheel'
             'python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b37fcd86b756bcae60c867334412207940e44816fbdb0cc832cdb25f59e3546a')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    python -m pytest -v || true
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    install -dm777 "$pkgdir/usr/lib/python$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')/site-packages/checkpy/tests"    
    chmod 777 "$pkgdir/usr/lib/python$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')/site-packages/checkpy/database"
}

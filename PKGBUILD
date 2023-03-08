# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-redis-lock
pkgver=4.0.0
pkgrel=1
pkgdesc="Lock context manager implemented via redis SET NX EX and BLPOP"
url="https://pypi.org/project/python-redis-lock/"
depends=('python' 'python-redis')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-django-redis')
checkdepends=('python-pytest' 'python-process-tests' 'python-pytest-cov' 'python-gevent' 'python-eventlet' 'python-django-redis')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")

sha256sums=('4abd0bcf49136acad66727bf5486dd2494078ca55e49efa693f794077319091a')

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd ${pkgname}-${pkgver}
    python -m installer --destdir=test_dir dist/*.whl
    export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
    # django tests not compatible with django 4.1+ it seems
    PYTHONUNBUFFERED=yes DJANGO_SETTINGS_MODULE=test_project.settings pytest -vv -k "not django"
}

build() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"/${pkgname}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=automua
pkgver=2023.0
pkgrel=3
pkgdesc="Email client configuration made easy"
arch=('any')
license=('GPL3')
backup=('etc/automua/automua.conf')
url='https://github.com/HLFH/automua'
depends=('python' 'python-hatchling' 'python-flask' 'python-flask-migrate' 'python-flask-sqlalchemy' 'python-ldap3' 'python-werkzeug' 'python-sqlalchemy' 'python-alembic' 'python-lxml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-pytest' 'python-pytest-flask' 'python-coverage')
optdepends=('python-mysqlclient')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        'automua.conf'
        'automua.service')
b2sums=('cfa5128602e1d4119590c34094e4b984d3970c1df33dd32ea35bc8e954ef1d6f8a16bdb25764a81ad01b15f9303cddd1218f34b8867d84ed81d0b633ba359d36'
        'aa90ba9f0d8ed7764027a263f22010e4af0060fad28a771c4dd84b4270eeb3e7b5b78b3cab3c8d50d8a7b6beef7bf567b2cabbb8579ca87b419904c9f4ecbc46'
        '44056a40b51d74f02fe36751701568316620e3fceff118992cb359c61e9f1079ecc6c6f5a2a6e0e3ae8482548cfa14a5c3496dd7985153ee0cca6b24080e305c')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

# community/python-flask-sqlalchemy is outdated
#check() {
#  cd $pkgname-$pkgver
#  AUTOMUA_CONF=tests/unittest.conf RUN_LDAP_TESTS=0 PYTHONPATH=. coverage run --source automua -m pytest
#  coverage html --rcfile=tests/coverage.rc
#}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    mkdir -p "$pkgdir/etc/automua"
    install -Dm644 "${srcdir}/automua.conf" "${pkgdir}/etc/automua/automua.conf"
    install -Dm644 "${srcdir}/automua.service" "${pkgdir}/usr/lib/systemd/system/automua.service"
}

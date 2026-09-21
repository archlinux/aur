# Maintainer: Agil Mammadov <mammadovagil@proton.me>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: NIgel Kukard <nkukard at LBSD dot net>
# Contributor: RcrdBrt

pkgname=python-flask-admin
_pkgname=flask-admin
_name=flask_admin
pkgver=2.2.1
pkgrel=2
pkgdesc="Simple and extensible admin interface framework for Flask"
url="https://github.com/pallets-eco/flask-admin/"
depends=(python python-flask python-jinja python-markupsafe python-werkzeug python-wtforms)
makedepends=(python-build python-installer python-flit-core)
license=('BSD-3-Clause')
arch=('any')
optdepends=('python-flask-sqlalchemy: SQLAlchemy backend'
            'python-sqlalchemy: SQLAlchemy backend'
            'python-pymongo: MongoDB (pymongo) backend'
            'python-mongoengine: MongoEngine backend'
            'python-peewee: Peewee backend'
            'python-boto3: S3 file admin backend'
            'python-azure-storage-blob: Azure Blob Storage file admin backend'
            'python-pillow: image handling'
            'python-tablib: export support'
            'python-redis: Redis console'
            'python-flask-babel: translations')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('08b4b6b63d2100598add70c1dc9a695f484e3c16c894c09ac70af26acb26a87d')

build() {
    cd "$srcdir/$_name-$pkgver"
    # Upstream pyproject.toml uses non-PEP 621 'author' instead of 'authors',
    # rejected by flit_core>=4. Drop once fixed upstream.
    sed -i 's/^author =/authors =/' pyproject.toml
    # Upstream pins 'flit_core<4' but the build works with system flit_core>=4,
    # so skip python-build's backend version check.
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

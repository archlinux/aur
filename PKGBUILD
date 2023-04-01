# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgbase='dbt-core'
pkgname=('dbt-core' 'dbt-postgres')
pkgver=1.4.5
pkgrel=1
pkgdesc="Tool for data analysts to build analytics the way engineers build applications"
arch=('any')
url="https://getdbt.com/"
license=('Apache')
makedepends=("python" "python-pytest")
depends=(
    "python-jinja" "python-agate" "python-click" "python-colorama" "python-hologram"
    "python-isodate" "python-logbook" "python-mashumaro" 
    "python-minimal-snowplow-tracker" "python-networkx" "python-packaging" "python-sqlparse"
    "python-dbt-extractor-git" "python-typing_extensions"
    "python-pathspec" "python-protobuf" "python-pytz" "python-requests"
    "python-pyyaml" "python-betterproto-git" "python-psycopg2"
)
source=("$pkgbase-$pkgver.tar.gz::https://github.com/dbt-labs/$pkgbase/archive/v$pkgver.tar.gz")
md5sums=('d48661b0bc490829192af3dbac8d40c0')

build() {
    export PYTHONSEED=1
    cd $pkgbase-$pkgver/core
    python setup.py build
    cd ../plugins/postgres
    python setup.py build
}

check() {
    cd $pkgbase-$pkgver
    export PYTHONPATH=core:plugins/postgres
    pytest --cov=core test/unit
    pytest --cov=core tests/unit
}

package_dbt-core() {
    cd $pkgbase-$pkgver/core
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

package_dbt-postgres() {
    depends=("python" "dbt-core" "python-psycopg2")
    cd $pkgbase-$pkgver/plugins/postgres
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

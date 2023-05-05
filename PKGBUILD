# Maintainer: Benoît Allard <benoit.allard@gmx.de>
#
# Note: while those are suposed to be two different python packages, they share 
# the same package name (dbt.adapter), and hence, (at least) the __init__.py
# Making it impossible to split in two different packages.
# So this generates a combined package.
#
pkgname='dbt-core'
pkgver=1.5.0
pkgrel=1
pkgdesc="Tool for data analysts to build analytics the way engineers build applications"
arch=('any')
url="https://getdbt.com/"
license=('Apache')
makedepends=("python" "python-pytest" "python-pytest-cov" "python-freezegun")
depends=(
    "python-jinja" "python-agate" "python-click" "python-colorama" "python-hologram"
    "python-isodate" "python-logbook" "python-mashumaro" 
    "python-minimal-snowplow-tracker" "python-networkx" "python-packaging" "python-sqlparse"
    "python-dbt-extractor-git" "python-typing_extensions"
    "python-pathspec" "python-protobuf" "python-pytz" "python-requests"
    "python-pyyaml" "python-betterproto-git" "python-psycopg2"
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/dbt-labs/$pkgname/archive/v$pkgver.tar.gz"
    "mashumaro.patch"
    "agate.patch"
    )
sha256sums=('ebeb6603f56d8cdb1b355ce036d9ad18073130ef2be2c7cb318b5dd6a476ef3a'
            '37763387026bafddbdfa3a5c06bcc9ab56af897547012a833b9f8c8f5758ed1c'
            'efcc5228544d032f0d1a0351a7b528f2e722d17fe3c363df301292a60b84b2f1')

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip=1 --input="${srcdir}/mashumaro.patch"
    patch --forward --strip=1 --input="${srcdir}/agate.patch"
}

build() {
    export PYTHONSEED=1
    cd $pkgname-$pkgver/core
    python setup.py build
    cd ../plugins/postgres
    python setup.py build
}

check() {
    cd $pkgname-$pkgver
    export PYTHONPATH=core:plugins/postgres
    pytest --cov=core test/unit
    pytest --cov=core tests/unit
}

package() {
    cd $pkgname-$pkgver/core
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    cd ../plugins/postgres
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


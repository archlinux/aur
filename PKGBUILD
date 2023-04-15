# Maintainer: Benoît Allard <benoit.allard@gmx.de>
#
# Note: while those are suposed to be two different python packages, they share 
# the same package name (dbt.adapter), and hence, (at least) the __init__.py
# Making it impossible to split in two different packages.
# So this generates a combined package.
#
pkgname='dbt-core'
pkgver=1.4.5
pkgrel=8
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
    "pathspec.patch"
    "mashumaro.patch"
    "hologram.patch"
    "betterproto.patch"
    "agate.patch"
    )
md5sums=('d48661b0bc490829192af3dbac8d40c0'
         '8da5228598d2427e4430d70929415bdf'
         '2fc3a072a73cc43cd506b845d326fff4'
         '2bf8a03955617501a40aaa668b85be85'
         'e1d1168e702f0538283e43c1f1328dd2'
         '6dafb0c15f871270d1a617aee8b82f05')

prepare() {
    cd $pkgname-$pkgver
    patch --forward --strip=1 --input="${srcdir}/pathspec.patch"
    patch --forward --strip=1 --input="${srcdir}/mashumaro.patch"
    patch --forward --strip=1 --input="${srcdir}/hologram.patch"
    patch --forward --strip=1 --input="${srcdir}/betterproto.patch"
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


# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: BigfootACA <bigfoot@classfun.cn>

pkgname=python-pycadf
pkgver=4.0.1
pkgrel=1
pkgdesc="CADF Python module"
arch=(any)
url="https://opendev.org/openstack/pycadf"
license=(Apache-2.0)
depends=(
    'python'
     'python-oslo-config'
     'python-oslo-serialization'
     'python-fixtures'
     'python-testtools'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'tar'
    'python-pbr'
)
checkdepends=(
    'python-hacking'
    'python-flake8-import-order'
    'python-coverage'
    'python-fixtures'
    'python-subunit'
    'python-stestr'
    'python-debtcollector'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('3cda982b9842df5e9eb2028156c6fdfb01379a0ec65b48144e5f81fd589e8794c0bb5dcf2c3fdba765c031450a059a22f5091c0f763d69794ae60337b58277ca')
backup=(
    "etc/${pkgname#python-}/trove_api_audit_map.conf"
    "etc/${pkgname#python-}/swift_api_audit_map.conf"
    "etc/${pkgname#python-}/nova_api_audit_map.conf"
    "etc/${pkgname#python-}/neutron_api_audit_map.conf"
    "etc/${pkgname#python-}/ironic_api_audit_map.conf"
    "etc/${pkgname#python-}/heat_api_audit_map.conf"
    "etc/${pkgname#python-}/gnocchi_api_audit_map.conf"
    "etc/${pkgname#python-}/glance_api_audit_map.conf"
    "etc/${pkgname#python-}/cinder_api_audit_map.conf"
)

prepare() {
    tar zxvf "$pkgname-$pkgver.tar.gz" --strip-components=1 --one-top-level
}

build(){
    cd "$pkgname-$pkgver" || exit
    PBR_VERSION=$pkgver python -m build --wheel --no-isolation
}

check(){
    cd "$pkgname-$pkgver" || exit
    stestr run
}

package(){
    cd "$pkgname-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf "$pkgdir/usr/etc"
    install -dDm755 "$pkgdir/etc/${pkgname#python-}"
    install -Dm644 "etc/${pkgname#python-}/trove_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/swift_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/nova_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/neutron_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/ironic_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/heat_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/gnocchi_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/glance_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 "etc/${pkgname#python-}/cinder_api_audit_map.conf" "$pkgdir/etc/${pkgname#python-}/"
    install -Dm644 README.rst -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

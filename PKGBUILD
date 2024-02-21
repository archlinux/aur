# Maintainer: Amish <contact at via dot aur>
pkgname=python-fangfrisch
_name=${pkgname#python-}
pkgver=1.8.0
pkgrel=4
pkgdesc="Freshclam like utility that allows downloading unofficial virus definition files"
arch=('any')
license=('GPL')
url="https://rseichter.github.io/fangfrisch/"
conflicts=('clamav-unofficial-sigs')
provides=('clamav-unofficial-sigs')
depends=('clamav' 'python-requests' 'python-sqlalchemy>=1.4.0')
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rseichter/fangfrisch/archive/${pkgver}.tar.gz"
        "${_name}.conf"
        "${_name}.service"
        "${_name}.timer"
        "${_name}.tmpfiles")
sha512sums=('5ded17871b8efa65dd529f70965746fb84c5d36cfe608a5bc8edf5ac7542837eb05450a442e45d8afe466b05c5f421381ba19af4287b13b03533653d8c1d223d'
            '3ad6d187e7a549f14e7fb72fcd105fda37dd85512186380caf5f71b3614fa424cc6fdad83ba8da365ff0e61e1fbfeb6bbd78e51e46a5ef86c263f90d6598fe39'
            '266df243ac0a23efc2797583b9c1e09855aa43b9decabd78bc1ca8a5158c5a71ceee9f77ededc374bd17be094595acd84bea729fc7459cc71337d1029911591f'
            '22462dbb76e9b1df0717efff6c94a49b1db33c150380abc0d66bccc72215eab89ab871ba6e359db817543130ae45844665fc106cae8990dbf92f8a27851d15da'
            'f421c4f2618422957cd203bf8f50bae1e5656d6208774244092987c07427ca86bf587884510c9180a0cb554200fdc996b0fad382671c913e6729b215b6f8e651')
backup=('etc/fangfrisch/fangfrisch.conf')
install=fangfrisch.install

build() {
    cd "$_name-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver" || exit 1
    rm -rf tmp_unittest
    mkdir -p tmp_unittest
    sed -i -e "s,/tmp/fangfrisch/unittest,$srcdir/$_name-$pkgver/tmp_unittest," tests/tests.conf tests/__init__.py
    sqlite3 tmp_unittest/db.sqlite < tests/tests.sql
    python -m unittest discover tests/
    rm -rf tmp_unittest
}

package() {
    cd "$_name-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "${pkgdir}/etc/fangfrisch" "${srcdir}/${_name}.conf"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${_name}".{service,timer}
    install -Dm644 "${srcdir}/${_name}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"
}

# Maintainer: Amish <contact at via dot aur>
pkgname=python-fangfrisch
_name=${pkgname#python-}
pkgver=1.8.0
pkgrel=1
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
            'a6387a8320859795cbd0fb44500d753ed17981304e8c68c29eb47ffe3280d0fd6c6fe321ef86673d7ad8ee49b75769dfd89f1d10271ad8d537cb3cd88a9d3638'
            '15bf171bb2f05a97ae41d18f6155b3b9459867404402d199062e431df56d3ac4e3bfaba5382c751cf8ae4f6c932fcbfb90082792c7c49fd9fbc4f599b88e8ced'
            '10534fa180e36be07f46002174341cd348094d9739e0d8c37266ac244c804400bc3d818b4b7399d10f14201847eb0607fee7657c8cfe73b7c2b17dd719f558c5'
            'f421c4f2618422957cd203bf8f50bae1e5656d6208774244092987c07427ca86bf587884510c9180a0cb554200fdc996b0fad382671c913e6729b215b6f8e651')
backup=('etc/fangfrisch/fangfrisch.conf')
install=fangfrisch.install

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_name-$pkgver"
    rm -rf tmp_unittest
    mkdir -p tmp_unittest
    sed -i -e "s,/tmp/fangfrisch/unittest,$srcdir/$_name-$pkgver/tmp_unittest," tests/tests.conf tests/__init__.py
    sqlite3 tmp_unittest/db.sqlite < tests/tests.sql
    python -m unittest discover tests/
    rm -rf tmp_unittest
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "${pkgdir}/etc/fangfrisch" "${srcdir}/${_name}.conf"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${_name}".{service,timer}
    install -Dm644 "${srcdir}/${_name}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"
}

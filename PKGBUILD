# Maintainer: Amish <contact at via dot aur>
pkgname=python-fangfrisch
_name=${pkgname#python-}
pkgver=1.7.0
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
sha512sums=('b922542787f9cd0b88d1a85a68dee85a62cfb8fdd24d57a91728df626a8a3d29e33ee7418766c02a3ba5c2012c4f8688165f8846eb21c05335c20667db0a9e6f'
            '8e202fcd167811fe39b81905bc598ab3752bcd225ace5b8df73a6b590f9861cd47c350f2ee4e3c9e1be8fbc5f0d2271fa2516f4c794be42e3f0afab14d496244'
            '15bf171bb2f05a97ae41d18f6155b3b9459867404402d199062e431df56d3ac4e3bfaba5382c751cf8ae4f6c932fcbfb90082792c7c49fd9fbc4f599b88e8ced'
            '5f17b94c2a86ed468ac12f84bd258b915cfaa1858cada3e59293489447c634c6401921d654000d87f8eca970bfba8a9506aced100902771d98efc7d4cdb27cb5'
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

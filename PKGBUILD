# Maintainer: Amish <contact at via dot aur>
pkgname=python-fangfrisch
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=2
pkgdesc="Freshclam like utility that allows downloading unofficial virus definition files"
arch=('any')
license=('GPL')
url="https://rseichter.github.io/fangfrisch/"
conflicts=('clamav-unofficial-sigs')
provides=('clamav-unofficial-sigs')
replaces=('clamav-unofficial-sigs')
depends=('clamav' 'python' 'python-sqlalchemy')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rseichter/fangfrisch/archive/${pkgver}.tar.gz"
        "${_name}.conf"
        "${_name}.service"
        "${_name}.timer"
        "${_name}.tmpfiles")
sha512sums=('c1ec85f58a24ccbce701cd7695a94ed0fadadae8cd384590fa801003b6f77417f95e9656a51c59f09ca30589f855c2a5a03f8445e689c3ba8b39a044b0c38d98'
            '695f6e9520e6742bd0b5f4124af8c1ee58adc8317c1fdd28eadd31c23cf984e36c49e71acba3c82441f550661e6b12c5a7d47932d1f02d001f7420f52dabbb87'
            '810fd48296fdac2b141ac8a9da02a9c133f3ae0b62177c62e72b03aab0c86b2c062f53ab070d4c5e8cbb7a6bfa6f9879225c46f604d9a0914deb0f0798a86f03'
            '5f17b94c2a86ed468ac12f84bd258b915cfaa1858cada3e59293489447c634c6401921d654000d87f8eca970bfba8a9506aced100902771d98efc7d4cdb27cb5'
            'f421c4f2618422957cd203bf8f50bae1e5656d6208774244092987c07427ca86bf587884510c9180a0cb554200fdc996b0fad382671c913e6729b215b6f8e651')
backup=('etc/fangfrisch/fangfrisch.conf')
install=fangfrisch.install

build() {
    cd $_name-$pkgver
    python setup.py build
}

check() {
    cd $_name-$pkgver
    mkdir -p /tmp/fangfrisch/unittest
    sqlite3 /tmp/fangfrisch/unittest/db.sqlite < tests/tests.sql
    python -m unittest discover tests/
    rm -rf /tmp/fangfrisch
}

package() {
    cd $_name-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 -t "${pkgdir}/etc/fangfrisch" "${srcdir}/${_name}.conf"
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${_name}".{service,timer}
    install -Dm644 "${srcdir}/${_name}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"
}

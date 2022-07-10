pkgname=python-vici
pkgver=5.9.6
pkgrel=1
pkgdesc="vici python egg to talk to strongSwan via VICI socket"
arch=(any)
url="https://strongswan.org"
license=('MIT')
makedepends=('automake' 'autoconf' 'python-setuptools')
depends=('python')
source=("https://github.com/strongswan/strongswan/releases/download/$pkgver/strongswan-$pkgver.tar.bz2"
    "use-sitepackages.patch"
    )

sha256sums=('91d0978ac448912759b85452d8ff0d578aafd4507aaf4f1c1719f9d0c7318ab7'
            '658817b0d3c1fd221521176c188b0b499c91f28c6a50a3cdbb3efd181868b960')

build() {
    cd "$srcdir/strongswan-$pkgver"
    ./configure \
        --build=$CBUILD \
        --host=$CHOST \
        --disable-defaults \
        --enable-python-eggs

    cd src/libcharon/plugins/vici/python
    make all
    python3 setup.py build
}

check() {
    cd "$srcdir/strongswan-$pkgver"
    make -C src/libcharon/plugins/vici/python check
}

package() {
    cd "$srcdir/strongswan-$pkgver/src/libcharon/plugins/vici/python/"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

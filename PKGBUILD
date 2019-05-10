# Maintainer: Alexander Sulfrian <asulfrian@zedat.fu-berlin.de>
pkgname=fbi-servefiles
pkgver=2.6.0
pkgrel=1
pkgdesc="Simple Python script for serving local files to FBI's remote installer."
arch=(any)
url="https://github.com/Steveice10/FBI/tree/master/servefiles"
license=(MIT)
depends=(python)
source=("FBI-$pkgver.tar.gz::https://github.com/Steveice10/FBI/archive/$pkgver.tar.gz")
sha256sums=(4948d4c53d754cc411b51edbf35c609ba514ae21d9d0e8f4b66a26d5c666be68)

prepare() {
    cd "FBI-$pkgver/servefiles/"
    sed -e "s/\bversion=\".*\"/version=\"$pkgver\"/" \
        -e "s/\bname=\".*\"/name=\"$pkgname\"/" \
        -i setup.py
}

build() {
    cd "FBI-$pkgver/servefiles/"
    python setup.py build
}

package() {
    cd "FBI-$pkgver/servefiles/"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    cd "$pkgdir/usr/bin/"
    for script in *.py ; do
        mv "$script" "fbi-$(basename $script .py)"
    done
}

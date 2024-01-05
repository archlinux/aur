# Maintainer: Matej Dujava <mdujava (plus) aur (at) kocurkovo (dot) cz>

pkgname=('beaker-common' 'beaker-client')
pkgbase='beaker'
pkgver=28.3
pkgrel=4
pkgdesc="Full-stack software and hardware integration testing system"
arch=('any')
url="https://beaker-project.org/"
license=('GPL' 'BSD')
makedepends=('python-nose' 'python-mock' 'python-docutils' 'python-sphinx' 'make' 'python-gssapi' 'python-lxml' 'python-prettytable' 'python-lxml' 'python-sphinxcontrib-httpdomain')
provides=('bkr' 'beaker-wizard')
options=('zipman')
source=("beaker-$pkgver.tar.gz::https://github.com/beaker-project/beaker/archive/$pkgbase-$pkgver.tar.gz"
        "0001-add-sphinx-extension.patch"
        "0002-fix-sphinx-extlinks.patch")
sha256sums=('be2bea573bc6ab70a0eacf366c63623c9cca679bbf3313c8dc6625b76e2c66b8'
            'f2cc708ff3c7f6c8c8fbc2dc13c45f89326c11a4c489f80c842f0ef518081447'
            '2649c5a7a3ec6028634ec45be3d6f15402f9f276f76976234ac4d7f27319321c')

prepare() {
    patch --directory="$pkgbase-$pkgbase-$pkgver" --forward --strip=1 --input="${srcdir}/0001-add-sphinx-extension.patch"
    patch --directory="$pkgbase-$pkgbase-$pkgver" --forward --strip=1 --input="${srcdir}/0002-fix-sphinx-extlinks.patch"
}

build() {
    export BKR_PY3="$(which python3)"
    cd "$pkgbase-$pkgbase-$pkgver"

    make -C documentation build
    make -C Common build
    make -C Client build
}

package_beaker-common() {
    pkgdesc="Full-stack software and hardware integration testing system - common files"

    export BKR_PY3="$(which python3)"
    cd "$pkgbase-$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" -C Common install
}

package_beaker-client() {
    pkgdesc="Full-stack software and hardware integration testing system - cli"
    depends=('python' 'python-six' 'python-setuptools' 'python-gssapi' 'python-lxml' 'python-requests' 'python-prettytable' 'python-jinja' "beaker-common=$pkgver")

    export BKR_PY3="$(which python3)"
    cd "$pkgbase-$pkgbase-$pkgver"
    make DESTDIR="$pkgdir/" -C Client install

    install -Dm 755 -d "$pkgdir/usr/share/man/man1"
    install -m 644 -t "$pkgdir/usr/share/man/man1" documentation/_build/man/*
}

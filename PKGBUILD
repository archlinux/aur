# Maintainer: Stefan Tatschner <stefan@rumpelsepp.org>

pkgbase=penlog
pkgname=(penlog python-penlog)
pkgver=0.1.1
pkgrel=1
url='https://github.com/Fraunhofer-AISEC/penlog'
arch=('x86_64')
makedepends=('go' 'asciidoctor' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Fraunhofer-AISEC/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0e971b6166c830459dd68b8ce05b28ea66b7a3c2db7305b428b0728fcd50c632')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    make hr man

    cd python
    python3 setup.py build
}

package_penlog() {
    cd "$srcdir/$pkgname-$pkgver"
    license=('GPL')
    pkgdesc="Tooling around the penlog logging format"
    install -Dm644 "man/hr.1" "${pkgdir}/usr/share/man/man1/hr.1"
    install -Dm644 "man/penlog.7" "${pkgdir}/usr/share/man/man7/penlog.7"
    install -Dm755 hr "${pkgdir}/usr/bin/hr"
}

package_python-penlog() {
    cd "$srcdir/penlog-$pkgver/python"
    arch=('any')
    depends=('python')
    pkgdesc="A python library implementing the penlog format"

    python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

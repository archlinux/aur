# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=python-imaplib2-git
pkgver=r155.08e267c
pkgrel=1
pkgdesc="Threaded Python IMAP4 client"
arch=("any")
url="https://github.com/jazzband/imaplib2"
license=("Python")
depends=("python")
makedepends=("git" "python-setuptools")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "${pkgname}::git+https://github.com/jazzband/imaplib2.git"
    "version.patch"
)
md5sums=(
    "SKIP"
    "e4fef5ad967bc93be04ba3dd325c7cae"
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"

    # apply patches
    patch -p1 -i "$srcdir/version.patch"

    # discard original imaplib2.py and rename imaplib2.py3 to imaplib2.py
    mv imaplib2/imaplib2.py3 imaplib2/imaplib2.py
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # install README
    install -Dm644 "README" -t "$pkgdir/usr/share/doc/$pkgname"
}

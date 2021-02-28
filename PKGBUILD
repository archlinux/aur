# Maintainer: Pi-Yueh Chuang <pychuang@pm.me>
pkgname=offlineimap3-git
pkgver=r2718.1e7ef9e
pkgrel=1
pkgdesc="Read/sync your IMAP mailboxes (python3)"
arch=("any")
url="https://github.com/OfflineIMAP/offlineimap3"
license=("GPL2")
depends=(
    "python-imaplib2-git"
    "python-rfc6555"
)
optdepends=(
    "python-gssapi: for Kerberos authentication"
    "python-portalocker: if you need to run offlineimap in Cygwin for Windows"
)
provides=("offlineimap")
conflicts=("offlineimap" "offlineimap-git")
source=(
    "${pkgname}::git+https://github.com/OfflineIMAP/offlineimap3.git"
    "imaplib2_version.patch"
    "pr54.patch"
    "pr55.patch"
)
md5sums=(
    "SKIP"
    "0ad5ba88285b4604fc6e77472892fe23"
    "16fcef00d911fe5e293dfca1803b5111"
    "45803a85935f9cea032e40a68ba1d61e"
)

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"

    # apply patches
    patch -p1 -i "$srcdir/imaplib2_version.patch"
    patch -p1 -i "$srcdir/pr54.patch"
    patch -p1 -i "$srcdir/pr55.patch"
}

build() {
    cd "$pkgname"
    make clean
    make
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # install README
    install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}

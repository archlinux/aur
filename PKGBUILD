# Maintainer: Camas Millar <camas at hotmail dot co dot uk>

pkgname=seclists-c
pkgver=20191109
pkgrel=1
pkgdesc="An extended version of the original SecLists repository"
arch=('any')
url="https://github.com/camas/seclists-c"
license=('MIT')
options=('!strip')

source=("https://github.com/camas/seclists-c/archive/${pkgver}.tar.gz")
sha256sums=('8ee2435c83d6b9656bb4d9c63a72123135738d90346c9c6c82f81d7453dc04aa')

prepare() {
    cd "$srcdir/seclists-c-$pkgver/Passwords/Leaked-Databases/"
    tar -xf "rockyou.txt.tar.gz"
    tar -xf "rockyou-withcount.txt.tar.gz"
}

build() {
    cd "$srcdir/seclists-c-$pkgver/"
    # Create combination lists
    ./c-extensions/combine.sh
}

package() {
    cd "$srcdir/seclists-c-$pkgver"
    mkdir -p "${pkgdir}/usr/share/wordlists/${pkgname}"
    # Don't install .
    # Only find files
    # Don't install rockyou archives
    # Null terminate so xargs can parse special chars in filenames
    find . ! -path . -type f ! -name "rockyou*.tar.gz" -print0 | xargs -I{} -0 install -Dm644 {} "$pkgdir/usr/share/wordlists/$pkgname/{}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

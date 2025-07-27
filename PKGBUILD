# Maintainer: Cameron Otsuka <cameron@otsuka.haus>
# Contributor: Cameron Otsuka <cameron@otsuka.haus>
pkgname=qotdd
pkgver=0.2.0
pkgrel=1
pkgdesc='quote of the day daemon'
url='https://github.com/cotsuka/qotdd'
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
backup=("etc/qotdd/quotes.txt")
arch=('x86_64')
license=('MIT')
makedepends=('cargo')
sha256sums=('SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --frozen --release --target-dir target
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "quotes.txt" "${pkgdir}/etc/${pkgname}/quotes.txt"

    install -Dm644 "systemd/qotdd.service" "${pkgdir}/usr/lib/systemd/system/qotdd.service"
    install -Dm644 "systemd/qotdd.socket" "${pkgdir}/usr/lib/systemd/system/qotdd.socket"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

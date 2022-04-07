# Maintainer: Ben Goldberg <benaaron.dev>

pkgname=stargazer-gmi
pkgver=0.6.1
pkgrel=2
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=('gcc-libs')
makedepends=('rust>=1.46' 'scdoc')
sha256sums=('7e3ed7dd34bf58a2ffaf2c672ce51de0d0b63eb9755c61a8327b60c2c5b11bb2')

prepare() {
    cd "stargazer-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "stargazer-$pkgver"
    CGFLAGS='--locked --release' ./scripts/build
}

package() {
    cd "stargazer-$pkgver"
    source ./scripts/install --prefix="$pkgdir/usr" \
        --sysconfdir="$pkgdir/etc" \
        --bashdir="$pkgdir/usr/share/bash-completion/completions" \
        --zshdir="$pkgdir/usr/share/zsh/site-functions" \
        --fishdir="$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm644 ./contrib/init/stargazer.service "$pkgdir/usr/lib/systemd/system/stargazer.service"
}

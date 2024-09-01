# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=stargazer-gmi
pkgver=1.3.1
pkgrel=1
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=()
options=('!lto')
makedepends=('rust' 'cargo-auditable' 'scdoc')
sha256sums=('ae0be1c13523d2a38df3c4055a7167d7f31d3649bced9587304d2b8d7dc24c10')

prepare() {
    cd "stargazer-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "stargazer-$pkgver"
    CGFLAGS='--locked --release' ./scripts/build
}

package() {
    install -Dm644 ../stargazer.service "$pkgdir/usr/lib/systemd/system/stargazer.service"
    cd "stargazer-$pkgver"
    source ./scripts/install --prefix="$pkgdir/usr" \
        --sysconfdir="$pkgdir/etc" \
        --bashdir="$pkgdir/usr/share/bash-completion/completions" \
        --zshdir="$pkgdir/usr/share/zsh/site-functions" \
        --fishdir="$pkgdir/usr/share/fish/vendor_completions.d"
}

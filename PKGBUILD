# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=stargazer-gmi
pkgver=1.3.0
pkgrel=1
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=()
makedepends=('rust' 'cargo-auditable' 'scdoc')
sha256sums=('0deacfdbdf4b6f21af3b25a936cb1e2e744fac46fa45ac444ec8a6c0d2062b8b')

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

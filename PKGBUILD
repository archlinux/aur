# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=stargazer-gmi
pkgver=1.1.0
pkgrel=1
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=()
makedepends=('rust' 'cargo-auditable' 'scdoc')
sha256sums=('548d72f7ee54650588fb0ea7024ce4cad69d0c99bdcea726a12a5cf6dde45eb0')

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

# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=stargazer-gmi
pkgver=1.0.3
pkgrel=1
pkgdesc="stargzer gemini server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/stargazer/"
license=('AGPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/stargazer/archive/$pkgver.tar.gz")
depends=('gcc-libs')
makedepends=('rust' 'scdoc')
sha256sums=('b854f54cba414139b77dbd6cab9f14ae54148f386fc1293c67c6cdefabc688de')

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

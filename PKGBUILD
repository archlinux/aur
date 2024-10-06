# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

pkgname=thqm
pkgdesc='A simple HTTP server to serve a dynamic menu web page.'
pkgver=0.6.0
pkgrel=1
arch=('any')
url='https://github.com/loiccoyle/thqm-rs'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/loiccoyle/thqm-rs/archive/${pkgname}-v${pkgver}.tar.gz" "https://github.com/loiccoyle/thqm-styles/releases/latest/download/styles.tar.gz")
sha256sums=('SKIP' 'SKIP')
noextract=("styles.tar.gz")

build() {
    cd "$pkgname-rs-$pkgname-v$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-rs-$pkgname-v$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # completions
    install -Dm644 "completions/$pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 "completions/$pkgname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
    install -Dm644 "completions/_$pkgname" "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    # styles folder
    cd -
    mkdir styles/
    tar -xzf "styles.tar.gz" -C styles
    install -d "$pkgdir/usr/share/$pkgname/"
    cp -r "styles/." "$pkgdir/usr/share/$pkgname"
}

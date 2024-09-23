# Maintainer: Loic Coyle <loic.coyle@hotmail.fr>

pkgname=thqm
pkgdesc='A simple HTTP server to serve a dynamic menu web page.'
pkgver=0.3.1
pkgrel=1
arch=('any')
url='https://github.com/loiccoyle/thqm-rs'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("$pkgname-${pkgver}.tar.gz::https://github.com/loiccoyle/thqm-rs/archive/v${pkgver}.tar.gz" "https://github.com/loiccoyle/thqm-styles/releases/latest/download/styles.tar.gz") sha256sums=('e5d627d83026d7afccccde165fe59e4a35a32a8b13c5181549a445a43d16bef6' 'SKIP')
noextract=("styles.tar.gz")

build() {
    cd "$pkgname-rs-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-rs-$pkgver"
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

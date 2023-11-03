# Maintainer: Shell Chen <aur@sorz.org>
_pkgname=openai-hub
pkgname=$_pkgname-git
pkgver=r59.cbbfa02
pkgrel=2
pkgdesc="A secure and efficient gateway for interacting with OpenAI's API"
url="https://github.com/lightsing/openai-hub"
license=('MIT')
arch=('x86_64' 'i686')
backup=('etc/openai-hub/config.toml' 'etc/openai-hub/acl.toml')
makedepends=('git' 'rust' 'cargo')
provides=('openai-hub')
conflicts=('openai-hub')
source=('git+https://github.com/lightsing/openai-hub.git'
        'openai-hubd.service')
sha256sums=('SKIP'
            '02db7835e31f4f5484c596c798f87c25160eeaf0df8a6e32d14b247e13d00f06')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --bin openai-hubd --all-features
    cargo build --release --bin openai-hub-jwt-token-gen
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "$srcdir/$_pkgname/target/release/openai-hubd" "$pkgdir/usr/bin/openai-hubd"
    install -Dm755 "$srcdir/$_pkgname/target/release/openai-hub-jwt-token-gen" "$pkgdir/usr/bin/openai-hub-jwt-token-gen"
    install -Dm644 "$srcdir/openai-hubd.service" "$pkgdir/usr/lib/systemd/system/openai-hubd.service"
    install -Dm600 "$srcdir/$_pkgname/config.toml" "$pkgdir/etc/openai-hub/config.toml"
    install -Dm644 "$srcdir/$_pkgname/acl.toml" "$pkgdir/etc/openai-hub/acl.toml"

    sed -i -e 's/"\(access\.log\)"/"\/var\/log\/openai-hub\/\1"/g' "$pkgdir/etc/openai-hub/config.toml"
    sed -i -e 's/"\(audit\.sqlite\)"/"\/var\/lib\/openai-hub\/\1"/g' "$pkgdir/etc/openai-hub/config.toml"
}

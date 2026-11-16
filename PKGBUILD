# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Riedler <dev@riedler.wien>
# Cotnributor: Mckol <mckol363@gmail.com>
# Contributor: nachtjasmin <nachtjasmin@posteo.de>

_name=url-eater
pkgname=${_name}-git
pkgver=r38.5ff5f40
pkgrel=1
pkgdesc='Clean unnecessary parameters from URLs copied to clipboard'
provides=('url-eater')
conflicts=('url-eater' 'url-eater-bin')
arch=('x86_64')
url='https://github.com/AgathaSorceress/url-eater'
license=('LicenseRef-NVL')
depends=('systemd')
makedepends=('cargo' 'git')

source=(
    "${_name}::git+https://github.com/AgathaSorceress/url-eater.git"
    "default.kdl"
    "url-eater.service"
)
sha256sums=('SKIP'
            'ee062aec46772acc4e7827c5520871ea058fc587500562e8524758344ee568fc'
            '621bc550a91f6ef3ac5f77730c9ea9914b597d259a732296974a198e2e24e629')
backup=('etc/url-eater.kdl')

pkgver() {
    cd "$_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_name"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_name"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features --bin="$_name"
}

package() {
    install -Dm644 default.kdl "$pkgdir/etc/url-eater.kdl"
    install -Dm644 default.kdl "$pkgdir/usr/share/url-eater/default.kdl"
    install -Dm644 url-eater.service "$pkgdir/usr/lib/systemd/user/url-eater.service"

    cd "$_name"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 ./target/release/$_name "$pkgdir/usr/bin/$_name"
}


# Maintainer: werdxz

pkgname=portty-git
pkgver=r16.8805a37
pkgrel=1
pkgdesc="XDG Desktop Portal backend for TTY environments"
arch=('x86_64')
url="https://github.com/werdxz/portty"
license=('MIT')
depends=('xdg-desktop-portal')
makedepends=('cargo' 'git')
provides=('portty')
conflicts=('portty')
source=("${pkgname}::git+https://github.com/werdxz/portty.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

package() {
    cd "$pkgname"

    # Install daemon
    install -Dm755 "target/release/porttyd" "$pkgdir/usr/lib/portty/porttyd"

    # Install CLI
    install -Dm755 "target/release/portty" "$pkgdir/usr/bin/portty"

    # Install portal file
    install -Dm644 "misc/tty.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/tty.portal"

    # Install systemd service
    install -Dm644 "misc/portty.service" "$pkgdir/usr/lib/systemd/user/portty.service"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install example config
    install -Dm644 "misc/config.toml.example" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}

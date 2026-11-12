# Maintainer: Joaquin (pato) Decima <jdecima@vasak.net.ar>

pkgname=linaudit-git
pkgver=r16.ecf16d1
pkgrel=1
pkgdesc="A read-only security audit tool for Linux systems with a score from 1 to 10"
arch=('x86_64' 'aarch64')
url="https://github.com/alexiarstein/linaudit"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=('linaudit')
conflicts=('linaudit')
backup=('etc/linaudit/waivers.conf')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/linaudit"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/linaudit"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/linaudit"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$srcdir/linaudit"
    install -Dm755 "target/release/linaudit" "$pkgdir/usr/bin/linaudit"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Archivos opcionales de configuración, manpage y systemd (si están presentes en el repo)
    if [ -f "etc/linaudit/waivers.conf" ]; then
        install -Dm644 "etc/linaudit/waivers.conf" "$pkgdir/etc/linaudit/waivers.conf"
    elif [ -f "etc/waivers.conf" ]; then
        install -Dm644 "etc/waivers.conf" "$pkgdir/etc/linaudit/waivers.conf"
    fi

    find doc -name "*.1" -exec install -Dm644 {} "$pkgdir/usr/share/man/man1/{}" \; 2>/dev/null || true
    find contrib debian -name "*.service" -exec install -Dm644 {} "$pkgdir/usr/lib/systemd/system/{}" \; 2>/dev/null || true
    find contrib debian -name "*.timer" -exec install -Dm644 {} "$pkgdir/usr/lib/systemd/system/{}" \; 2>/dev/null || true
}

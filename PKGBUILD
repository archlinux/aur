pkgname=ssmp-git
pkgver=0.1.0
pkgrel=1
pkgdesc='TUI music player'
arch=('x86_64')
url='https://github.com/TheBlandit/ssmp'
license=('Apache' 'MIT')
depends=('alsa-lib' 'glibc' 'libgcc')
makedepends=('cargo' 'git')

source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname"

    install -Dm755 "target/release/ssmp" "$pkgdir/usr/bin/ssmp"

    install -Dm644 "LICENSES/LICENSE-MIT" "$pkgdir/usr/share/licenses/ssmp/LICENSE-MIT"
    install -Dm644 "LICENSES/LICENSE-APACHE" "$pkgdir/usr/share/licenses/ssmp/LICENSE-APACHE"
    install -Dm644 "LICENSES/THIRD-PARTY-NOTICES.md" "$pkgdir/usr/share/licenses/ssmp/THIRD-PARTY-NOTICES.md"
}

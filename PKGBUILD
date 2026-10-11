# Maintainer: MieraK <mrkpwnz@gmail.com>
pkgname=rmpcd-git
_pkgname=rmpcd
pkgver=0.1.0.r801.g1506013
pkgrel=1
pkgdesc='A companion MPD client to rmpc intended to run as a daemon'
url='https://rmpc.mierak.dev/'
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
depends=(libgcc glibc)
optdepends=(
    'libnotify: for the notify plugin'
    'xdg-utils: for the lastfm plugin'
    'rmpc: for the lyrics plugin')
conflicts=('rmpcd')
provides=('rmpcd')
makedepends=(cargo git)
options=('!lto')
source=("$_pkgname::git+https://github.com/mierak/rmpc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s.r%s.g%s" \
        "$(sed -n 's/^version = "\(.*\)"/\1/p' rmpcd/Cargo.toml | head -1)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --frozen --package $_pkgname
}

prepare() {
    cd "$srcdir/$_pkgname"
    cargo fetch --locked
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --release --frozen --package $_pkgname
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
    install -Dm644 "rmpcd/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

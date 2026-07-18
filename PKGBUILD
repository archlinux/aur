# Maintainer: Berke Oruc <archberke@hotmail.com>
# Contributor: Berke Oruc <archberke@hotmail.com>
# Arch: x86_64
# AUR: biosaka

pkgname=biosaka
pkgver=0.1.4
pkgrel=1
pkgdesc="C. elegans neural simulation in your terminal — 307 neurons, ~2800 synapses, LIF spiking network, ratatui TUI"
arch=('x86_64')
url="https://github.com/BerkeOruc/biosaka"
license=('custom:BioSaka-Research-License')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust' 'git')
source=("git+https://github.com/BerkeOruc/biosaka.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/biosaka"
    cargo fetch --locked
}

build() {
    cd "$srcdir/biosaka"
    export RUSTFLAGS="-C target-cpu=native"
    cargo build --release --locked
}

check() {
    cd "$srcdir/biosaka"
    cargo test --release --locked 2>/dev/null || true
}

package() {
    cd "$srcdir/biosaka"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "logo.txt" "$pkgdir/usr/share/$pkgname/logo.txt"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname" <<EOF
_biosaka() {
    local cur=\${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( \$(compgen -W "worm" -- \$cur) )
}
complete -F _biosaka biosaka
EOF
}

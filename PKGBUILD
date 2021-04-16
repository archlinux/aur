# Maintainer: uttarayan21 <uttarayan21@disroot.org>

pkgname=macchina-git
_pkgname=macchina
pkgver=0.7.0.f125764
pkgrel=1
pkgdesc="Basic system information fetcher, written in Rust"

arch=('x86_64')
url="https://github.com/macchina-cli/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
provides=("macchina=${pkgver}")
conflicts=("macchina")
makedepends=('rust' 'cargo' 'git')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  echo "$(grep ^version Cargo.toml | cut -d= -f2 | tr -d ' "').$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	cargo build --release
}


package() {
	cd "$pkgname"
	targetdir=${CARGO_TARGET_DIR:-target}
    outdir=$(find "$targetdir" -name macchina-stamp -print0 \
        | xargs -0 ls -t \
        | head -n1 \
        | xargs dirname)
    install -Dm644 "$outdir/macchina.fish" "$pkgdir/usr/share/fish/vendor_completions.d/macchina.fish"
    install -Dm644 "$outdir/macchina.bash" "$pkgdir/usr/share/bash-completion/completions/macchina"
	install -Dm755 "$targetdir/release/macchina" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}


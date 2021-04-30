# Maintainer: grtcdr <ba.tahaaziz@gmail.com>

pkgname=macchina
pkgver=0.7.2
pkgrel=1
pkgdesc="A system information fetcher, with an emphasis on performance and minimalism."

arch=('x86_64')
url="https://github.com/Macchina-CLI/macchina"
license=('MIT')

depends=('gcc-libs' 'glibc')
optdepends=('wmctrl: window manager support')
makedepends=('rust' 'cargo' 'git')

source=("$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('271d21680487d91c2f2a4036c04f3db3c78c90e419bdbe1072581ad7c8e844f9')
build() {
	cd "$pkgname-$pkgver"
	cargo build --release --locked --target-dir=target
}

package() {
	cd "$pkgname-$pkgver"
  outdir=$(find "${CARGO_TARGET_DIR:-target}" -name macchina-stamp -print0 \
        | xargs -0 ls -t \
        | head -n1 \
        | xargs dirname)
  install -Dm644 "$outdir/macchina.fish" "$pkgdir/usr/share/fish/vendor_completions.d/macchina.fish"
  install -Dm644 "$outdir/macchina.bash" "$pkgdir/usr/share/bash-completion/completions/macchina"
  install -Dm 755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

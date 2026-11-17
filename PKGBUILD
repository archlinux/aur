# Maintainer: ItzTas <ts.aur@imts.aleeas.com>

pkgname=mime-guardian-nightly
_pkgname=mime-guardian
_bin=mmg
pkgver=0.2.0.nightly.2
pkgrel=1
pkgdesc='Keeps your default applications the way you set them (nightly)'
arch=('x86_64' 'aarch64')
url='https://github.com/ItzTas/mime-guardian'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('libnotify: desktop notifications when a default is put back'
	'shared-mime-info: wildcard types such as image/*')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!lto' '!debug')
_releases='https://github.com/ItzTas/mime-guardian/releases/download'
_tag=v0.2.0-nightly.2
_srcdir="$_pkgname-$pkgver"
source=("$pkgname-$pkgver.tar.gz::$_releases/$_tag/$_pkgname-$pkgver-src.tar.gz")
sha256sums=('63569c2d1b58a63bfe5f5da9cffba9ee45548d06d450c849fdedc7dbf41dc827')

prepare() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
	cd "$_srcdir"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd "$_srcdir"
	install -Dm0755 "target/release/$_bin" "$pkgdir/usr/bin/$_bin"
	install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm0644 "contrib/$_pkgname.service" "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
	install -Dm0644 "contrib/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
	install -Dm0644 "contrib/$_pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

	install -d "$pkgdir/usr/share/bash-completion/completions"
	install -d "$pkgdir/usr/share/zsh/site-functions"
	install -d "$pkgdir/usr/share/fish/vendor_completions.d"

	"target/release/$_bin" completions bash >"$pkgdir/usr/share/bash-completion/completions/$_bin"
	"target/release/$_bin" completions zsh >"$pkgdir/usr/share/zsh/site-functions/_$_bin"
	"target/release/$_bin" completions fish >"$pkgdir/usr/share/fish/vendor_completions.d/$_bin.fish"

	install -d "$pkgdir/usr/share/man/man1"
	"target/release/$_bin" man >"$pkgdir/usr/share/man/man1/$_bin.1"
}

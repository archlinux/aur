# Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
# Constributor: Caleb Maclennan <caleb@alerque.com>
# contributor: Daniele Basso <d dot bass05 at proton dot me>

pkgname=rustic-git
pkgver=0.7.0.r48.g402aa7c
_pkgname=rustic
pkgrel=3
pkgdesc='Fast, encrypted, deduplicated backups powered by Rust (reads and writes restic repos)'
arch=(x86_64)
url="https://github.com/rustic-rs/$_pkgname"
license=(Apache-2.0 MIT)
depends=(gcc-libs # libgcc_s.so
         glibc) # libc.so libm.so
makedepends=(cargo)
replaces=(rustic-rs
          rustic-bin)
conflicts=(rustic)
options=(!lto)

source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd "$_pkgname"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$_pkgname"
	env \
		CARGO_PROFILE_RELEASE_DEBUG=2 \
		CARGO_PROFILE_RELEASE_STRIP=false \
	cargo build --frozen --release 
}

check() {
	cd "$_pkgname"
	cargo test --frozen
}

package() {
	cd "$_pkgname"
	local _bin="target/release/$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_bin"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
	"$_bin" completions bash | install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	"$_bin" completions fish | install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
	"$_bin" completions zsh  | install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}

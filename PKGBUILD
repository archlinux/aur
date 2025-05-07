# Maintainer: claymorwan <claymorwan@fembois.dev>
# ty to mqs for the service file :3

_pkgname=vertd

pkgname=vertd-git
pkgver=r72.7a4d0ee
pkgrel=1
pkgdesc="VERT's solution to crappy video conversion services."
arch=(x86_64)
url="https://github.com/VERT-sh/vertd"
license=('GPL-3.0-only')
depends=('ffmpeg')
makedepends=('git' 'cargo')
optdepends=('libva-intel-driver')
provides=("$pkgname")
conflicts=("$pkgname")
source=(
	"$_pkgname::git+$url"
	systemd.service
)
sha256sums=('SKIP'
            'a1ec3e72000c476d6f10f09041b4c67ad2d823da2598731682e012d615a036cf')


pkgver() {
	cd "$srcdir/$_pkgname"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features 
}

check() {
	cd "$srcdir/$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	install -vDm644 systemd.service \
		"$pkgdir"/usr/lib/systemd/system/$_pkgname.service

	cd "$srcdir/$_pkgname"
	install -Dm0755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"
	chmod +x "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

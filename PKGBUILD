# Maintainer: fossdd <fossdd@pwned.life>
pkgname=onionmasq-git
_pkgname="${pkgname%-git}"
pkgver=r532.f49f4f7
pkgrel=1
pkgdesc='Experimental Tunnel interface for Arti'
arch=(x86_64)
url='https://gitlab.torproject.org/tpo/core/onionmasq'
_giturl="$url.git"
license=('unknown')
groups=()
depends=()
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
source=("$_pkgname::git+$_giturl")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	# Git, tags available
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
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
	cargo build --frozen --release --all-features --package onionmasq
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}

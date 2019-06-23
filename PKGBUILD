# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=fanctl-git
pkgver=r4.bd570a8
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://github.com/mcoffin/fanctl"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('fanctl::git+https://github.com/mcoffin/fanctl.git#branch=master')
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	# printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cargo install --path . --root "$pkgdir/usr" --bins
	if [ -e "$pkgdir/usr/.crates.toml" ]; then
		rm "$pkgdir/usr/.crates.toml"
	fi
	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" ./COPYING
}

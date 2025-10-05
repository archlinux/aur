# Maintainer: Christopher Hartono <christhartono@hotmail.com>

_pkgname="kitshell-cmd"
pkgname="kitshell-cmd-git"
pkgver=r236.b5dfa3c
pkgrel=1
pkgdesc="Control Kitshell via command line/scripts"
arch=(x86_64)
url="https://github.com/bootloopmaster636/kitshell-cmd"
license=('GPL-3.0-or-later')
options=('!debug')

depends=(kitshell glibc gcc-libs)
makedepends=(git tar rustup cmake ninja clang patchelf)

conflicts=('kitshell-cmd')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$_pkgsrc"
	rustup toolchain install stable 
} 

pkgver() {
	cd "$_pkgsrc"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
	cd "$_pkgsrc"
	cargo build --release
}

package() {
	cd "$_pkgsrc/target/release/"

	# Kitshell files
	install -Dm755 "kitshell-cmd" "$pkgdir/usr/bin/$_pkgname"

	# License
  	install -Dm644 "$srcdir/$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

	# Set permissions
	chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}


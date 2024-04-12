# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Casper <draakie@proton.me>
_pkgname=river-bedload
pkgname=$_pkgname-git
pkgver=r9.9cdc0e0
pkgrel=1
pkgdesc="Display information about river in json in the STDOUT."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://git.sr.ht/~novakane/river-bedload"
license=('GPL-3.0-only')

depends=(
  'glibc'
  'wayland'
)
makedepends=('git' 'zig')
source=(
    "${pkgname}::git+https://git.sr.ht/~novakane/river-bedload"
)
sha256sums=(
    'SKIP'
)
provides=("river-bedload")
conflicts=("river-bedload")
options=(!strip)

prepare() {
	cd "$pkgname"
    git submodule update --init
}

pkgver() {
	cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" zig build install --prefix "/usr"
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$_pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}

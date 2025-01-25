# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=pamac-cli
pkgver=11.7.2
_commit=3c078fc0a544f8d1ad84237c253bdb0efb793f47
pkgrel=1
pkgdesc='Pamac cli frontend for libalpm'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/$pkgname"
license=('GPL3')
depends=('libpamac')
makedepends=('vala' 'meson' 'asciidoc' 'git')
optdepends=('plymouth: offline upgrades')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('23c9832c41ac8f40cd70a3c5118470cb184d7cde235ef29d971edf9f38aa160e')

_srcdir="$pkgname"

pkgver() {
  cd "$_srcdir"
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
	cd "$_srcdir"
	# adjust version string
	sed -i -e "s|\"$pkgver\"|\"$pkgver-$pkgrel\"|g" 'src/version.vala'
}

build() {
	arch-meson "$_srcdir" 'build'
	meson compile -C 'build'
}

package() {
	meson install -C 'build' --destdir "$pkgdir"
	install -Dm644 "$_srcdir/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

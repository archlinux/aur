# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=pamac-cli
pkgver=11.7.1
_commit=e1133adcebb3a5e740422abb0c38ce40eb591fb7
pkgrel=1
pkgdesc='Pamac cli frontend for libalpm'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/$pkgname"
license=('GPL3')
depends=('libpamac')
makedepends=('vala' 'meson' 'asciidoc' 'git')
optdepends=('plymouth: offline upgrades')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('ec723cea80399e11dfe1a28819f2e5184f0e01419b7c1fdb8d5d79ef70bb2d8b')

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

# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=pamac-cli
pkgver=11.7.3
_commit=27cc40525a5820177a9d77028d9e481a500d61ee
pkgrel=1
pkgdesc='Pamac cli frontend for libalpm'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/$pkgname"
license=('GPL-3.0-or-later')
depends=('libpamac')
makedepends=('vala' 'meson' 'asciidoc' 'git')
optdepends=('plymouth: offline upgrades')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('972b882440f6ebbc948fe965eb4bfe638f735adfcc260f6349aa3e1d560621a7')

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

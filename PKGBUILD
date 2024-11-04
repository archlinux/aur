# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=pamac-cli
pkgver=11.7.0
_commit=035e66944ce8633b6362b45ced879f00ba00a09b
pkgrel=1
pkgdesc='Pamac cli frontend for libalpm'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/manjaro/$pkgname"
license=('GPL3')
depends=('libpamac')
makedepends=('vala' 'meson' 'asciidoc' 'git')
optdepends=('plymouth: offline upgrades')
source=("git+${url}.git#commit=${_commit}")
sha256sums=('1d6a07d46bc15d7824f9a1c00e2da89989737f7116c452af1ee4619a61d1853c')

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

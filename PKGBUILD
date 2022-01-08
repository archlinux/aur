# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=Tau
pkgname=tau-editor
pkgver=0.12.0
pkgrel=2
pkgdesc='GTK frontend for the Xi text editor, written in Rust'
arch=(x86_64 i686 armv7h aarch64)
url="https://gitlab.gnome.org/World/$_pkgname"
license=(MIT)
depends=(libhandy0
         vte3
         xi-core)
makedepends=(meson
             rust)
_archive="${_pkgname,,}-$pkgver"
_uploadhash=14037a7f98f475d2497b74bd74a0430e
source=("$url/uploads/$_uploadhash/$_archive.tar.xz")
sha256sums=('a14e4c3511fa51cc051c33ad04a3989b93c6aa2405e8b0f5ac05970fe5d95449')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
		# -Dxi-core=system \
		# -Dlibhandy=enabled \
	arch-meson \
		"$_archive" build
	meson compile -C build
}

# check() {
#     meson test -C build --print-errorlogs
# }

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_archive/LICENSE"
}

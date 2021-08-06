# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Philip Goto <philip.goto@gmail.com>

_pkgname=Tau
pkgname=tau-editor
pkgver=0.11.3
pkgrel=3
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
source=("$url/uploads/b5f24cd692ec0c2a2c2be460fffaf505/$_archive.tar.xz")
sha256sums=('36e915de4ca906599b4ad176d4e2d625b454801a09ca0d4b0a1fbaf14915e60e')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	arch-meson \
        -Dxi-core=system \
        -Dlibhandy=enabled \
        "$_archive" build
	meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_archive/LICENSE"
}

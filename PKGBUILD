# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=reflection
pkgver=0.3
pkgrel=1
pkgdesc='Collaborative, local-first GTK text editor'
arch=(x86_64)
url="https://github.com/p2panda/$pkgname"
license=(GPL-3.0-only)
depends=(glib2 libgio-2.0.so libglib-2.0.so libgobject-2.0.so
         glibc # ld-linux-x86-64.so libc.so libm.so
         graphene libgraphene-1.0.so
         gtk4 libgtk-4.so
         gtksourceview5 libgtksourceview-5.so
         libadwaita libadwaita-1.so
         libgcc libgcc_s.so
         libspelling libspelling-1.so
         openssl libcrypto.so libssl.so
         pango libpango-1.0.so)
makedepends=(blueprint-compiler
             cargo
             desktop-file-utils
             git
             gtk-update-icon-cache
             meson
             ninja
             sqlite)
options=(!lto)
_archive="$pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
sha256sums=('e54907f7395f879fb1eda268fd059517b2bc3688c5010a04bcec120aaf76bed2')

prepare() {
	cd "$_archive"
	# https://github.com/p2panda/reflection/pull/231
	sed -i -e '/^loro/s/.*/loro = "1"/' reflection-doc/Cargo.toml
	# https://github.com/p2panda/reflection/issues/230
	cargo fetch --target host-tuple
}

build() {
	arch-meson "$_archive" build
	meson compile -C build
}

package() {
	meson install -C build --no-rebuild --destdir "$pkgdir"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$_archive/COPYING"
}

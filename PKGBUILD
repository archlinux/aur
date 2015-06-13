# Contributor: Vojtech Kral <vojtech@kral.hk>


pkgname=rust-gnome-git
pkgver=r902.caf1a79
pkgrel=2
pkgdesc="Rust bindings and wrappers for gnome libraries"
arch=('i686' 'x86_64')
url="https://github.com/rust-gnome"
license=('MIT')
depends=('rust' 'gtk3' 'glib2')
makedepends=('git' 'rust' 'cargo' 'gtk3' 'glib2')
options=('!strip')
source=('git+https://github.com/rust-gnome/gtk.git'
	'git+https://github.com/rust-gnome/cairo.git'
	'git+https://github.com/rust-gnome/glib.git'
	'git+https://github.com/rust-gnome/gdk.git'
	'git+https://github.com/rust-gnome/pango.git')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')


pkgver() {
	cd "${srcdir}/gtk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/gtk"
	mkdir -p .cargo
	echo "paths = [ \"${srcdir}/cairo\", \"${srcdir}/glib\", \"${srcdir}/gdk\", \"${srcdir}/gtk\", \"${srcdir}/pango\" ]" > .cargo/config
	cargo build --release
	# cargo doc
}

package() {
	cd "$srcdir/gtk/target"

	# host=$(rustc -Vv | grep '^host:' | sed -e 's/^host: //;')
	# rlib_dir="${pkgdir}/usr/lib/rustlib/${host}/lib/"
	rustc_stdlib="$(pacman -Qlq rust-nightly-bin | grep 'libstd.*rlib')"
	rlib_dir="${pkgdir}$(dirname ${rustc_stdlib})"
	msg $rlib_dir
	doc_dir="${pkgdir}/usr/share/doc/rust-gnome"

	install -D -m 644 -t "$rlib_dir" release/libgtk.rlib
	install -D -m 644 -t "$rlib_dir" release/deps/*.rlib
	install -D -m 644 -t "${pkgdir}/usr/lib" release/deps/*.so
	# mkdir -p "$doc_dir"
	# cp -r doc/* "$doc_dir"
	install -D -m 644 -t "${pkgdir}/usr/share/licenses/rust-gnome/" ../LICENSE
}

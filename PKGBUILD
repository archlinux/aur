# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=tau-editor-git
pkgver=v0.12.0.r0.e3a4f034
pkgrel=1
pkgdesc="GTK frontend for the Xi text editor, written in Rus"
arch=(x86_64)
url="https://gitlab.gnome.org/World/tau"
license=('MIT')
depends=('rust'  'xi-core-git' 'glib2'
         'pango' 'gtk3' 'cairo'
         'gdk-pixbuf2' 'libhandy0' 'gsettings-desktop-schemas' 'pkgconf')
makedepends=('git' 'meson' 'ninja' )
provides=("tau-editor")
conflicts=("tau-editor")
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/tau"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	arch-meson tau build
  ninja -C build
}

prepare() {
  cd "$srcdir/tau"
  git submodule update --init --recursive
  cargo update
  sed -i 's/--frozen//g' scripts/cargo.sh

}
#check() {
#	make -k check
#}

package() {
 DESTDIR="$pkgdir/" ninja -C build install
   install -Dm 644 $srcdir/tau/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

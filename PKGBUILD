pkgname=glib2-static
pkgver=2.58.2
pkgrel=1
pkgdesc="Low level core library. Static library."
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL2.1)
arch=(x86_64)
depends=(pcre libffi)
makedepends=(libffi zlib shared-mime-info python libelf git util-linux meson dbus)
checkdepends=(desktop-file-utils dbus)
optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
            'libelf: gresource inspection tool')
options=('!docs' '!libtool' '!emptydirs' '!strip' 'staticlibs')
_commit=97bcbcb8c2aa0aeee5afd9939efbadbae0c8a8fa  # tags/2.58.2^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        noisy-glib-compile-schemas.diff)
sha256sums=('SKIP'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  patch -Np1 -i ../noisy-glib-compile-schemas.diff
}

build() {
  arch-meson glib build \
    --default-library static \
    -D selinux=false \
    -D man=true \
    -D gtk_doc=false \
    -Dinternal_pcre=false \
    -Dfam=false
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  # Only install static library
  rm -rf "$pkgdir/usr/"{bin,include,share,lib/glib-2.0,lib/pkgconfig} $pkgdir/usr/lib/*.so*
}

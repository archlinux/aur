# Maintainer: Silvertuanzi <126318157+silvertuanzi@users.noreply.github.com>
# libadwaita 1.10.0 + the Linux Mint theme-support mechanism, ported.
# Supersedes libadwaita-without-adwaita: that package disables libadwaita's own
# stylesheet (only the GTK theme CSS applies); this one keeps libadwaita's layout
# rules and loads <theme>/libadwaita-<major>.<minor>/gtk.css when the theme
# provides it, falling back to the built-in stylesheet otherwise.
pkgname=libadwaita-mintpatch
pkgver=1.10.0
pkgrel=1
epoch=1
url="https://gnome.pages.gitlab.gnome.org/libadwaita"
pkgdesc='libadwaita with the Mint theme-support mechanism'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=(LGPL-2.1-or-later)
provides=('libadwaita-1.so' "libadwaita=${epoch}:${pkgver}")
conflicts=('libadwaita')
depends=(ministream fribidi glib2 glibc graphene gtk4 pango)
makedepends=(meson gi-docgen sassc gobject-introspection vala pkgconf patch cmake libsass gcc glib2-devel)
source=("https://gitlab.gnome.org/GNOME/libadwaita/-/archive/${pkgver}/libadwaita-${pkgver}.tar.gz"
        'mint-enable-theme.patch')
sha256sums=('bd517433a327c216e5f4598c3e0e5e7ec2a4300c0ab7efca6481a44e7768a8e1'
            'SKIP')

prepare() {
  cd "$srcdir/libadwaita-$pkgver"

  # Idempotent: makepkg --noextract reuses an already patched tree.
  if patch -p1 -R --dry-run -f -s -i "$srcdir/mint-enable-theme.patch" >/dev/null 2>&1; then
    return 0
  fi
  patch -p1 -i "$srcdir/mint-enable-theme.patch"
}

build() {
  cd "$srcdir/libadwaita-$pkgver"
  rm -rf build          # makepkg --noextract can leave a configured build dir

  local meson_options=(
    -D documentation=false
    -D examples=false
    -D tests=false
  )
  arch-meson . build "${meson_options[@]}"
  meson compile -C build
}

package() {
  cd "$srcdir/libadwaita-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}

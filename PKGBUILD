# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: gitlab gitlab.gnome.org
# what: GNOME/gedit
# match! alpha[0-9]*$

pkgname=gedit
pkgver=51.0
pkgrel=1
pkgdesc='Easy-to-use general-purpose text editor'
arch=(x86_64)
url='https://gedit-text-editor.org/'
license=(GPL-2.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glib2
  glibc
  gsettings-desktop-schemas
  gspell
  gtk3
  hicolor-icon-theme
  libgcc
  libgedit-amtk
  libgedit-gfls
  libgedit-gtksourceview
  libgedit-tepl
  libpeas
  pango
)
makedepends=(
  appstream
  git
  glib2-devel
  gobject-introspection
  gtk-doc
  itstool
  meson
)
conflicts=(gedit-plugins)
replaces=(gedit-plugins)
source=(
  "git+https://gitlab.gnome.org/World/gedit/gedit.git#tag=${pkgver/[a-z]/.&}"
  "https://gitlab.archlinux.org/archlinux/packaging/packages/gedit/-/raw/$pkgver-1/gedit-new-tab.patch"
  "https://gitlab.archlinux.org/archlinux/packaging/packages/gedit/-/raw/$pkgver-1/gedit-prgname.patch"
)
b2sums=(
  4b658ed30e7cf9326e265cd754befa6a36033c97d204527cd511cfb248d6fbd921fd13f3f958daa580d1ce8baf71a8e023b8b686a178d3647847207515e2104a
  3f30dde7f7141f2992f750fb01f215823f48c384c2e24d66d94d0471b99362024ed76512092e31e1703890d0e4e94384ab599be042405248807b5183ae1e6c1f
  7a7a00699f32fdc6f3e7d64411c0e9158ae92cf1874de7d32cff0249e16368282e147a625897ae02f2ecf153db809619a87fa29beb7c0a4e4d16540053e2af80
)

prepare() {
  cd gedit

  git revert -n ed13f96587f3516e16d562f6b4c2513dca3793af
  git revert -n ab7bb15d742a5cf647eea8e809e87217c2196b9d

  # Don't create new tab unless requested
  git apply -3 ../gedit-new-tab.patch

  # Set prgname to application ID
  git apply -3 ../gedit-prgname.patch

  patch -p1 < "$srcdir/menubar.patch"
  patch -p1 < "$srcdir/gir2.patch"
}

build() {
  arch-meson gedit build \
    -D gtk_doc=true \
    -D require_all_tests=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

pkgname+="-menubar"
pkgdesc+=" (Patched to show menubar)"
depends+=(
  python
  python-gobject
)
optdepends=('gedit-externaltools-plugin: External Tools support')
conflicts+=('gedit')
provides+=('gedit')
source+=(menubar.patch gir2.patch)
b2sums+=(
  b32b4a2902a35ffbb7dfe0ed6ed4e72d8f7e85cd24c2fbf066be7baf93339f8e1e463838d9e62bac5bbcaacc1c7301093bcbfe0d723a1d7db7ef6861af2ea430
  c56d6607513239554f60a8b3e152278657062ac36d3dbd971a8697b59ffc85dfa4aa8580613ecda7c962add6bec7911661ee7b02e68f8e81a666691189451d5c
)

pkgver() {
  git -C gedit describe --tags | sed 's/-/+/g'
}
# vim:set sw=2 sts=-1 et:

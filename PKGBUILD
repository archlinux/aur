# Maintainer: Piroro-hs

pkgname=ptyxis
pkgver=46.0
_vtever=0.76.0
pkgrel=1
pkgdesc="A terminal for a container-oriented desktop"
arch=('x86_64')
url="https://gitlab.gnome.org/chergert/ptyxis"
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later')
groups=()
depends=('cairo'
         'dconf'
         'fribidi'
         'gcc-libs'
         'glib2'
         'glibc'
         'gnutls'
         'gtk4'
         'hicolor-icon-theme'
         'icu'
         'json-glib'
         'libadwaita'
         'libportal'
         'libportal-gtk4'
         'lz4'
         'pango'
         'pcre2'
         'systemd-libs'
         'vte-common')
makedepends=('git'
             'meson'
             'patchutils'
             'python-packaging')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=("$pkgname::git+$url#tag=$pkgver"
        "${pkgname}_vte::git+https://gitlab.gnome.org/GNOME/vte.git#tag=$_vtever"
        '0001-bundle-patched-vte.patch')
sha256sums=('ce302fa4867e957542599642bc835a840b2496632c60fce53edba906ccf8f899'
            '1b3c7c20f0c0c68e6a14f016f58a21f6fecf39079dbf46b2e01f436dc8f315a3'
            'e60c1b17c6e8e6596b75569ea47a550487823bb0b729b21005c0fb6e7f55b71d')

prepare() {
  mkdir "$srcdir/$pkgname/subprojects"
  mv "$srcdir/${pkgname}_vte" "$srcdir/$pkgname/subprojects/vte"
  patch -d "$srcdir/$pkgname/subprojects/vte" -p1 -i "$srcdir/0001-bundle-patched-vte.patch"
  sed -i '/dependency('\''vte-2.91-gtk4'\'')/c\subproject('\''vte'\'').get_variable('\''libvte_gtk4_dep'\''),' "$srcdir/$pkgname/src/meson.build"

  patch -d "$srcdir/$pkgname/subprojects/vte" -p1 -i "$srcdir/$pkgname/build-aux/0001-add-notification-and-shell-precmd-preexec.patch"
  filterdiff -F 2- "$srcdir/$pkgname/build-aux/0001-a11y-implement-GtkAccessibleText.patch" | patch -d "$srcdir/$pkgname/subprojects/vte" -p1
}

build() {
  arch-meson "$pkgname" build --buildtype=release -Dvte:gtk3=false -Dvte:gtk4=true -Dvte:glade=false -Dvte:gir=false -Dvte:vapi=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  # Remove unmodified vte-common files
  rm -rf "$pkgdir/usr/lib/vte-urlencode-cwd"
  # rm -rf "$pkgdir/usr/lib/systemd/user/vte-spawn-.scope.d/defaults.conf"
  # rm -rf "$pkgdir/usr/lib/systemd/user/vte-spawn-.scope.d/vte-spawn-.scope.conf"
  rm -rf "$pkgdir/usr/lib/systemd/"
  # rm -rf "$pkgdir/usr/include/vte-10002.91-gtk4/"
  rm -rf "$pkgdir/usr/include/"
  rm -rf "$pkgdir/etc/profile.d/vte.csh"
}

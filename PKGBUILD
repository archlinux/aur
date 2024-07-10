# Maintainer: Piroro-hs

pkgname=ptyxis
pkgver=46.5
_vtever=0.76.3
_vtecommit='41b19080b5594300afc010e1ef7d838ab120603a'
pkgrel=1
pkgdesc='A terminal for a container-oriented desktop'
arch=('x86_64')
url='https://gitlab.gnome.org/chergert/ptyxis'
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
         "vte-common=$_vtever")
makedepends=('git'
             'glib2-devel'
             'meson')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=("$pkgname::git+$url#tag=$pkgver"
        "${pkgname}_vte::git+https://gitlab.gnome.org/GNOME/vte.git#commit=$_vtecommit"
        '0001-bundle-patched-vte.patch')
sha256sums=('36c33dcf871f205998134fbd34586690b3412a74d0f452e4157d85f87fbe86df'
            '628e9202b3578a825e6a135508c711a0ea0c236579f4ec1afe5d11f3feecce90'
            'b9eaf8fcf10b2f703bc4c355304517c62c6a5cc42c727f8e93cf9a4be5b4cf14')

prepare() {
  rm -rf "$srcdir/$pkgname/subprojects"
  mkdir "$srcdir/$pkgname/subprojects"
  mv "$srcdir/${pkgname}_vte" "$srcdir/$pkgname/subprojects/vte"
  patch -d "$srcdir/$pkgname/subprojects/vte" -p1 -i "$srcdir/0001-bundle-patched-vte.patch"
  sed -i '/dependency('\''vte-2.91-gtk4'\'', version: vte_req)/c\subproject('\''vte'\'').get_variable('\''libvte_gtk4_dep'\''),' "$srcdir/$pkgname/src/meson.build"

  patch -d "$srcdir/$pkgname/subprojects/vte" -p1 -i "$srcdir/$pkgname/build-aux/0001-add-notification-and-shell-precmd-preexec.patch"
  patch -d "$srcdir/$pkgname/subprojects/vte" -p1 -i "$srcdir/$pkgname/build-aux/0001-a11y-implement-GtkAccessibleText.patch"
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

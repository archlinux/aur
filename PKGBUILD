# Maintainer: Piroro-hs

pkgname=ptyxis
pkgver=47.0
_vtearchver=0.78.0
_vtecommit='e24087d953d9352c8bc46074e2662c80f9bfbc2d'
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
         'graphene'
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
         "vte-common>=$_vtearchver")
makedepends=('git'
             'glib2-devel'
             'meson')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=("$pkgname::git+$url#tag=$pkgver"
        "${pkgname}_vte::git+https://gitlab.gnome.org/GNOME/vte.git#commit=$_vtecommit")
sha256sums=('626de77aa50d2320a61ee5d61312a2653e451ab5697c1ed1717ae67bd7577321'
            '12154ce2497c31894b3ae81ab0c03272843323933e6658ceecc99d5e537dda56')

prepare() {
  rm -rf "$srcdir/$pkgname/subprojects"
  mkdir "$srcdir/$pkgname/subprojects"
  mv "$srcdir/${pkgname}_vte" "$srcdir/$pkgname/subprojects/vte"
  sed -i 's/0.79.0/10000.78.0/' "$srcdir/$pkgname/subprojects/vte/meson.build"
  sed -i 's/vte_api_major_version = 2/vte_api_major_version = 10002/' "$srcdir/$pkgname/subprojects/vte/meson.build"
  sed -i '/vte-2.91-gtk4/c\subproject('\''vte'\'').get_variable('\''libvte_gtk4_dep'\''),' "$srcdir/$pkgname/src/meson.build"
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
  # rm -rf "$pkgdir/etc/profile.d/vte.csh"
  # rm -rf "$pkgdir/etc/profile.d/vte.sh"
  rm -rf "$pkgdir/etc/"
}

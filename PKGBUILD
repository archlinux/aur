# Maintainer: Piroro-hs

pkgname=ptyxis
pkgver=46.3
_vtever=0.76.3
_vtecommit='036bc3ddcbb56f05c6ca76712a53b89dee1369e2'
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
             'meson'
             'python-packaging')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
source=("$pkgname::git+$url#tag=$pkgver"
        "${pkgname}_vte::git+https://gitlab.gnome.org/GNOME/vte.git#commit=$_vtecommit"
        '0001-bundle-patched-vte.patch')
sha256sums=('b0a9ab1c36d57b6c2816e2e1c1ed0e48630237797720f5474d0453d703c70b90'
            '04cdba718e061063d1f8f623012769827e20561dcea735f5bd4d135c2579b10f'
            'be0f5d53d73c53896055f6e35fe88dab343e27ad849ca032c7aa38f51498f713')

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

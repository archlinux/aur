# Maintainer: Gerald Nunn <gerald dot b dot nunn at gmail dot com>

pkgname=terminix-git
_pkgname=terminix
pkgver=0.40.0.r4.7935eab
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
makedepends=('git' 'dmd' 'dub')
provides=('terminix')
conflicts=('terminix')
install=$pkgname.install
source=('git+https://github.com/gnunn1/terminix')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  dub build --build=release
  cd data/resources
  glib-compile-resources terminix.gresource.xml
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/terminix/schemes"
  mkdir -p "$pkgdir/usr/share/terminix/resources"
  
  cd "$_pkgname"
  install -Dm755 terminix "$pkgdir/usr/bin/terminix"
  install -Dm644 data/pkg/desktop/com.gexperts.Terminix.desktop "$pkgdir/usr/share/applications/com.gexperts.Terminix.desktop"
  install -Dm644 data/schemes/* "$pkgdir/usr/share/terminix/schemes/"
  install -Dm644 data/resources/terminix.gresource "$pkgdir/usr/share/terminix/resources/terminix.gresource"
  install -Dm644 data/gsettings/com.gexperts.Terminix.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/com.gexperts.Terminix.gschema.xml"
}

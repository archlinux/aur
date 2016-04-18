# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix-git
_pkgname=terminix
pkgver=0.58.1.r0.e3c039c
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'dconf' 'gsettings-desktop-schemas' 'vte3')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus')
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
  # Either clone or pull GtkD repo
  _gtkdrepo="$srcdir/gtk-d"
  if [ -d "$_gtkdrepo" ]; then
    git --git-dir="$_gtkdrepo/.git" pull
  else
    git clone https://github.com/gtkd-developers/GtkD.git "$_gtkdrepo"
  fi
  
  _gtkdver=$(git --git-dir="$_gtkdrepo/.git" describe --tags --abbrev=0 | sed 's/^v//')

  # Register local GtkD repository in dub
  dub add-local "$_gtkdrepo" $_gtkdver

  # Build terminix
  cd "$_pkgname"
  dub build --build=release
  
  # De-register local GtkD repository in dub
  dub remove-local "$_gtkdrepo"
}

package() {
  cd "$_pkgname"
  ./install.sh $pkgdir/usr
  rm $pkgdir/usr/share/glib-2.0/schemas/gschemas.compiled 
}


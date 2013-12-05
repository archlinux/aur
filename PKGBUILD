# Maintainer: carstene1ns <arch carsten-teibes de>

##### OPTIONS #####
_gtk_version=3
_nemo_plugin=y
_nautilus_plugin=n
_thunar_plugin=n
###################

_pkgbase=gtkhash
pkgname=$_pkgbase-git
pkgver=0.7.0.4.ga01ad64
pkgrel=1
pkgdesc='A GTK+ utility for computing message digests or checksums (development version).'
arch=('i686' 'x86_64')
url='http://gtkhash.sourceforge.net/'
license=('GPL')
makedepends=('intltool')
depends=('dconf')
install=$_pkgbase.install
source=("$_pkgbase::git://github.com/tristanheaven/gtkhash.git"
        "$_pkgbase.desktop")
conflicts=("$_pkgbase")
provides=("$_pkgbase")
md5sums=('SKIP' 'SKIP')

# gtk version
if [ "$_gtk_version" = "3" ]; then
  _pkgoptions="$_pkgoptions --with-gtk=3.0"
  depends=("${depends[@]}" "gtk3")
else
  _pkgoptions="$_pkgoptions --with-gtk=2.0"
  depends=("${depends[@]}" "gtk2")
fi

# nemo plugin
if [ "$_nemo_plugin" = "y" ]; then
  _pkgoptions="$_pkgoptions --enable-nemo"
  makedepends=("${makedepends[@]}" "nemo")
  optdepends=("${optdepends[@]}" "nemo: filemanager plugin")
fi

# nautilus plugin
if [ "$_nautilus_plugin" = "y" ]; then
  _pkgoptions="$_pkgoptions --enable-nautilus"
  makedepends=("${makedepends[@]}" "libnautilus-extension")
  optdepends=("${optdepends[@]}" "nautilus: filemanager plugin")
fi

# thunar plugin
if [ "$_thunar_plugin" = "y" ]; then
  _pkgoptions="$_pkgoptions --enable-thunar"
  makedepends=("${makedepends[@]}" "thunar")
  optdepends=("${optdepends[@]}" "thunar: filemanager plugin")
fi

pkgver() {
  cd $_pkgbase

  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

build() {
  cd $_pkgbase

  ./autogen.sh
  ./configure --prefix=/usr --disable-schemas-compile --enable-gtkhash \
              --enable-linux-crypto --enable-nettle $_pkgoptions

  make
}

package() {
  cd $_pkgbase

  make DESTDIR=$pkgdir install

  # install desktop entry
  install -Dm644 ../gtkhash.desktop $pkgdir/usr/share/applications/gtkhash.desktop
}

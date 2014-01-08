# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>

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
conflicts=("$_pkgbase")
provides=("$_pkgbase")
install=$_pkgbase.install
source=($_pkgbase::"git+https://github.com/tristanheaven/gtkhash.git"
        "$_pkgbase.desktop")
sha256sums=('SKIP'
            'f0312086093f0dd5ce0cfd6c9312abd42b57401960c39c19377372c154a32388')

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

  make DESTDIR="$pkgdir/" install

  # install desktop entry
  install -Dm644 ../gtkhash.desktop "$pkgdir"/usr/share/applications/gtkhash.desktop
}

# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

##### OPTIONS #####
_gtk_version=2
_nemo_plugin=y
_nautilus_plugin=n
_thunar_plugin=n
###################

pkgname=gtkhash
pkgver=0.7.0
pkgrel=2
pkgdesc="A GTK+ utility for computing message digests or checksums"
arch=('i686' 'x86_64' 'mips64el')
url="http://gtkhash.sourceforge.net/"
license=('GPL')
makedepends=('intltool')
depends=('dconf')
install=$pkgname.install
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.xz"
        "gtkhash.desktop")
sha256sums=('161d4f27f2d412c8cb3f566ca3aa8144942bbf836c18bcb1e5f79451e6f5dfdd'
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

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --disable-schemas-compile --enable-gtkhash \
              --enable-linux-crypto --enable-nettle $_pkgoptions
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install

  # install desktop entry
  install -Dm644 ../gtkhash.desktop "$pkgdir"/usr/share/applications/gtkhash.desktop
}

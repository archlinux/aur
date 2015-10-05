# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Ionut Biru  <ibiru@archlinux.ro>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>

pkgname=geany-gtk3
_pkgname=geany
pkgver=1.25
pkgrel=1
pkgdesc='Fast and lightweight IDE'
arch=('x86_64' 'i686')
url='http://www.geany.org/'
license=('GPL')
depends=('gtk3' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('perl-xml-parser' 'setconf' 'intltool')
optdepends=('geany-plugins-gtk3: various extra features'
            'vte: terminal support'
            'python2')
provides=geany
conflicts=geany
install="$pkgname.install"
source=("http://download.geany.org/${_pkgname}-$pkgver.tar.bz2")
sha256sums=('8ee41da28cead8c94d433e616d7ababa81727c63e9196ca6758ade3af14a49ef')

prepare() {
  cd "${_pkgname}-$pkgver"

  # Python2 fix
	sed -i '0,/on/s//on2/' data/templates/files/main.py

  # Syntax highlighting for PKGBUILD files
  sed -i 's/Sh=/Sh=PKGBUILD;/' data/filetype_extensions.conf
}

build() {
  cd "${_pkgname}-$pkgver"

  ./configure --prefix=/usr --enable-gtk3
  make

  # Fix for FS#10318
  setconf geany.desktop MimeType ''
}

package() {
  make -C "${_pkgname}-$pkgver" DESTDIR="$pkgdir" install
}


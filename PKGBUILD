# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Aleksei Lissitsin <aleksei.lissitsin@gmail.com>

pkgname=gedit-latex
pkgver=3.20.0
pkgrel=1
pkgdesc="Gedit plugin that provides features to ease the edition of LaTeX documents"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Gedit/LaTeXPlugin"
license=('GPL')
groups=()
depends=(gedit rubber texlive-core python-gobject python-dbus)
makedepends=(cairo gettext atk intltool libpeas gtk3 glib2)
provides=()
conflicts=(gedit-latex-plugin)
replaces=(gedit-latex-plugin)
install=gschemas.install
source=(http://ftp.acc.umu.se/pub/GNOME/sources/gedit-latex/3.20/gedit-latex-3.20.0.tar.xz)
sha256sums=('d7841ef63e410b9b7179b77fe3a2993c717dfd113439230ab0cb5c4d7314f1b9')
build() {
  cd "$srcdir"
  
  ln -sf gedit-latex "$pkgname-$pkgver"

  cd "$pkgname-$pkgver"

  # fixes taken from the fedora package
  sed -i -e 's|_CONFIG_FILENAME = "/etc/texmf/texmf.cnf"|_CONFIG_FILENAME = "/usr/share/texmf/web2c/texmf.cnf"|' latex/latex/environment.py
  sed -i -e 's|_DEFAULT_TEXMF_DIR = "/usr/share/texmf-texlive"|_DEFAULT_TEXMF_DIR = "/usr/share/texmf"|' latex/latex/environment.py

  # fixes some path errors on loading
  sed -i -e 's|cnf_file\[key\]|cnf_file\[key\].replace("$TEXMFROOT", "/usr/share")|' latex/latex/environment.py

  # this is needed when building from git src
  #./autogen.sh

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}


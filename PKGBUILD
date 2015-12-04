# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>
# Contributor: Aleksei Lissitsin <aleksei.lissitsin@gmail.com>

pkgname=gedit-latex
pkgver=3.8.0
pkgrel=2
pkgdesc="Gedit plugin that provides features to ease the edition of LaTeX documents"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Gedit/LaTeXPlugin"
license=('GPL')
groups=()
depends=(gedit rubber texlive-core python-gobject python-dbus python-latex)
makedepends=(cairo gettext atk intltool libpeas gtk3 glib2)
provides=()
conflicts=(gedit-latex-plugin)
replaces=(gedit-latex-plugin)
install=gschemas.install
source=(http://ftp.gnome.org/pub/GNOME/sources/gedit-latex/3.8/gedit-latex-3.8.0.tar.xz)
sha256sums=('1a49a57b650e0af446299ba70b237d9066650f21ff938390d5b6261430061309')
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


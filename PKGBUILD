# $Id$
# Maintainer: Emanuel Fernandes <efernandes@tektorque.com>
# Contributor: Mauro Fruet <maurofruet@gmail.com>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=evince-git
pkgver=3.17.2.r15.gb998a03
pkgrel=1
pkgdesc="Simply a document viewer"
url="http://projects.gnome.org/evince/"
arch=(i686 x86_64)
license=(GPL)
depends=(gtk3 libgxps libspectre gsfonts poppler-glib djvulibre t1lib libsecret desktop-file-utils dconf gsettings-desktop-schemas adwaita-icon-theme)
makedepends=(git itstool libnautilus-extension texlive-bin intltool gobject-introspection docbook-xsl python gnome-common yelp-tools gtk-doc)
optdepends=('texlive-bin: DVI support'
	    'gvfs: bookmark support and session saving'
            'p7zip: cbz and cb7 compressed comic books'
            'tar: cbt compressed comic books'
            'unrar: cbr compressed comic books')
provides=('evince')
conflicts=('evince')
install=evince.install
options=('!emptydirs')
source=("$pkgname"::'git://git.gnome.org/evince.git'
	'evince.install')
md5sums=('SKIP'
         '6d92c48973c4612b32a4ff817de016b3')


pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  ./autogen.sh --prefix=/usr  --sysconfdir=/etc \
      --localstatedir=/var    --libexecdir=/usr/lib/evince \
      --disable-static        --enable-nautilus \
      --enable-pdf            --enable-tiff \
      --enable-djvu           --enable-dvi \
      --enable-t1lib          --enable-comics \
      --disable-scrollkeeper  --disable-schemas-compile \
      --enable-introspection
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}

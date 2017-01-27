# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=epiphany
pkgname=$_pkgname-git
pkgver=3.23.4+53+ga0545a9e5
pkgrel=1
install=epiphany.install
pkgdesc="A GNOME web browser based on the WebKit rendering engine."
arch=('i686' 'x86_64')
license=('GPL')
depends=("glib2" "gtk3>=3.22.0" "libsoup>=2.48.0" 'libnotify' 'gsettings-desktop-schemas' 'webkit2gtk>=2.15.1' 
		  'nss' 'iso-codes' 'dconf' 'gobject-introspection' 'desktop-file-utils' 'libxml2' 'libsecret'
		  'hicolor-icon-theme' 'gcr' 'gnome-desktop' 'libwnck3' 'appstream-glib' 'libhttpseverywhere')
makedepends=('intltool' 'gnome-doc-utils' 'gnome-common' 'git' 'startup-notification' 'yelp-tools')
options=('!libtool' '!emptydirs')
groups=('gnome')
url="http://www.gnome.org/projects/epiphany/"
replaces=('epiphany')
provides=("epiphany")
conflicts=('epiphany')
source=('git://git.gnome.org/epiphany'
	'git://git.gnome.org/libgd'
	'git://git.gnome.org/gvdb'
	'pluginsdir.diff'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '96973321fe715b82a69f95f77b150853b43909b05f8aaa0bec46c12aff305763')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|+|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config --local libgd.url "${srcdir}/libgd"
  git config --local gvdb.url "${srcdir}/gvdb/gvdb"
  git submodule update
  # patch -Np1 -i ../pluginsdir.diff
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-maintainer-mode \
      --disable-Werror
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

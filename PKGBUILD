# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=epiphany
pkgname=$_pkgname-git
pkgver=3.23.3
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
source=('git+https://git.gnome.org/browse/epiphany'
	'git+https://git.gnome.org/browse/libgd'
	'git+https://git.gnome.org/browse/gvdb'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git config libgd.url "${srcdir}/libgd"
  git config gvdb.url "${srcdir}/gvdb/gvdb"
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-maintainer-mode \
      --with-libhttpseverywhere --enable-firefox-sync \
      --enable-debug --disable-Werror
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}

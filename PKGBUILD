# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Contributor: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

_pkgname=epiphany
pkgname=$_pkgname-pantheon-bzr
pkgver=3.18.5.r11
pkgrel=1
pkgdesc="A GNOME web browser based on the WebKit rendering engine, with ElementaryOS patchset"
url="http://www.gnome.org/projects/epiphany/"
arch=('i686' 'x86_64')
license=('GPL')
depends=(webkit2gtk gcr gnome-desktop)
makedepends=(intltool itstool docbook-xml startup-notification lsb-release
             gobject-introspection yelp-tools autoconf-archive appstream-glib bzr git)
groups=(gnome)
replaces=(epiphany)
provides=(epiphany)
conflicts=(epiphany)
source=("https://git.gnome.org/browse/epiphany/snapshot/epiphany-3.18.5.tar.xz"
        "bzr+lp:~elementary-os/elementaryos/os-patch-epiphany-browser-xenial"
        "git+https://git.gnome.org/browse/libgd"
	"git://git.gnome.org/gvdb"
        "pluginsdir.diff"
        "webkit-update.patch")
sha256sums=('8ada9f9af99902539d69fcba32607f5d8f80921d0475293088bc2f191499a8ef'
            'SKIP'
            'SKIP'
            'SKIP'
            '5fae0813c0f0e4451613ea4702b12df94c94e3545fd3eae96370446abbed2f48'
            'f569c4a01e4fe9c207b0ed22f6fbd4d25ac29868c59f585d658aa478695f1617')

pkgver() {
  cd os-patch-epiphany-browser-xenial

  echo "3.18.5.r$(bzr revno)"
}

prepare() {
  cd $_pkgname-3.18.5

  # Apply Patches
  for i in $(grep -v '#' "$srcdir/os-patch-epiphany-browser-xenial/debian/patches/series" | sort); do
    [[ "${i}" =~ ^# || -z "${i}" ]] || \
    [[ "${i}" == 99_toolbar_add_bookmark_button.patch ]] || \
    [[ "${i}" == 99_tabs_double_click_opens_new_tab.patch ]] && continue
    msg2 "Applying $i ..."
    patch -Np1 < "$srcdir/os-patch-epiphany-browser-xenial/debian/patches/$i"
  done

  msg2 "Plugins Directory"
  patch -Np1 < ../pluginsdir.diff

  msg2 "Minor fix"
  patch -Np2 < ../webkit-update.patch

  git submodule init
  git config --local submodule.libgd.url "$srcdir/libgd"
  git config --local gvdb.url "${srcdir}/gvdb/gvdb"
  git submodule update
}

build() {
  cd $_pkgname-3.18.5
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --libexecdir=/usr/lib/$pkgname --enable-compile-warnings=yes

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $_pkgname-3.18.5
  make DESTDIR="$pkgdir" install
}

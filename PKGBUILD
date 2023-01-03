# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: gitlab gitlab.gnome.org
# what: GNOME/gedit
# match! alpha[0-9]*$

pkgname=gedit-menubar
pkgver=44.0
pkgrel=1
pkgdesc="GNOME Text Editor (Patched to show menubar)"
url="https://wiki.gnome.org/Apps/Gedit"
arch=(x86_64)
license=(GPL)
depends=(gtksourceview4 gsettings-desktop-schemas libpeas gspell python-gobject
         dconf tepl)
makedepends=(yelp-tools vala gobject-introspection git gtk-doc meson
             appstream-glib desktop-file-utils libxml2)
optdepends=('gedit-plugins: Additional features')
conflicts=('gedit-code-assistance<=3.16.0+4+gd19b879-1' 'gedit')
provides=('gedit')
groups=(gnome)

source=("git+https://gitlab.gnome.org/GNOME/gedit.git#tag=$pkgver"
        "git+https://gitlab.gnome.org/GNOME/libgd.git"
        "menubar.patch")
sha256sums=('SKIP'
            'SKIP'
            '7b7bbcf115ee7a755ef039676a799bd0d2a95c36f4793e484bf296823efb2c32')

pkgver() {
  cd ${pkgname%-*}
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd ${pkgname%-*}
  git submodule init
  git submodule set-url subprojects/libgd "$srcdir/libgd"
  git -c protocol.file.allow=always submodule update
  patch -p1 < "$srcdir/menubar.patch"
}

build() {
  arch-meson ${pkgname%-*} build \
    -D gtk_doc=true \
    -D require_all_tests=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

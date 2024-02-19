# Maintainer: Ahmad Hasan Mubashshir <ahmubashshir@gmail.com>
# from: gitlab gitlab.gnome.org
# what: GNOME/gedit
# match! alpha[0-9]*$

pkgname=gedit-menubar
pkgver=46.2
pkgrel=1
pkgdesc="GNOME Text Editor (Patched to show menubar)"
url="https://wiki.gnome.org/Apps/Gedit"
arch=(x86_64)
license=(GPL)
depends=(
	gsettings-desktop-schemas
	gspell
	libgedit-amtk
	libpeas
	python-gobject
	tepl
)
makedepends=(
	appstream-glib
	desktop-file-utils
	git
	gobject-introspection
	gtk-doc
	meson
	vala
	yelp-tools
)
optdepends=('gedit-plugins: Additional features')
conflicts=('gedit-code-assistance<=3.16.0+4+gd19b879-1' 'gedit')
provides=('gedit')
groups=(gnome-extra)

source=("git+https://gitlab.gnome.org/GNOME/gedit.git#tag=$pkgver"
        "git+https://gitlab.gnome.org/GNOME/libgd.git"
        "menubar.patch")
sha256sums=('SKIP'
            'SKIP'
            'a711518646e2d0727927ea88d59010ece1611f1e00436a7276f934a628491c6a')

pkgver() {
  git -C ${pkgname%-*} describe --tags | sed 's/-/+/g'
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
  meson install -C build --destdir "$pkgdir"
}

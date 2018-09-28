pkgname=shotwell-git
_pkgname=shotwell
pkgver=0.31.4094
_pkgver=0.31
pkgrel=1
pkgdesc="A digital photo organizer designed for the GNOME desktop environment"
arch=('x86_64')
url="http://yorba.org/shotwell/"
license=('LGPL2.1')
depends=('libgee' 'webkit2gtk' 'libgexiv2' 'libraw' 'rest'
	 'desktop-file-utils' 'dconf' 'hicolor-icon-theme' 'json-glib'
	 'gst-plugins-base' 'libgphoto2' 'libgudev'
	 'gcr' 'libgdata' 'opencv')
makedepends=('intltool' 'vala>=0.17.2' 'gnome-doc-utils' 'itstool')
conflicts=(shotwell)
source=("$_pkgname"::'git+https://gitlab.gnome.org/GNOME/shotwell.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $_pkgver.$(git rev-list --count HEAD)
}

prepare() {
    cd "$srcdir/$_pkgname"
    sed -e 's/org.gnome.Shotwell/shotwell/g' -i data/org.gnome.Shotwell.desktop.in
    sed -e 's/org.gnome.Shotwell/shotwell/g' -i data/org.gnome.Shotwell-Viewer.desktop.in
    meson build -Dface-detection=true --prefix=/usr
}

build() {
    cd "$_pkgname/build"
    ninja
}

package() {
    cd "$_pkgname/build"
    DESTDIR="$pkgdir" ninja install
}

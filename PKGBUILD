pkgname=shotwell-git
_pkgname=shotwell
pkgver=0.31.4083
_pkgver=0.31
pkgrel=1
pkgdesc="A digital photo organizer designed for the GNOME desktop environment"
arch=('x86_64')
url="http://yorba.org/shotwell/"
license=('LGPL2.1')
depends=('libgee' 'webkit2gtk' 'libgexiv2' 'libraw' 'rest'
	 'desktop-file-utils' 'dconf' 'hicolor-icon-theme' 'json-glib'
	 'gst-plugins-base' 'libgphoto2' 'libgudev'
	 'gcr' 'libgdata')
makedepends=('intltool' 'vala>=0.17.2' 'gnome-doc-utils' 'itstool')

source=("$_pkgname"::'git+https://gitlab.gnome.org/GNOME/shotwell.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo $_pkgver.$(git rev-list --count HEAD)
}

prepare() {
    cd "$srcdir/$_pkgname"
    meson build --prefix=/opt/shotwell-git
}

build() {
    cd "$_pkgname/build"
    ninja
}

package() {
    cd "$_pkgname/build"
    DESTDIR="$pkgdir" ninja install
    install -d -m755 $pkgdir/usr/bin
    ln -s $pkgdir/opt/$pkgname/bin/shotwell $pkgdir/usr/bin/shotwell-git
    install -d -m755 $pkgdir/etc/ld.so.conf.d/
    echo /opt/shotwell-git/lib > $pkgdir/etc/ld.so.conf.d/shotwell-git.conf
}

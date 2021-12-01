pkgname=cairo-ubuntu
_realpkg=cairo
pkgver=1.17.4
pkgrel=1
pkgdesc="2D graphics library with support for multiple output devices (with ubuntu patches)"
url="https://cairographics.org/"
arch=(x86_64)
provides=("${_realpkg}")
license=(LGPL MPL)
conflicts=("cairo")
depends=(libpng libxrender libxext fontconfig pixman glib2 lzo)
makedepends=(librsvg gtk2 poppler-glib libspectre gtk-doc valgrind git)
#_commit=3ad43122b21a3299dd729dc8462d6b8f7f01142d
_commit=156cd3eaaebfd8635517c2baf61fcf3627ff7ec2
source=("cairo::git+https://anongit.freedesktop.org/git/cairo#commit=$_commit"
        cairo-make-lcdfilter-default.patch
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch)

pkgver() {
  cd $_realpkg
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_realpkg

  patch -Np1 -i ../cairo-respect-fontconfig_pb.patch
  patch -Np1 -i ../cairo-server-side-gradients.patch
  patch -Np1 -i ../cairo-webkit-html5-fix.patch
  patch -Np1 -i ../cairo-make-lcdfilter-default.patch
  
  # Update gtk-doc
  cp /usr/share/aclocal/gtk-doc.m4 build/aclocal.gtk-doc.m4
  cp /usr/share/gtk-doc/data/gtk-doc.make build/Makefile.am.gtk-doc

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_realpkg
  ./configure --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --disable-static \
        --disable-gl \
        --enable-tee \
        --enable-svg \
        --enable-ps \
        --enable-pdf \
        --enable-gobject \
        --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_realpkg
  # https://people.gnome.org/~federico/blog/helping-cairo.html
  #make check
}

package() {
  cd $_realpkg
  make DESTDIR="$pkgdir" install
}

md5sums=('SKIP'
         '1ec7560b9f05b5b0a6aca41cfdb8ea93'
         '080eac1ce1b2fa2beb550555d31d29b8'
         '4ffec1c86085da11bf9f56d6bf88fbdf'
         '6080d20e289f5e75cc013e8f40710aa3')

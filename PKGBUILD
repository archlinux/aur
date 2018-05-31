pkgname=cairo-ubuntu
_realpkg=cairo
pkgver=1.15.12
pkgrel=2
pkgdesc="2D graphics library with support for multiple output devices (with ubuntu patches)"
url="https://cairographics.org/"
arch=(x86_64)
provides=("${_realpkg}=${pkgver}")
license=(LGPL MPL)
depends=(libpng libxrender libxext fontconfig pixman glib2 lzo)
makedepends=(librsvg gtk2 poppler-glib libspectre gtk-doc valgrind git)
_commit=7149686456ec3c481fa1d3dbe76a0dab1e42b519  # tags/1.15.12^0
source=("git+https://anongit.freedesktop.org/git/cairo#commit=$_commit"
        utf-8.diff
        cairo-respect-fontconfig_pb.patch
        cairo-server-side-gradients.patch
        cairo-webkit-html5-fix.patch)

pkgver() {
  cd $_realpkg
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_realpkg

  # Fixup tag for pkgver()
  git tag -f 1.15.10 5e6b9aeb5e3402ff17ae8ee8548ae2341c2f7d59

  # Fix non-UTF-8 sources giving gtk-doc trouble
  patch -Np1 -i ../utf-8.diff
  patch -Np1 -i ../cairo-respect-fontconfig_pb.patch
  patch -Np1 -i ../cairo-server-side-gradients.patch
  patch -Np1 -i ../cairo-webkit-html5-fix.patch

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
         '46b1abd8e6ff88107680d907b8c247fc'
         '080eac1ce1b2fa2beb550555d31d29b8'
         '4ffec1c86085da11bf9f56d6bf88fbdf'
         '6080d20e289f5e75cc013e8f40710aa3')

# Maintainer: sfs sfslinux@gmail.com

pkgname=xviewer-minimal
pkgver=2.6.2
pkgrel=2
pkgdesc='GTK3 image viewer with printing, without plugins or Cinnamon integration'
arch=('x86_64')
url='https://github.com/linuxmint/xviewer'
license=('GPL-2.0-or-later')
depends=(
  'at-spi2-core' 'cairo' 'dconf' 'gdk-pixbuf2'
  'glib2' 'glibc' 'gsettings-desktop-schemas' 'gtk3' 'hicolor-icon-theme'
  'zlib'
)
makedepends=('glib2-devel' 'gnome-common' 'libxml2')
optdepends=('cups: local print server, not required for PDF or a remote CUPS server')
provides=("xviewer=$pkgver")
conflicts=('xviewer')
source=("xviewer-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        '0001-remove-plugins-and-introspection.patch'
        '0002-replace-cinnamon-desktop.patch')
sha256sums=('2bbe97181be7bbb9a163224640b9ba97377f8ac7850bd7f553d7737bd9207938'
            '2c87a896846a09215bfd2c09ef42b0d252f348bce37ac02c0c8c3795d7a42ca9'
            '91d50c548b3a15dba37564d5863c28f0a68541eba9e00842312b8067f1ea13d7')
options=('!debug')

prepare() {
  cd "xviewer-$pkgver"
  patch -Np1 -i "$srcdir/0001-remove-plugins-and-introspection.patch"
  patch -Np1 -i "$srcdir/0002-replace-cinnamon-desktop.patch"
  # The installed-test macro is absent from the upstream release archive.
  sed -i '/^BEHAVE_INSTALLED_TESTS$/d' configure.ac
  mkdir -p m4
  gtkdocize --copy
  intltoolize --force --copy
  autoreconf -fi
}

build() {
  cd "xviewer-$pkgver"
  # GCC 14+ rejects old GTK/GObject subclass pointer assignments.
  CFLAGS+=' -Wno-error=incompatible-pointer-types'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --disable-static \
    --disable-gtk-doc \
    --without-libexif \
    --without-xmp \
    --without-cms \
    --without-librsvg \
    --without-libjpeg
  make
}

package() {
  cd "xviewer-$pkgver"
  make DESTDIR="$pkgdir" install
}

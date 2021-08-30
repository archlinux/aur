# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Star Brilliant <m13253@hotmail.com>

pkgname=upower-nocritical
_pkgname=upower
pkgver=0.99.12
pkgrel=1
pkgdesc="Abstraction for enumerating power devices, listening to device events and querying history and statistics (With a patch to disable low battery action)"
arch=('i686' 'x86_64')
url="http://upower.freedesktop.org"
license=('GPL')
depends=('systemd' 'libusb' 'libimobiledevice' 'libgudev')
makedepends=('intltool' 'docbook-xsl' 'gobject-introspection' 'python2' 'git' 'gtk-doc')
provides=('upower')
conflicts=('upower')
backup=('etc/UPower/UPower.conf')
_tag=$(echo "UPOWER_$pkgver" | sed -e "s/\./_/g")
source=("git+https://gitlab.freedesktop.org/upower/upower.git#tag=$_tag"
        0001-Add-a-critical-action-Ignore.patch)
md5sums=('SKIP'
         '69fbeb7e5906a59fd39f702d01f83815')

prepare() {
  cd $_pkgname
  patch -p1 < "$srcdir/0001-Add-a-critical-action-Ignore.patch"
  sed -e 's|libplist >= 0.12|libplist-2.0 >= 2.2|' -i configure.ac # support libplist 2.2
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --disable-static \
    --enable-gtk-doc
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

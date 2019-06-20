# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Star Brilliant <m13253@hotmail.com>

pkgname=upower-nocritical
_pkgname=upower
pkgver=0.99.10
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
_commit=215049e7b80c5f24cb35cd229a445c6cf19bd381  # tags/UPOWER_0_99_10^0
source=("git+https://gitlab.freedesktop.org/upower/upower.git#commit=$_commit"
        0001-Add-a-critical-action-Ignore.patch)
md5sums=('SKIP'
         '69fbeb7e5906a59fd39f702d01f83815')

pkgver() {
  cd $_pkgname
  git describe --tags | sed -e 's/UPOWER_//' -e 's/_/\./g' -e 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -p1 < "$srcdir/0001-Add-a-critical-action-Ignore.patch"
}

build() {
  cd $_pkgname

  NOCONFIGURE=1 ./autogen.sh

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/$_pkgname \
    --disable-static
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

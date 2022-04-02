# Maintainer: s3rj1k <evasive.gyron@gmail.com>
# Do not forget to run `makepkg --printsrcinfo > .SRCINFO`

_pkgname=plank
_pkgver=0.11.89
pkgname=${_pkgname}-minimal
pkgver=0.11.89.r0.g27c7863
pkgrel=1
pkgdesc='Elegant, simple, clean dock (minimal build)'
arch=('x86_64')
url='https://launchpad.net/plank'
license=('GPL3')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc'
         'gtk3' 'libgee' 'libwnck3' 'libx11' 'libxfixes' 'libxi' 'pango')
makedepends=('gnome-common' 'git' 'intltool' 'vala')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("git+https://github.com/ricotz/plank.git#tag=${_pkgver}"
        'disable-docklets.patch')
sha256sums=('SKIP'
            'd46000c57cd19cbcb16737af27fbe4fe748e9e6d17f5c99a8be3845adf5cd983')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  sed 's/0.19.6/0.20/' -i configure.ac

  # Do not build extra docklets
  patch -Np1 -i "$srcdir/disable-docklets.patch"
}

build() {
  cd ${_pkgname}
  ./autogen.sh \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --disable-apport \
    --disable-debug
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  make DESTDIR="${pkgdir}" -C plank install
}

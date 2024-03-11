# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-indicator-applet
pkgver=0.7.2.r1.g6ff6208
_commit=6ff6208c28ebf97c80b2534511e48e95fef3d5b8
pkgrel=1
pkgdesc="Application Indicator Applet for the budgie-desktop"
url='https://github.com/UbuntuBudgie/budgie-indicator-applet'
arch=('i686' 'x86_64')
license=('GPL-3.0-only')
depends=(
  'atk'
  'ayatana-ido'
  'budgie-desktop'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libayatana-indicator'
  'libpeas'
)
makedepends=(
  'git'
)
source=("git+${url}.git#commit=${_commit}")
b2sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"

  echo "Adding LDFLAGS vaues to CLFLAGS to respect LTO, relro, as-needed etc. configs."
  export CFLAGS+=" ${LDFLAGS}"

  ./autogen.sh \
    --libdir=/usr/lib \
    --prefix=/usr \
    --sharedstatedir=/var \
    --sharedstatedir=/var/lib \
    --sysconfdir=/etc \
    --with-ayatana-indicators

  echo "Adding LTO and '--as-needed' params to libtool."
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

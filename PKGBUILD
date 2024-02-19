# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Thom Wiggers <pkgbuild@thomwiggers.nl>
# Contributor: Sirat18 <aur@sirat8.de>
# Contributor: wodim <neikokz@gmail.com>

_pkgbase=networkmanager-iodine
pkgname="${_pkgbase}-git"
pkgver=1.2.0.r72.g53f5069
pkgrel=1
pkgdesc="Iodine plugin for NetworkManager (git build)"
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/GNOME/network-manager-iodine'
license=('GPL-2.0-or-later')
depends=(
  'at-spi2-core'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'iodine'
  'libnm'
  'libnma'
  'libsecret'
  'networkmanager'
  'pango'
  'zlib'
)
makedepends=('git' 'intltool')
provides=("${_pkgbase}=${pkgver%.r*}")
conflicts=("${_pkgbase}")
source=("${pkgname}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/$pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/$pkgname"

  echo "Adding LDFLAGS vaues to CLFLAGS to respect LTO, relro, as-needed etc. configs."
  export CFLAGS+=" ${LDFLAGS}"

  ./autogen.sh \
    --prefix=/usr \
    --includedir=/usr/include \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --sharedstatedir=/var/lib/NetworkManager \
    --sysconfdir=/etc \
    --enable-static=no
}

build() {
  cd "${srcdir}/$pkgname"
  make
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install
}

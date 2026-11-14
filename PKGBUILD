# Maintainer: Gergely Imreh <gergely@imreh.net>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Thom Wiggers <pkgbuild@thomwiggers.nl>
# Contributor: Sirat18 <aur@sirat8.de>
# Contributor: wodim <neikokz@gmail.com>

_pkgbase=networkmanager-iodine
pkgname="${_pkgbase}-git"
pkgver=1.4.0.r2.g872e6b4
pkgrel=1
pkgdesc="Iodine plugin for NetworkManager (git build)"
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/GNOME/network-manager-iodine'
license=('GPL-2.0-or-later')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'iodine'
  'libgcc'
  'libnm'
  'libnma-gtk4'
  'libsecret'
  'networkmanager'
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

build() {
  cd "${srcdir}/$pkgname"

  # Configure here rather than in prepare(): makepkg only adds the debug and
  # LTO flags to the environment after prepare() has run.
  echo "Adding LDFLAGS values to CFLAGS to respect LTO, relro, as-needed etc. configs."
  export CFLAGS+=" ${LDFLAGS}"

  ./autogen.sh \
    --prefix=/usr \
    --includedir=/usr/include \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --sharedstatedir=/var/lib/NetworkManager \
    --sysconfdir=/etc \
    --enable-static=no
  make
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install
}

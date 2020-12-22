# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>
# Contributor: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>
# Contributor: sekret <sekret at posteo.se>

_pkgname=htop
pkgname=$_pkgname-solarized
pkgver=3.0.3
pkgrel=1
pkgdesc="Interactive process viewer with solarized patch"
arch=('i686' 'x86_64' 'armv7h')
url='https://htop.dev/'
license=('GPL')
depends=('ncurses' 'libncursesw.so' 'libnl')
makedepends=('lm_sensors')
optdepends=('lm_sensors: show cpu temperatures'
            'lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'htop-solarized.patch')
sha256sums=('725103929c925a7252b4dedeb29b3a1da86a2f74e96c50eb9ea6c8fec1942cd2'
            '9d2c3b48fa62023eedea61ccb96ff6b8ed90294c5dea2635056756c8ffabaeb9')

prepare() {
  cd "$_pkgname-$pkgver"

  autoreconf -fi

  # Solarized patch
  patch -p1 -N -i "${srcdir}/htop-solarized.patch"
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-cgroup \
      --enable-delayacct \
      --enable-openvz \
      --enable-unicode \
      --enable-vserver

  make
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

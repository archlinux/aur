# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=procps-ng-nosystemd-minimal-git
pkgver=3.3.16
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes'
url='https://gitlab.com/procps-ng/procps'
license=(GPL LGPL)
arch=(x86_64)
depends=(ncurses)
conflicts=(procps procps-ng sysvinit-tools)
provides=(procps procps-ng sysvinit-tools)
replaces=(procps sysvinit-tools)
source=("git+https://gitlab.com/procps-ng/procps.git"
        fs66093.patch)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd procps-ng
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd procps-ng
  sed 's:<ncursesw/:<:g' -i watch.c

  # pgrep: check sanity of SC_ARG_MAX 
  # https://bugs.archlinux.org/task/66093
  patch -p1 -i ../fs66093.patch
}

build() {
  cd procps-ng

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --exec-prefix=/ \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --enable-watch8bit \
    --without-systemd \
    --disable-modern-top \
    --disable-kill \
    --disable-libselinux \
    --without-elogind \
    --disable-numa \
    --disable-whining

  make
}

package() {
  cd procps-ng
  make DESTDIR="$pkgdir" install
}

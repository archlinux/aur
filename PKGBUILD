# Maintainer: Gerlof Fokkema <gerlof.fokkema+aur@gmail.com>
# Maintainer: Rene Peinthor <peinthor@gmail.com>

pkgname=drbd-utils-git
pkgver=9.31.0
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc='Userland tools for Distributed Replicated Block Device. (Git)'
url='https://www.drbd.org'
license=('GPL2')
depends=('bash')
makedepends=('git' 'libxslt' 'systemd' 'po4a')
provides=('drbd-utils=${pkgver}')
conflicts=('drbd-utils')
replaces=('drbd-utils')
source=("git+https://github.com/LINBIT/drbd-utils.git"
        "drbd-headers.git::git+https://github.com/LINBIT/drbd-headers.git")
backup=('etc/drbd.conf' 'etc/drbd.d/global_common.conf')
md5sums=('SKIP' 'SKIP')

prepare() {
  cd $srcdir/drbd-utils
  git submodule init
  git -c protocol.file.allow=always submodule update
  sed -i -e "s: -Wshadow: -Wshadow $LDFLAGS:" user/drbdmon/Makefile.in
}

build() {
  cd $srcdir/drbd-utils
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libdir=/usr/lib \
    --with-distro=generic \
    --with-bashcompletion \
    --with-initscripttype=systemd \
    --with-udev \
    --without-rgmanager \
    --without-pacemaker \
    --without-heartbeat \
    --without-83support \
    --without-manual \
    --without-xen
  make
}

package() {
  make -C $srcdir/drbd-utils DESTDIR="$pkgdir" install

  cd "$pkgdir"

  # move bash completion
  install -dm 755 usr/share/bash-completion

  # remove /var establish /var/lib/drbd when installed
  rm -r var
  install -Dm 644 /dev/null usr/lib/tmpfiles.d/drbd.conf
  echo "d /var/lib/drbd" >usr/lib/tmpfiles.d/drbd.conf

  # autoload module
  install -Dm 644 /dev/null usr/lib/modules-load.d/drbd.conf
  echo 'drbd' > usr/lib/modules-load.d/drbd.conf
}

# vim:set ts=2 sw=2 et:

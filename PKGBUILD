# Maintainer: Rene Peinthor <peinthor@gmail.com>

pkgname=drbd-utils-git
pkgver=9.3.1
pkgrel=1
arch=('x86_64')
pkgdesc='Userland tools for Distributed Replicated Block Device. (Git)'
url='https://www.drbd.org'
license=('GPL2')
depends=('perl' 'bash')
makedepends=('git' 'libxslt' 'systemd')
provides=('drbd-utils=${pkgver}')
conflicts=('drbd-utils')
replaces=('drbd-utils')
source=("git+https://github.com/LINBIT/drbd-utils.git")
backup=('etc/drbd.conf' 'etc/drbd.d/global_common.conf')
md5sums=('SKIP')

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
    --without-xen
  make
}

package() {
  make -C $srcdir/drbd-utils DESTDIR="$pkgdir" install

  cd "$pkgdir"

  # move /lib files under /usr/lib
  mv lib/drbd/* usr/lib/drbd
  rmdir lib/drbd lib

  # move bash completion
  install -dm 755 usr/share/bash-completion
  mv etc/bash_completion.d usr/share/bash-completion/completions

  # remove /var/lock
  rmdir var/lock

  # autoload module
  install -Dm 644 /dev/null usr/lib/modules-load.d/drbd.conf
  echo 'drbd' > usr/lib/modules-load.d/drbd.conf
}

# vim:set ts=2 sw=2 et:

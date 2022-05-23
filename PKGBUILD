# Packager: urawotlol <urawotlol@mailfence.com>
# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Sébastien Luttringer

pkgname=drbd-utils
pkgver=9.21.1
pkgrel=2
arch=('x86_64' 'i686')
pkgdesc='Userland tools for Distributed Replicated Block Device'
url='https://www.linbit.com/en/drbd-community/drbd-download/'
license=('GPL2')
depends=('bash')
makedepends=('libxslt' 'systemd' 'po4a')
conflicts=('drbd')
source=(https://pkg.linbit.com//downloads/drbd/utils/drbd-utils-$pkgver.tar.gz)
backup=('etc/drbd.conf' 'etc/drbd.d/global_common.conf')
md5sums=('1665c24a1c5b0ec21093d34770c1abd6')

prepare() {
  cd $pkgname-$pkgver
  sed -i -e "s: -Wshadow: -Wshadow $LDFLAGS:" user/drbdmon/Makefile.in
}

build() {
  cd $pkgname-$pkgver
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
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install

  cd "$pkgdir"

  # move /lib files under /usr/lib
  mv lib/drbd/* usr/lib/drbd
  rmdir lib/drbd lib

  # move bash completion
  install -dm 755 usr/share/bash-completion
  mv etc/bash_completion.d usr/share/bash-completion/completions

  # remove /var establish /var/lib/drbd when installed
  rm -r var
  install -Dm 644 /dev/null usr/lib/tmpfiles.d/drbd.conf
  echo "d /var/lib/drbd" >usr/lib/tmpfiles.d/drbd.conf

  # autoload module
  install -Dm 644 /dev/null usr/lib/modules-load.d/drbd.conf
  echo 'drbd' > usr/lib/modules-load.d/drbd.conf
}

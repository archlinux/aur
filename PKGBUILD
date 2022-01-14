# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Sébastien Luttringer

pkgname=drbd-utils
pkgver=9.20.0
pkgrel=1
arch=('x86_64')
pkgdesc='Userland tools for Distributed Replicated Block Device'
url='https://www.linbit.com/en/drbd-community/drbd-download/'
license=('GPL2')
depends=('perl' 'bash')
makedepends=('libxslt' 'systemd' 'po4a')
conflicts=('drbd')
replaces=('drbd')
source=(https://pkg.linbit.com//downloads/drbd/utils/drbd-utils-$pkgver.tar.gz)
backup=('etc/drbd.conf' 'etc/drbd.d/global_common.conf')
md5sums=('4aa0166684ab1b8abd3e9ca42f9f6d8e')

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

  # remove /var/lock and /var/run
  rm -r var/{lock,run}

  # autoload module
  install -Dm 644 /dev/null usr/lib/modules-load.d/drbd.conf
  echo 'drbd' > usr/lib/modules-load.d/drbd.conf
}

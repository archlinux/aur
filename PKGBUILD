# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper
pkgver=0.8.4
pkgrel=1
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
arch=('x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs' 'acl')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git' 'systemd')
optdepends=('pam: pam_snapper')
backup=('etc/conf.d/snapper')
source=("ftp://ftp.suse.com/pub/projects/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('cc8f6616e783fde75d18a3503d9ca90e4f88603db92c25ea40a2daeb9b491843')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # cron names
  sed -e 's@suse.de-snapper@snapper@g' -i scripts/Makefile.am

  # fix sysconf dir
  sed -e 's@/etc/sysconfig@/etc/conf.d@g' -i scripts/*snapper*

  # fix pam plugin install location
  sed -i -e 's@shell echo /@shell echo /usr/@g' pam/Makefile.am

  # dbus policy files in /usr/share/dbus-1
  sed -i -e 's@/etc/dbus-1/@/usr/share/dbus-1/@' data/Makefile.am

  # all in /usr/bin
  sed -i -e 's@/usr/sbin@/usr/bin@g' data/org.opensuse.Snapper.service

  # NTP drift file location
  sed -i -e 's@/var/lib/ntp/drift/ntp.drift@/var/lib/ntp/ntp.drift@' data/base.txt

  # man pages sysconfig location
  sed -i -e 's@/etc/sysconfig@/etc/conf.d@g' doc/*

  # swap macro errors
  sed -i -e '/#include <vector>/i #include <iterator>' {snapper,client,dbus}/*.{h,cc}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  aclocal
  libtoolize --force --automake --copy
  autoheader
  automake --add-missing --copy
  autoconf
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --with-conf=/etc/conf.d \
              --disable-zypp \
              --disable-silent-rules
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 data/sysconfig.snapper \
    "$pkgdir"/etc/conf.d/snapper
}

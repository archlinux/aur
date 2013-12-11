# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=snapper
pkgver=0.1.8
pkgrel=2
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
arch=('i686' 'x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git')
backup=('etc/conf.d/snapper')
source=("ftp://ftp.suse.com/pub/projects/$pkgname/$pkgname-$pkgver.tar.bz2")
options=(!libtool)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # rename cron scripts
  sed -i -e 's@suse.de-@@g' scripts/Makefile.am
  # fix config location in cron scripts
  sed -i -e 's@/etc/sysconfig/@/etc/conf.d/@g' scripts/snapper-{daily,hourly}

  # boost fixlets - Arch doesn't use -mt suffix
  sed -i -e 's@lboost_thread-mt@lboost_thread@g' snapper/Makefile.am
  sed -i -e 's@lboost_system-mt@lboost_system@g' snapper/Makefile.am

  # fix pam plugin install location
  sed -i -e 's@shell echo /@shell echo /usr/@g' pam/Makefile.am
  # Arch all in /usr/bin
  sed -i -e 's@/usr/sbin@/usr/bin@g' data/org.opensuse.Snapper.service

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
  install -Dm644 data/sysconfig.snapper "$pkgdir"/etc/conf.d/snapper

  rm -f "$pkgdir"/etc/snapper/zypp-plugin.conf
  rm -f "$pkgdir"/usr/share/man/man*/snapper-zypp-plugin.*.gz
}

sha256sums=('989a261411b7bf4f23373222402c37764e4f1714e301a8e9e396bb92a74e0539')

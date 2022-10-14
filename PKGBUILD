# Maintainer: Tom Kuther <archlinux@kuther.net>
# Co-Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>

pkgname=snapper-git
_gitname=snapper
pkgver=0.10.3.git.2211.03a6f3b
pkgrel=1
pkgdesc="A tool for managing BTRFS and LVM snapshots. It can create, diff and restore snapshots and provides timelined auto-snapping."
provides=('snapper')
conflicts=('snapper')
arch=('i686' 'x86_64')
url="http://snapper.io"
license=('GPL2')
depends=('btrfs-progs' 'libxml2' 'dbus' 'boost-libs' 'acl')
makedepends=('boost' 'lvm2' 'libxslt' 'docbook-xsl' 'pam' 'git' 'systemd')
backup=('etc/conf.d/snapper')
source=('snapper::git+https://github.com/openSUSE/snapper.git')
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo $(cat VERSION).git.$(git rev-list --count HEAD).$(git rev-parse --short master)
}

prepare() {
  cd "$_gitname"

  # cron names
  sed -e 's@suse.de-snapper@snapper@g' -i scripts/Makefile.am

  # fix sysconf dir
  sed -e 's@/etc/sysconfig@/etc/conf.d@g' -i scripts/*snapper*

  # fix pam plugin install location
  sed -i -e 's@shell echo /@shell echo /usr/@g' pam/Makefile.am

  # all in /usr/bin
  sed -i -e 's@/usr/sbin@/usr/bin@g' data/org.opensuse.Snapper.service

    # NTP drift file location
  sed -i -e 's@/var/lib/ntp/drift/ntp.drift@/var/lib/ntp/ntp.drift@' data/base.txt

  # man pages sysconfig location
  sed -i -e 's@/etc/sysconfig@/etc/conf.d@g' doc/*
}

build() {
  cd "$_gitname"

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
  cd "$_gitname"

  make DESTDIR="$pkgdir" install
  install -Dm644 data/sysconfig.snapper \
    "$pkgdir"/etc/conf.d/snapper
}

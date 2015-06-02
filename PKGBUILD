# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: gregor <gregor@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=dump
pkgver=0.4b44
pkgrel=4
pkgdesc="Standard *nix for performing backups to tapedrive from ext2 and ext3 filesystems"
arch=('i686' 'x86_64')
url="http://dump.sourceforge.net/"
license=('BSD')
depends=('e2fsprogs')
makedepends=('autoconf' 'automake' 'pkg-config')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        'dump-buildfix.patch'
        'autoreconf.patch'
        'restore-rmdir.patch')
md5sums=('daec97b1ad905c904eba926221f4be6d'
         'c412b47327240f4daecb68ba2f6a7730'
         '28615ed3146ae28f14050fab65ae712d'
         '85bd0d8238a5010a4823d6c9642dc75b')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  # source: http://sourceforge.net/p/dump/bugs/157/
  patch -p0 < "$srcdir"/restore-rmdir.patch
  
  # source: http://sourceforge.net/p/dump/patches/16/
  patch < "$srcdir"/dump-buildfix.patch

  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --with-manowner=root \
    --with-mangrp=root \
    --with-manmode=644 \
    --with-bingrp=root \
    --disable-readline \
    --disable-rmt \
    --disable-transselinux

  # upstream uses "autoconf" but that fails, so patch to use "autoreconf"
  patch < "$srcdir"/autoreconf.patch

  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  
  make prefix="$pkgdir"/usr install

  # the upstream Makefile doesn't care for --sbindir to work with
  # prefix=$pkgdir so manhandle /usr/sbin to /usr/bin
  mv -f "$pkgdir"/usr/sbin/ "$pkgdir"/usr/bin

  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/dump/COPYRIGHT
}

# vim:set ts=2 sw=2 et:

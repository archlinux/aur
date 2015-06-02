# Maintainer: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# http://github.com/fukawi2/aur-packages
# Contributor: Jakub Vitak <mainiak@gmail.com>

### I AM ONLY THE PACKAGER, NOT THE DEVELOPER
### Please ask support questions about this software in one of:
###   1) The AUR comments; OR
###   2) Upstream forums/maillist etc; OR
###   3) The ArchLinux forums
### I do not always know enough about the software itself, or don't have the
### time to promptly respond to direct emails.
### If you have found a problem with the package/PKGBUILD (as opposed to
### the software) then please do email me or post an AUR comment.

pkgname=authpgsql
_pkgname=nss_postgresql
pkgver=0.6.1
pkgrel=1
pkgdesc="A NSS library to authenticate users against postgresql."
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/authpgsql/"
depends=('postgresql-libs')
source=("http://download.sourceforge.net/${pkgname}/${_pkgname}-$pkgver.tar.gz")
md5sums=('ddce846553a25d341ebba50d69748bdb')

build() {
  cd $srcdir/${_pkgname}-$pkgver

  sed 's|pgsql/\(libpq-fe.h\)|\1|' < passwd.c > passwd.tmp && mv passwd.tmp passwd.c
  sed 's|pgsql/\(libpq-fe.h\)|\1|' < shadow.c > shadow.tmp && mv shadow.tmp shadow.c
  sed 's|pgsql/\(libpq-fe.h\)|\1|' < group.c > group.tmp && mv group.tmp group.c
  
  make
}

package() {
  cd $srcdir/${_pkgname}-$pkgver

  mkdir -p $pkgdir/{lib,etc}
  mkdir -p $pkgdir/usr/{bin,share/${pkgname},share/doc/${pkgname}}

  cp crypt $pkgdir/usr/bin/
  cp libnss_pgsql.so.2 $pkgdir/lib/
  cp sampleschema $pkgdir/usr/share/${pkgname}/

  install -m 664 nss-pgsql.conf $pkgdir/etc/
  install -m 660 nss-pgsql-root.conf $pkgdir/etc/

  cp INSTALL README README.crypt $pkgdir/usr/share/doc/${pkgname}/
}

# vim:set ts=2 sw=2 et:

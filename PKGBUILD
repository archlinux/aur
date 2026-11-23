# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: DJ Lucas <dj at linuxfromscratch dot org>
# Contributor: Steven Hiscocks <steven at hiscocks dot me dot uk>
# Contributor: Andre Wayand <aur-sope at awayand dot sleepmail dot com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sope
pkgver=5.12.14
pkgrel=1
pkgdesc="Application server and libraries of SOGo, the groupware server"
arch=(x86_64 aarch64)
url="https://github.com/Alinto/$pkgname"
license=(LGPL-2.0-or-later)
# The client libraries of the database adaptors (GDLAdaptors-4.9) and of LDAP are linked, so they're
# needed even when SOGo uses only one of them
depends=(
  glibc
  libgcc
  libobjc
  gnustep-base
  libldap
  libxml2
  mariadb-libs
  openssl
  postgresql-libs
  zlib
)
makedepends=(gcc-objc gnustep-make)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/SOPE-$pkgver.tar.gz")
sha512sums=('734603bce3c63eeecf028419925a7e3baeab55392599ad6437dc04b97c2bb34a1ee6e6f44238bf203324d247119b88a194b11c508dd10fb884696eb96566c18f')
b2sums=('4f209f54a54e8a2fc839e53dfd91586e5e98993c77b3c5cb68236a21ad87bf29d56df5cc9a0d53f83ecf054c3a13b82a2dba9343053329276f5bbed45d9a4b1d')

build() {
  cd "$pkgname-SOPE-$pkgver" || exit
  # Not autoconf, but a script of its own: no CFLAGS or prefix, it takes them from gnustep-make.
  # - SSL with OpenSSL, which verifies certificates against the system's trust store; with GnuTLS,
  #   SOPE would need the path of a CA bundle (--ca-bundle)
  # - the XML parser, and the adaptors for MySQL/MariaDB, PostgreSQL and LDAP are built when their
  #   libraries are found; enabled here, so a missing one fails the build instead of leaving it out
  # - not a debug build, which the script makes by default: debug=yes means -O0 (general.make) and
  #   -DDEBUG for extra log output (gnustep-make), not debug symbols, which general.make always adds
  # - not stripped, as makepkg strips and splits off the debug symbols
  ./configure --with-gnustep --disable-strip --disable-debug --with-ssl=ssl \
    --enable-xml --enable-mysql --enable-postgresql --enable-openldap
  make
}

package() {
  cd "$pkgname-SOPE-$pkgver" || exit
  make install DESTDIR="$pkgdir"
}

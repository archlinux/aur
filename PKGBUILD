# Maintainer: Deon Spengler <deon@spengler.co.za>
# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# Contributor: DJ Lucas <dj_AT_linuxfromscratch_DOT_org>
# Contributor: Steven Hiscocks <steven [at] hiscocks [dot] me [dot] uk>
# Contributor: Andre Wayand <aur-sope@awayand.sleepmail.com>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

pkgname=sope
pkgver=5.12.13
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
sha512sums=('fbd065abade5a928f648e0079ff536c7c2b8a06669ce86b4228256448113bcbfdb56fbec6342ef1a67cf4443732348a49d87a87332a960588bc0cba6020a3b4b')
b2sums=('f5a64d74543182ca4a30e88660b7c2297b91ca6519b94638cece8166dfcf3e5f1c1451299ed7877f2da9d3f3bf34d07a8f7a2d14c1e148b7c4fc834c931601c3')

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

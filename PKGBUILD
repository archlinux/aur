# Maintainer: Mark Weiman <mark.weiman@markzz.com>
# Contributor: Johannes Dewender  arch at JonnyJD dot net

pkgname=apt
pkgver=1.2.10
pkgrel=1
pkgdesc="commandline package manager"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/apt"
license=('GPL2')
depends=('gnupg' 'curl' 'xz')
makedepends=('dpkg' 'docbook-xsl' 'po4a' 'gtest' 'dash')
checkdepends=()
optdepends=()
provides=('libapt-inst' 'libapt-pkg' 'libapt-pkg-dev' "apt-utils")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://ftp.debian.org/debian/pool/main/a/$pkgname/${pkgname}_$pkgver.tar.xz)
sha256sums=('5c08901d487ee386bbbd0c119808ddfe39a8ec90e33b3cf6763063c35418817a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # this only copies config.{guess,sub} and displays errors
  automake --add-missing --no-force -W none 2> /dev/null || true
  _stylesheet=`ls -d /usr/share/xml/docbook/xsl-stylesheets-* | xargs basename`
  sed -i -e "s|stylesheet/nwalsh|$_stylesheet|" doc/manpage-style.xsl
  # disable debiandoc, this saves us from sgml problems
  sed -i -e 's|-C doc $@|-C doc manpages|' Makefile
  # bash 4.3.33 seems to have problems, use dash instead (sh symlink in Debian)
  sed -i -e 's|#!/bin/sh|#!/bin/dash|' configure
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr/bin
  # apt
  for file in {cache,cdrom,config,get,key,mark}; do
    install bin/apt-$file $pkgdir/usr/bin/
  done
  # apt-utils
  for file in {extracttemplates,ftparchive,sortpkgs}; do
    install bin/apt-$file $pkgdir/usr/bin/
  done

  mkdir -p $pkgdir/usr/lib
  libdir=$pkgdir/usr/lib
  # libapt-inst
  install bin/libapt-inst.so.2.0 $libdir/
  ln -s -r $libdir/libapt-inst.so.2.0 $libdir/libapt-inst.so.2.0.0
  ln -s -r $libdir/libapt-inst.so.2.0 $libdir/libapt-inst.so
  # libapt-pkg
  install bin/libapt-pkg.so.5.0 $libdir/
  ln -s -r $libdir/libapt-pkg.so.5.0 $libdir/libapt-pkg.so.5.0.0
  ln -s -r $libdir/libapt-pkg.so.5.0 $libdir/libapt-pkg.so
  # libapt-private
  install bin/libapt-private.so.0.0.0 $libdir/
  ln -s -r $libdir/libapt-private.so.0.0.0 $libdir/libapt-private.so.0.0
  ln -s -r $libdir/libapt-private.so.0.0.0 $libdir/libapt-private.so
  # apt-utils
  mkdir -p $pkgdir/usr/lib/apt/solvers
  install bin/apt-internal-solver $pkgdir/usr/lib/apt/solvers/apt
  install bin/apt-dump-solver $pkgdir/usr/lib/apt/solvers/dump
  # apt
  mkdir -p $pkgdir/usr/lib/apt/methods
  install bin/methods/* $pkgdir/usr/lib/apt/methods/
  mkdir -p $pkgdir/usr/lib/dpkg/methods/apt/
  install dselect/{install,setup,update} $pkgdir/usr/lib/dpkg/methods/apt/
  install -m 644 dselect/{desc.apt,names} $pkgdir/usr/lib/dpkg/methods/apt/

  # ALL manpages
  mkdir -p $pkgdir/usr/share/man
  for part in {1,5,8}; do
    for lang in {de,en,es,fr,it,ja,pl,pt}; do
      mkdir -p $pkgdir/usr/share/man/$lang/man$part
      gzip -f doc/$lang/*.$part || true
      install -m 644 doc/$lang/*.$part.gz $pkgdir/usr/share/man/$lang/man$part/\
                                                                        || true
    done
  done

  # ALL example configs
  mkdir -p $pkgdir/usr/share/doc/apt/examples
  install -m 644 doc/examples/* $pkgdir/usr/share/doc/apt/examples

  # ALL locales
  mkdir -p $pkgdir/usr/share/locale
  for lang in locale/*; do
    mkdir -p $pkgdir/usr/share/$lang/LC_MESSAGES
    install -m 644 $lang/LC_MESSAGES/* $pkgdir/usr/share/$lang/LC_MESSAGES/
  done

  # libapt-pkg-dev
  mkdir -p $pkgdir/usr/include/apt-pkg
  install -m 644 include/apt-pkg/* $pkgdir/usr/include/apt-pkg/
  # libapt-private-dev
  mkdir -p $pkgdir/usr/include/apt-private
  install -m 644 include/apt-private/* $pkgdir/usr/include/apt-private/
}

# vim:set ts=2 sw=2 et:

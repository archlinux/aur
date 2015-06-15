#! /bin/bash
# Maintainer: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Lucky <aur.archlinux.org [at] lucky.take0ver [dot] net>
# Contributor: Jonny Gerold <jonny@fsk141.com>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Vitaliy Berdinskikh <skipper13@root.ua>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>

pkgname=xmlrpc-c-svn
_pkgname=${pkgname%-*}
pkgver=2450
pkgrel=1
pkgdesc="This library provides a modular implementation of XML-RPC for C and C++"
url="http://xmlrpc-c.sourceforge.net"
license=("custom:xmlrpc-c")
arch=("i686" "x86_64")
depends=("curl" "libxml2")
makedepends=("subversion")
options=("!makeflags" "!libtool")
conflicts=("${_pkgname}")
provides=("${_pkgname}")

_svnmod="${_pkgname}"
_svntrunk="https://${_pkgname}.svn.sourceforge.net/svnroot/${_pkgname}/trunk"

build() {
  cd ${srcdir}

  msg "Connecting to SVN server..."
  if [ -d "${_svnmod}" ]; then
    (cd "${_svnmod}" && svn update -r "${pkgver}")
    msg "The local repository was updated."
  else
    svn co "${_svntrunk}" "${_svnmod}" -r "${pkgver}"
  fi
  msg "SVN checkout done or server timeout."
  cd "${srcdir}"
  if [ -d "${_svnmod}-build" ]; then
    rm -rf "${_svnmod}-build"
  fi
  cp -rf "${_svnmod}" "${_svnmod}-build"
  cd "${_svnmod}-build"
  

  [ "${CARCH}" = "x86_64" ] && export CFLAGS="${CFLAGS} -fPIC"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-libxml2-backend \
              --disable-cgi-server \
              --disable-abyss-server \
              --disable-libwww-client \
              --disable-wininet-client

  make CFLAGS_PERSONAL=${CFLAGS}
}  

package() {  
  cd "$srcdir/$_svnmod-build"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:

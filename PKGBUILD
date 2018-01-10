# Maintainer: Christophe Robin <crobin at nekoo a-dot com>

pkgname=couchbase4-server-community
_pkgname=couchbase-server-community
pkgver=4.5.1
pkgrel=2
pkgdesc="A document database featuring a powerful query language and unrivaled performance at scale."
arch=('x86_64')
url="http://www.couchbase.com/"
source=(
  "${pkgname}-v${pkgver}.deb::http://packages.couchbase.com/releases/${pkgver}/${_pkgname}_${pkgver}-ubuntu14.04_amd64.deb"
  "couchbase-server.service"
)
install=couchbase-server.install
depends=(glibc gcc-libs sqlite openssl zlib python2 openssl-1.0 ncurses5-compat-libs)
conflicts=(couchbase3-server-community couchbase-server-community)

package() {
  msg2 "Extracting the data.tar.gz file"
  tar -xf data.tar.xz -C "${pkgdir}/"

  # fix python binaries
  msg2 "Fixing couchbase binaries to use python2"
  grep -lrnz '^#!/usr/bin/env python' "${pkgdir}/opt/couchbase/"{bin,lib/python} | xargs sed -i 's/env python$/env python2/'

  # remove init.d and replace by systemd definition
  msg2 "Installing systemd service file"
  rm -Rf "${pkgdir}/etc"
  install -D couchbase-server.service "${pkgdir}/usr/lib/systemd/system/couchbase-server.service"
}

md5sums=('b15ba0ebdc14f7ed62b8127cebd582ea'
         '5126e004422c1a5b9391602ac9208319')

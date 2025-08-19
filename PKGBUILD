# Co-Maintainer: James Clarke <james@jamesdavidclarke.com>
# Maintainer: Christophe Robin <crobin at nekoo a-dot com>

pkgname=couchbase-server-community
pkgver=6.5.1
pkgrel=1
pkgdesc="A document database featuring a powerful query language and unrivaled performance at scale."
arch=('x86_64')
url="http://www.couchbase.com/"
source=(
  "${pkgname}-v${pkgver}.deb::http://packages.couchbase.com/releases/${pkgver}/${pkgname}_${pkgver}-ubuntu16.04_amd64.deb"
)
install=couchbase-server.install
depends=(glibc gcc-libs sqlite openssl zlib python2)
conflicts=(couchbase3-server-community couchbase4-server-community couchbase5-server-community)

package() {
  msg2 "Extracting the data.tar.gz file"
  tar -xf data.tar.xz -C "${pkgdir}/"

  # fix python binaries
  msg2 "Fixing couchbase binaries to use python2"
  grep -lrnz '^#!/usr/bin/env python' "${pkgdir}/opt/couchbase/"{bin,lib/python} | xargs sed -i 's/env python$/env python2/'

  # remove init.d and replace by systemd definition
  msg2 "Installing systemd service file"
  rm -Rf "${pkgdir}/etc"
  mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
}

sha256sums=('baf65fb9cbcec87783d4e9c3ec067143a42cdeef13a884e1f917e8d2f14044b7')

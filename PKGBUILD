# -*- mode: shell-script -*-
pkgbase=libnetceiver
pkgname=($pkgbase $pkgbase-tools)
pkgver=0.0.6
pkgrel=2
pkgdesc='Library and tools to access the REEL NetCeiver'
url='https://github.com/vdr-projects/libnetceiver'
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('LGPL2.1')
makedepends=('libxml2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vdr-projects/libnetceiver/archive/refs/tags/$pkgver.tar.gz"
        "$pkgname-tnftp-autodetect.patch::https://patch-diff.githubusercontent.com/raw/vdr-projects/libnetceiver/pull/2.patch")
sha256sums=('0e4c94356455e3f285ac477d6133c256d5c4118b0f5f0a542db333c7ad5d3770'
            'c931848467b3081db9abe8d94c79d6c7931ad89500c0b90c714f16288d3f560f')

prepare() {
  cd "${srcdir}/$pkgbase-$pkgver"
  sed '/^diff --git a\/README.md/,/^From/d' "$srcdir/$pkgname-tnftp-autodetect.patch" | patch -p1
}

build() {
  cd "${srcdir}/$pkgbase-$pkgver"
  make
}

package_libnetceiver() {
  pkgdesc='NetCeiver client protocol library'
  optdepends=('libnetceiver-tools: Tools to maintain a netceiver')
  depends=('libxml2')
  replaces=('libmcli')
  provides=('libmcli')
  conflicts=('libmcli')

  cd "${srcdir}/$pkgbase-$pkgver/lib"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

package_libnetceiver-tools() {
  pkgdesc='NetCeiver client protocol library tools'
  depends=('libnetceiver' 'glibc' 'tnftp6')

  cd "${srcdir}/$pkgbase-$pkgver/tools"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install
}

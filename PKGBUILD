# Maintainer: Simon Désaulniers <rostydela@gmail.com>
pkgname='dpaste'
pkgver=20170712
pkgrel=1
pkgdesc="A simple pastebin for light values (max 64KB) using OpenDHT distributed hash table."
arch=('x86_64')
license=('GPL3')
url='https://github.com/sim590/dpaste'
source=('git://github.com/sim590/dpaste')
depends=('gnutls' 'libb64' 'libcurlpp>=0.8.1' 'opendht-git' 'glibmm')
makedepends=('git' 'nlohmann_json-git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/dpaste"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare () {
  cd "${srcdir}/dpaste"
  git apply "${startdir}/include_dir.patch"
}

build() {
  cd "${srcdir}/dpaste"
  ./autogen.sh
  ./configure --disable-debug
  make
}

package() {
  cd "${srcdir}/dpaste"
  _man_dest=${pkgdir}/usr/share/man/man1/dpaste.1
  install -Dpvm 644 doc/dpaste.1 ${_man_dest}
  gzip ${_man_dest}

  install -Dpv src/dpaste ${pkgdir}/usr/bin/dpaste
}
# vim: ts=2 sw=2 et:

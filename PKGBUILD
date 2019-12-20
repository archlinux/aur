# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=huzheng001
_pkgname=stardict-3
_basever=3.0.6
pkgname=stardict-tools-git
pkgver=3.0.6.r661.8c5c269
pkgrel=1
pkgdesc='Stardict tools'
arch=('i686' 'x86_64')
url='http://www.huzheng.org/stardict/'
license=('GPLv3')
depends=('gtk3' 'glib2' 'libmariadbclient')
makedepends=('git' 'intltool')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}::git://github.com/${_orgname}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}

  count="$(git rev-list --count HEAD)"
  head="$(git rev-parse --short HEAD)"

  printf "%s.r%s.%s" "${_basever}" "${count}" "${head}"
}

prepare() {
  cd ${_pkgname}/tools/src

  sed -i 's/noinst_PROGRAMS =/bin_PROGRAMS =/' Makefile.am
  sed -i 's/MYSQL_PORT/0/' wikipediaImage.cpp
}

build() {
  cd ${_pkgname}

  ./autogen.sh
  ./configure --prefix=/usr --disable-dict
  make
}

package() {
  cd ${_pkgname}

  make DESTDIR=$pkgdir/ install
  find $pkgdir/usr/bin/ -not -name 'stardict-*' -type f | \
    sed 'p;s#bin/#bin/stardict-#' | xargs -n2 mv
}

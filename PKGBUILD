# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=huzheng001
_pkgname=stardict-3
_basever=3.0.6
pkgname=stardict-tools-git
pkgver=3.0.6.r653.c00d1e9
pkgrel=2
pkgdesc='Stardict tools'
arch=('i686' 'x86_64')
url='http://stardict.org/'
license=('GPLv3')
depends=('gtk3' 'glib2' 'libmariadbclient')
makedepends=('intltool')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
source=("${_pkgname}::git://github.com/${_orgname}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  REVISION="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s.r%s" "${_basever}" "${REVISION}"
}

build() {
  cd ${srcdir}/${_pkgname}

  ./autogen.sh
  ./configure --prefix=/usr --disable-dict
  sed -i 's/noinst_PROGRAMS =/bin_PROGRAMS =/' tools/src/Makefile
  make
}

package() {
  cd ${srcdir}/${_pkgname}

  make DESTDIR=$pkgdir/ install
  find $pkgdir/usr/bin/ -not -name 'stardict-*' -type f | sed 'p;s#usr/bin/#usr/bin/stardict-#' | xargs -n2 mv
}

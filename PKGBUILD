# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.9
pkgrel=3
pkgdesc='XML parsing library, version 2'
url='http://www.xmlsoft.org/'
arch=(x86_64)
license=(MIT)
depends=(zlib readline ncurses xz icu)
makedepends=(python2 python git)
_commit=f8a8c1f59db355b46962577e7b74f1a1e8149dc6  # tags/v2.9.9^0
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
        libxml2-2.9.8-python3-unicode-errors.patch
        https://www.w3.org/XML/Test/xmlts20130923.tar.gz)
sha256sums=('SKIP'
            '37eb81a8ec6929eed1514e891bff2dd05b450bcf0c712153880c485b7366c17c'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f')

pkgver() {
  cd $pkgname
  git describe --always --tags | sed 's/-rc/rc/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir build-py{2,3}
  cd $pkgname

  # From https://src.fedoraproject.org/rpms/libxml2/tree/master
  patch -Np1 -i ../libxml2-2.9.8-python3-unicode-errors.patch

  NOCONFIGURE=1 ./autogen.sh
}

_build() (
  cd build-py$1
  ../$pkgname/configure \
    --prefix=/usr \
    --with-threads \
    --with-history \
    --with-python=/usr/bin/python$1 \
    --with-icu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  PYTHONHASHSEED=0 make
  find doc -type f -exec chmod 0644 {} +
)

build() {
  _build 2
  _build 3
}

check() {
  cd build-py2
  ln -s ../xmlconf
  make check
}

package() {
  make -C build-py2 DESTDIR="$pkgdir" install
  make -C build-py3/python DESTDIR="$pkgdir" install
  install -Dm 644 build-py2/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim: ts=2 sw=2 et:

# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.14
pkgrel=1
pkgdesc='XML parsing library, version 2'
url='http://www.xmlsoft.org/'
arch=(x86_64)
license=(MIT)
depends=(zlib readline ncurses xz icu)
makedepends=(python git)
optdepends=('python: Python bindings')
provides=(libxml2.so)
options=(debug)
_commit=7846b0a677f8d3ce72486125fa281e92ac9970e8  # tags/v2.9.14^0
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
        libxml2-2.9.8-python3-unicode-errors.patch
        no-fuzz.diff
        https://www.w3.org/XML/Test/xmlts20130923.tar.gz)
sha256sums=('SKIP'
            'd331748e504e69603dac9c57f7b110a98a4bd4cb87e63d0c1bbcd71ec3635383'
            '3fc010d8c42b93e6d6f1fca6b598a561e9d2c8780ff3ca0c76a31efabaea404f'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f')

pkgver() {
  cd libxml2
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir build

  # Use xmlconf from conformance test suite
  ln -s xmlconf build/xmlconf

  cd libxml2

  # https://src.fedoraproject.org/rpms/libxml2/tree/rawhide
  git apply -3 ../libxml2-2.9.8-python3-unicode-errors.patch

  # Do not run fuzzing tests
  git apply -3 ../no-fuzz.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd build

  ../libxml2/configure \
    --prefix=/usr \
    --with-threads \
    --with-history \
    --with-python=/usr/bin/python \
    --with-icu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make

  find doc -type f -exec chmod -c 0644 {} +
}

check() {
  make -C build check
}

package() {
  make -C build DESTDIR="$pkgdir" install

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"

  install -Dm 644 build/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 et:

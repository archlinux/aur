# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.8
pkgrel=5
pkgdesc="XML parsing library, version 2"
url="http://www.xmlsoft.org/"
arch=(x86_64)
license=(MIT)
depends=(zlib readline ncurses xz icu)
makedepends=(python2 python git)
_commit=18890f471c420411aa3c989e104d090966ec9dbf  # tags/v2.9.8^0
source=(git+https://git.gnome.org/browse/libxml2#commit=$_commit
        https://www.w3.org/XML/Test/xmlts20130923.tar.gz
        CVE-2018-9251.patch::https://gitlab.gnome.org/GNOME/libxml2/commit/2240fbf5912054af025fb6e01e26375100275e74.patch)
sha256sums=('SKIP'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f'
            'd534592b690798ea0eb8ff9b9e1b6ea82d9e3761f7717bbdf277c68ee73271cb')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/-/+/g'
}

prepare() {
  mkdir build-py{2,3}

  cd $pkgname
  patch -Np1 -i ${srcdir}/CVE-2018-9251.patch

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
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 build-py2/COPYING
}

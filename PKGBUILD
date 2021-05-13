# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.11
pkgrel=1
pkgdesc='XML parsing library, version 2'
url='http://www.xmlsoft.org/'
arch=(x86_64)
license=(MIT)
depends=(zlib readline ncurses xz icu)
makedepends=(python2 python git)
_commit=e1bcffea180d6cc0651757bb64284a763e0e2239  # tags/v2.9.11^0
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
        libxml2-2.9.8-python3-unicode-errors.patch
        https://www.w3.org/XML/Test/xmlts20130923.tar.gz)
sha256sums=('SKIP'
            '37eb81a8ec6929eed1514e891bff2dd05b450bcf0c712153880c485b7366c17c'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir build-py{2,3}
  cd $pkgname

  # Take patches from https://src.fedoraproject.org/rpms/libxml2/tree/master
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  sed -e '/cd fuzz; /d' -e 's/fuzz //g' -i Makefile.am
  autoreconf -fiv
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
  cd build-py3
  ln -s ../xmlconf
  make check
}

package() {
  make -C build-py2 DESTDIR="$pkgdir" install
  make -C build-py3/python DESTDIR="$pkgdir" install
  install -Dm 644 build-py2/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
  
  #Disabled for now, as I don't want to introduce file conflicts during a security update 
  #python2 -m compileall -d /usr/lib/python2.7 "$pkgdir/usr/lib/python2.7"
  #python2 -O -m compileall -d /usr/lib/python2.7 "$pkgdir/usr/lib/python2.7"
  #python -m compileall -d /usr/lib/python3.9 "$pkgdir/usr/lib/python3.9"
  #python -O -m compileall -d /usr/lib/python3.9 "$pkgdir/usr/lib/python3.9" 
}

# vim: ts=2 sw=2 et:

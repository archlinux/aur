# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.10
pkgrel=7
pkgdesc='XML parsing library, version 2'
url='http://www.xmlsoft.org/'
arch=(x86_64)
license=(MIT)
depends=(zlib readline ncurses xz icu)
makedepends=(python2 python git)
_commit=41a34e1f4ffae2ce401600dbb5fe43f8fe402641  # tags/v2.9.10^0
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
        libxml2-2.9.8-python3-unicode-errors.patch
        fix-relaxed-approach-to-nested-documents.patch
        libxml2-2.9.10-CVE-2019-20388.patch
        libxml2-2.9.10-CVE-2020-7595.patch
        libxml2-2.9.10-parenthesize-type-checks.patch
        libxml2-2.9.10-CVE-2020-24977.patch
        libxml2-2.9.10-fix-integer-overflow.patch
        https://www.w3.org/XML/Test/xmlts20130923.tar.gz)
sha256sums=('SKIP'
            '37eb81a8ec6929eed1514e891bff2dd05b450bcf0c712153880c485b7366c17c'
            '50f04807b86a179d051fb86755e82f55ba7aac9d0c005eefea93d2599a911d01'
            'cfe1b3e0f026df6f979dbd77c1dcd1268e60acf3d7a8ff3f480b4e67bfcc19d6'
            'c6105ff40d7b1b140fcd821b5d64ab8c7b596708071c26964727e7352b07ac7e'
            'b63c161e4c8a6f0a65ba091c3d3ed09d3110d21f997ee61077c782b311fd4b33'
            '62eafffc2b4949489c261c63883d27c2e83d688f1d4c899000b283e4c2a682be'
            'fd227780ad5699bebca7ef412d2d50fb1d21a54f6e3fdcad0bda5bdc8f8b2525'
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
  patch -Np1 -i ../fix-relaxed-approach-to-nested-documents.patch
  patch -Np1 -i ../libxml2-2.9.10-CVE-2019-20388.patch
  patch -Np1 -i ../libxml2-2.9.10-CVE-2020-7595.patch
  patch -Np1 -i ../libxml2-2.9.10-parenthesize-type-checks.patch
  patch -Np1 -i ../libxml2-2.9.10-CVE-2020-24977.patch
  patch -Np1 -i ../libxml2-2.9.10-fix-integer-overflow.patch

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
  
  #Disabled for now, as I don't want to introduce file conflicts during a security update 
  #python2 -m compileall -d /usr/lib/python2.7 "$pkgdir/usr/lib/python2.7"
  #python2 -O -m compileall -d /usr/lib/python2.7 "$pkgdir/usr/lib/python2.7"
  #python -m compileall -d /usr/lib/python3.9 "$pkgdir/usr/lib/python3.9"
  #python -O -m compileall -d /usr/lib/python3.9 "$pkgdir/usr/lib/python3.9" 
}

# vim: ts=2 sw=2 et:

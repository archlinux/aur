# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.12
pkgrel=2
pkgdesc='XML parsing library, version 2'
url='http://www.xmlsoft.org/'
arch=(x86_64)
license=(MIT)
depends=(zlib readline ncurses xz icu)
makedepends=(python2 python git)
_commit=b48e77cf4f6fa0792c5f4b639707a2b0675e461b  # tags/v2.9.12^0
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

  # Work around lxml API abuse
  git cherry-pick -n 85b1792e37b131e7a51af98a37f92472e8de5f3f
  # Fix regression in xmlNodeDumpOutputInternal
  git cherry-pick -n 13ad8736d294536da4cbcd70a96b0a2fbf47070c
  # Fix XPath recursion limit
  git cherry-pick -n 3e1aad4fe584747fd7d17cc7b2863a78e2d21a77
  # Fix whitespace when serializing empty HTML documents
  git cherry-pick -n 92d9ab4c28842a09ca2b76d3ff2f933e01b6cd6f

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

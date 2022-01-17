# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=libxml2
pkgver=2.9.12
pkgrel=7
pkgdesc='XML parsing library, version 2'
url='http://www.xmlsoft.org/'
arch=(x86_64)
license=(MIT)
depends=(zlib readline ncurses xz icu)
makedepends=(python git)
provides=(libxml2.so)
_commit=b48e77cf4f6fa0792c5f4b639707a2b0675e461b  # tags/v2.9.12^0
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
        libxml2-2.9.8-python3-unicode-errors.patch
        no-fuzz.patch # Do not run fuzzing tests
        https://www.w3.org/XML/Test/xmlts20130923.tar.gz)
sha256sums=('SKIP'
            '37eb81a8ec6929eed1514e891bff2dd05b450bcf0c712153880c485b7366c17c'
            '163655aba312c237a234a82d64b71a65bd9d1d901e176d443e3e3ac64f3b1b32'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir build

  # Use xmlconf from conformance test suite
  ln -s xmlconf build/xmlconf

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
    git apply -3 "../$src"
  done

  autoreconf -fiv
}

build() (
  cd build

  ../$pkgname/configure \
    --prefix=/usr \
    --with-threads \
    --with-history \
    --with-python=/usr/bin/python \
    --with-icu
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' libtool
  make

  find doc -type f -exec chmod 0644 {} +
)

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

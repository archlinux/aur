# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

_pkgname=libxml2
pkgname=python2-$_pkgname
pkgver=2.9.12
pkgrel=6
pkgdesc='XML parsing library, version 2'
url='http://www.xmlsoft.org/'
arch=(x86_64)
license=(MIT)
depends=(zlib readline ncurses xz icu)
makedepends=(python2 git)
_commit=b48e77cf4f6fa0792c5f4b639707a2b0675e461b  # tags/v2.9.12^0
_w3_tests="https://www.w3.org/XML/Test/xmlts20130923.tar.gz"
source=("${_pkgname}::git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
        no-fuzz.patch # Do not run fuzzing tests
        "${_w3_tests}")
sha256sums=('SKIP'
            '163655aba312c237a234a82d64b71a65bd9d1d901e176d443e3e3ac64f3b1b32'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir build

  # Use xmlconf from conformance test suite
  ln -s xmlconf build/xmlconf

  cd "${_pkgname}"

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

  "../${_pkgname}/configure" \
    --prefix=/usr \
    --with-threads \
    --with-history \
    --with-python=/usr/bin/python2 \
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
  
  python2 -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python2 -O -m compileall -d /usr/lib "$pkgdir/usr/lib" 

  install -Dm 644 build/COPYING -t "$pkgdir/usr/share/licenses/$pkgname"

  rm -rf "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/usr/bin/"
  rm -rf "${pkgdir}/usr/lib/cmake"
  rm -rf "${pkgdir}/usr/lib/libxml2"*
  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/lib/xml2Conf.sh"
  rm -rf "${pkgdir}/usr/share/aclocal"
  rm -rf "${pkgdir}/usr/include/libxml2/libxml"
}

# vim: ts=2 sw=2 et:

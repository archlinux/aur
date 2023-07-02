# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: MarsSeed <marcell.meszaros@runbox.eu>

_pkgname=libxml2
pkgname=python2-$_pkgname
pkgver=2.9.14
pkgrel=1
pkgdesc='XML parsing library, version 2'
url='https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home'
arch=(aarch64 i686 pentium4 x86_64)
license=(MIT)
depends=(python2 $_pkgname zlib readline ncurses xz icu)
makedepends=(git)
_commit=7846b0a677f8d3ce72486125fa281e92ac9970e8  # tags/v2.9.14^0
_w3_tests="https://www.w3.org/XML/Test/xmlts20130923.tar.gz"
source=("${_pkgname}::git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
        no-fuzz.diff # Do not run fuzzing tests
        "${_w3_tests}")
sha256sums=('SKIP'
            '3fc010d8c42b93e6d6f1fca6b598a561e9d2c8780ff3ca0c76a31efabaea404f'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build

  # Use xmlconf from conformance test suite
  ln -s xmlconf build/xmlconf

  cd "${_pkgname}"

  # Take patches from https://src.fedoraproject.org/rpms/libxml2/tree/master
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.diff ]] || continue
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
  rm -rf "${pkgdir}/usr/include/libxml2/libxml"
  rm -rf "${pkgdir}/usr/lib/cmake"
  rm -rf "${pkgdir}/usr/lib/libxml2"*
  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/lib/xml2Conf.sh"
  rm -rf "${pkgdir}/usr/share/aclocal"
  rm -rf "${pkgdir}/usr/share/doc/libxml2"
  rm -rf "${pkgdir}/usr/share/doc/libxml2-python-${pkgver}"
  rm -rf "${pkgdir}/usr/share/gtk-doc/html/libxml2"
  rm -rf "${pkgdir}/usr/share/man/man1"
  rm -rf "${pkgdir}/usr/share/man/man3"
}

# vim: ts=2 sw=2 et:

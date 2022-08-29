# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=libxml2
pkgname=(libxml2 libxml2-docs)
pkgver=2.10.2
pkgrel=1
pkgdesc="XML C parser and toolkit (32-bit)"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(custom:MIT)
depends=(zlib xz icu readline ncurses)
makedepends=(python git)
options=(debug)
_commit=21b24b51608d471bb9f7c4225e23d0db2acecc52  # tags/v2.10.2^0
source=("git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
        libxml2-2.9.8-python3-unicode-errors.patch
        no-fuzz.diff
        https://www.w3.org/XML/Test/xmlts20130923.tar.gz)
sha256sums=('SKIP'
            '3d07a50fc0963bda05fc5269dedc51f108260699e25e455bb31f6d80c2a9cada'
            '3908e7a53b20109bdfde143238f36e22a154dbb7d363b634e54c0a18328f4656'
            '9b61db9f5dbffa545f4b8d78422167083a8568c59bd1129f94138f936cf6fc1f')

pkgver() {
  cd libxml2
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd libxml2

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf

  # https://src.fedoraproject.org/rpms/libxml2/tree/rawhide
  git apply -3 ../libxml2-2.9.8-python3-unicode-errors.patch

  # Do not run fuzzing tests
  git apply -3 ../no-fuzz.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd libxml2

  ./configure \
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
  cd libxml2
  make check
}

package_libxml2() {
  optdepends=('python: Python bindings')
  provides=(libxml2.so)

  cd libxml2

  make DESTDIR="$pkgdir" install

  mkdir -p ../doc/usr/share
  mv "$pkgdir"/usr/share/{doc,gtk-doc} -t ../doc/usr/share

  python -m compileall -d /usr/lib "$pkgdir/usr/lib"
  python -O -m compileall -d /usr/lib "$pkgdir/usr/lib"

  install -Dm644 Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libxml2-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:

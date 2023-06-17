# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: John Proctor <jproctor@prium.net>

pkgbase=libxml2
pkgname=(
  libxml2
  libxml2-docs
)
pkgver=2.10.4
pkgrel=6
pkgdesc="XML C parser and toolkit"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(custom:MIT)
depends=(
  icu
  ncurses
  readline
  xz
  zlib
)
makedepends=(
  git
  python
)
_commit=223cb03a5d27b1b2393b266a8657443d046139d6  # tags/v2.10.4^0
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#commit=$_commit"
  0001-Fix-python3-unicode-errors.patch
  0002-HACK-Don-t-run-fuzzing-tests.patch
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
)
b2sums=('SKIP'
        'ec5a0955906c5fdd4bc65248bdb46f315460f4b2208bf37c49f55ef7468585786bdf563aa3e9357370d4f1ff947a6d4467869eeb2ca6b77ca5e40ffa45213a13'
        'ec247c8caad963307d8f487176fde518cfb087bbff3f10c2a5846b90a04c9909c2f0e6aaf8ded4784f46586eafb16df493caf1debc20ff10014f03b1f1f8241d'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be')

pkgver() {
  cd libxml2
  git describe --tags | sed 's/-rc/rc/;s/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libxml2

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf

  # https://gitlab.gnome.org/GNOME/libxml2/-/issues/64
  git apply -3 ../0001-Fix-python3-unicode-errors.patch

  # Do not run fuzzing tests
  git apply -3 ../0002-HACK-Don-t-run-fuzzing-tests.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --with-history
    --with-icu
    --with-python=/usr/bin/python
    --with-threads
    --disable-static
  )

  cd libxml2

  ./configure "${configure_options[@]}"
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
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

  install -Dm644 Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_libxml2-docs() {
  pkgdesc+=" (documentation)"
  depends=()

  mv doc/* "$pkgdir"

  install -Dm644 libxml2/Copyright -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set sw=2 sts=-1 et:

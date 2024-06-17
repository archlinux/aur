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
pkgver=2.13.0
pkgrel=4
pkgdesc="XML C parser and toolkit"
url="https://gitlab.gnome.org/GNOME/libxml2/-/wikis/home"
arch=(x86_64)
license=(MIT)
depends=(
  bash
  glibc
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
source=(
  "git+https://gitlab.gnome.org/GNOME/libxml2.git#tag=v$pkgver"
  https://www.w3.org/XML/Test/xmlts20130923.tar.gz
  0001-HACK-Don-t-run-fuzzing-tests.patch
)
b2sums=('5373f8063ac8d1515841141f52aa7fb144e0ca1602ccdf9cdaf2ebf6e98f49ef45e62bbfbc828395dde0656281f75bd017d8a96ad7dbd076baf4c046907806e2'
        '63a47bc69278ef510cd0b3779aed729e1b309e30efa0015d28ed051cc03f9dfddb447ab57b07b3393e8f47393d15473b0e199c34cb1f5f746b15ddfaa55670be'
        '151e84ee17051eeecfa8c62a7376ff269860f3ff6d33fb92209ff5f8dc9576a5648bbe9ffc96317695c069760ccfecaa3e6f19fb7a7c2e9f039a146d7fc8a516')

prepare() {
  cd libxml2

  # Use xmlconf from conformance test suite
  ln -s ../xmlconf

  # https://gitlab.gnome.org/GNOME/libxml2/-/issues/732
  git cherry-pick -n 8322eef39d775b1c16a5895a77da53d82653a04e

  # https://gitlab.gnome.org/GNOME/libxml2/-/issues/731
  git cherry-pick -n 9ecabe1c2461dc4aa28a75bb9c889f82e37a5786

  # Fix gambas
  git cherry-pick -n 599ceaffad97faff9e77a3237d319f18cdc2984a

  # https://gitlab.gnome.org/GNOME/libxml2/-/issues/733
  # https://github.com/systemd/systemd/issues/33302
  git cherry-pick -n aa90cb0c578bd189089cd1fe195faf85040ac98b \
                     c04d9b1b87eaf5c12f70173762f8c81c34e59aeb \
                     1ff484339e98b9adc992478f2786c3db174c8a32 \
                     3c7c831c7c10ee3b68a039da138abf38ec4ab994

  # Do not run fuzzing tests
  git apply -3 ../0001-HACK-Don-t-run-fuzzing-tests.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  local configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --localstatedir=/var
    --disable-static
    --with-history
    --with-icu
    --with-legacy
    --with-python=/usr/bin/python
    --with-threads
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

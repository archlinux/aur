# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgbase=jack
pkgname=(
  jack
  jack-docs
)
pkgver=0.126.0
pkgrel=6
pkgdesc="A low-latency audio server"
arch=(x86_64)
url="https://github.com/jackaudio/jack1"
license=(
  GPL-2.0-or-later
  LGPL-2.1-or-later
)
makedepends=(
  alsa-lib
  db
  celt
  doxygen
  git
  libffado
  libsamplerate
)
source=(
  $pkgbase::git+$url.git?signed#tag=$pkgver
  $pkgbase-headers::git+https://github.com/jackaudio/headers
)
sha512sums=('2a5886c321466487edd8610686c9ac66f943ad55a69451bfe71f609366fc3fb9497986d3c6b1a6d96e23b9b39af70e4236ed23c7f04044ed0178f743fde19ed2'
            'SKIP')
b2sums=('b9c8c54a220e68f5dbc2565d4ca4114a077089bb2eb612b76b9ab22ef45c8db3247c97f721c1eb68005d5c168524917482fcb19dd76209b92a81d71d312e55af'
        'SKIP')
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0') # falkTX <falktx@falktx.com>

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.jack.url "$srcdir/$pkgbase-headers"
  git -c protocol.file.allow=always submodule update

  autoreconf -fiv
}

build() {
  local configure_options=(
    --prefix=/usr
    --libdir=/usr/lib
    --with-html-dir=/usr/share/doc/jack
  )

  # Fix issue with pointer cast: https://github.com/jackaudio/jack1/issues/59
  CFLAGS+=" -Wno-int-conversion"

  cd $pkgbase
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_jack() {
  depends=(
    alsa-lib libasound.so
    db
    glibc
    libsamplerate libsamplerate.so
  )
  optdepends=(
    'celt: NetJACK driver'
    'jack-docs: for developer documentation'
    'jack-example-tools: for official JACK example-clients and tools'
    'libffado: FireWire support'
    'realtime-privileges: Acquire realtime privileges'
  )
  conflicts=(
    jack2
    pipewire-jack
  )
  provides=(
    libjack.so
    libjackserver.so
  )

  make DESTDIR="$pkgdir" install -C $pkgbase
  install -vDm 644 $pkgbase/{AUTHORS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"

  (
    cd $pkgdir
    _pick jack-docs usr/share/doc/$pkgbase/reference
  )
}

package_jack-docs() {
  pkgdesc+=" - developer documentation"
  mv -v jack-docs/* "$pkgdir"
}
# vim:set ts=2 sw=2 et:

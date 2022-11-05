# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgbase=jack
pkgname=(jack jack-docs)
pkgver=0.126.0
_commit=1c7c1bada449fbfb876c952882351162e5455540  # refs/tags/0.126.0
pkgrel=5
pkgdesc="A low-latency audio server"
arch=(x86_64)
url="http://jackaudio.org/"
license=(GPL LGPL)
makedepends=(alsa-lib db celt doxygen git libffado libsamplerate)
source=(
  $pkgbase::git+https://github.com/jackaudio/${pkgname}1.git#tag=$_commit?signed
  git+https://github.com/jackaudio/headers
)
sha512sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
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
  git config submodule.jack.url "$srcdir/headers"
  git -c protocol.file.allow=always submodule update

  autoreconf -fiv
}

build() {
  local configure_options=(
  --prefix=/usr
  --libdir=/usr/lib
  --with-html-dir=/usr/share/doc/jack
  )

  cd $pkgbase
  ./configure "${configure_options[@]}"
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_jack() {
  depends=(db gcc-libs glibc libasound.so libsamplerate.so)
  optdepends=(
    'celt: NetJACK driver'
    'jack-docs: for developer documentation'
    'jack-example-tools: for official JACK example-clients and tools'
    'libffado: FireWire support'
    'realtime-privileges: Acquire realtime privileges'
  )
  conflicts=(jack2 pipewire-jack)
  provides=(libjack.so libjackserver.so)

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

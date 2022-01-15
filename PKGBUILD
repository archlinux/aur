# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgbase=jack
pkgname=(jack jack-docs)
pkgver=0.126.0
pkgrel=1
pkgdesc="A low-latency audio server"
arch=(x86_64)
url="http://jackaudio.org/"
license=(GPL LGPL)
makedepends=(alsa-lib db celt doxygen git libffado libsamplerate libsndfile
readline zita-alsa-pcmi zita-resampler)
source=(
  "$pkgname::git+https://github.com/jackaudio/${pkgname}1.git#tag=${pkgver}?signed"
  "git+https://github.com/jackaudio/headers"
)
sha512sums=('SKIP'
            'SKIP')
b2sums=('SKIP'
        'SKIP')
validpgpkeys=('62B11043D2F6EB6672D93103CDBAA37ABC74FBA0') # falkTX <falktx@falktx.com>

prepare() {
  mv -v "${pkgname}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  git submodule init
  git config submodule.jack.url "${srcdir}/headers"
  git submodule update

  autoreconf -fiv
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --libdir=/usr/lib \
              --with-html-dir=/usr/share/doc/jack
  # prevent excessive overlinking due to libtool
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_jack() {
  depends=(db gcc-libs glibc libasound.so libreadline.so libsndfile.so
  libsamplerate.so libzita-alsa-pcmi.so libzita-resampler.so)
  optdepends=(
    'celt: NetJACK driver'
    'jack-docs: for documentation'
    'jack-example-tools: for official JACK example-clients and tools'
    'libffado: FireWire support'
    'realtime-privileges: Acquire realtime privileges'
  )
  conflicts=(jack2)
  provides=(jack2 libjack.so libjackserver.so)
  replaces=(jack2)

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
  # remove documentation
  rm -rf "${pkgdir}/usr/share/doc/${pkgname}/reference"
}

package_jack-docs() {
  cd "${pkgbase}-${pkgver}"
  make DESTDIR="$pkgdir" install

  # remove everything provided by jack
  rm -rf "${pkgdir}/usr/"{bin,include,lib,share/man}
}
# vim:set ts=2 sw=2 et:

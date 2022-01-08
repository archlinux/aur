# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgbase=jack
pkgname=(jack jack-docs)
pkgver=0.125.0
pkgrel=13
pkgdesc="A low-latency audio server"
arch=(x86_64)
url="http://jackaudio.org/"
license=(GPL LGPL)
makedepends=(alsa-lib db celt doxygen git libffado libsamplerate libsndfile
readline zita-alsa-pcmi zita-resampler)
source=(
  "$pkgname::git+https://github.com/jackaudio/${pkgname}1.git#tag=${pkgver}"
  "git+https://github.com/jackaudio/example-clients"
  "git+https://github.com/jackaudio/headers"
  "git+https://github.com/jackaudio/tools"
  "${pkgname}-0.125.0-headers.patch::https://github.com/jackaudio/jack1/pull/111.patch"
  "${pkgname}-0.125.0-pkgconf.patch::https://github.com/jackaudio/jack1/pull/114.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '56a6f966df0950e5b8b0366721edb17fea96438abf3807115b9f1c3659858d8d5cb0759b4bedbc69f4460a238700be76b98c1628554f4c6e73b65b96de994250'
            'd951199dbaa6de773509b49f78a05da139f49194c6b43ff5d08a658f079a71af0929a6b259ad3e98017068d0b785f5313c6068d0c9693d6d3a17276817970c40')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'd7caa45c5e926e66065a3c4578b73d369fc738a01092999ce79c1c14453cb3c387d49a6b9f2c9189c4e47b3a643270f1e77f10f1ba6bdfe056683b8e788786ad'
        '60ca4dfa76b837bf09b213fc0bf935fbf049c9fa3017b354ff341d22dcc74545e6df6bc4da85892812696ccc84f9b7e8e57735c477e329efee6e13127f6dcbfd')

prepare() {
  mv -v "${pkgname}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  git submodule init
  git config submodule.example-clients.url "${srcdir}/example-clients"
  git config submodule.jack.url "${srcdir}/headers"
  git config submodule.tools.url "${srcdir}/tools"
  git submodule update

  (
    cd jack
    # use more up-to-date headers so that we can have systemdeps.h
    # https://github.com/jackaudio/headers/pull/11
    # this also fixes issues with type casting for jslist:
    # https://github.com/jackaudio/jack1/issues/108
    git checkout 4e53c8f0a33e9ed87eac5ca6e578b7ee92a1fd3d
  )

  # make sure to install all header files:
  # https://github.com/jackaudio/jack1/pull/111
  patch -Np1 -i ../"${pkgname}-0.125.0-headers.patch"
  # expose implementation in pkgconfig variable
  # https://github.com/jackaudio/jack1/pull/114
  patch -Np1 -i ../"${pkgname}-0.125.0-pkgconf.patch"

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
  depends=(db gcc-libs glibc libasound.so libreadline.so
  libsndfile.so libsamplerate.so libzita-alsa-pcmi.so
  libzita-resampler.so)
  optdepends=(
    'celt: NetJACK driver'
    'jack-docs: for documentation'
    'libffado: FireWire support'
    'realtime-privileges: Acquire realtime privileges'
  )
  conflicts=(jack2)
  provides=(jack2 libjack.so libjackserver.so)
  replaces=(jack2)

  cd "${pkgbase}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,README} -t "${pkgdir}/usr/share/doc/${pkgname}"
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

# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgbase=jack
pkgname=(jack jack-docs)
pkgver=0.125.0
pkgrel=11
pkgdesc="A low-latency audio server"
arch=('x86_64')
license=('GPL' 'LGPL')
url="http://jackaudio.org/"
makedepends=('alsa-lib' 'db' 'celt' 'doxygen' 'git' 'libffado' 'libsamplerate'
'libsndfile' 'readline' 'zita-alsa-pcmi' 'zita-resampler')
source=(
  "$pkgname::git+https://github.com/jackaudio/${pkgname}1.git#tag=${pkgver}"
  "git+https://github.com/jackaudio/example-clients"
  "git+https://github.com/jackaudio/headers"
  "git+https://github.com/jackaudio/tools"
  "${pkgname}-0.125.0-headers_cast.patch::https://github.com/jackaudio/headers/commit/018f44fcdbee86747fc96712e2da2b32e76d81a6.patch"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '2134c949b2782c231eeeba46dba4e7d61526ab560ae57841ebf2139223df3df1571b7e0fc9fc7c581d42f0b7ac6821deb567b80c3f3a2d95df8fcbec70a70ca5')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'f12264b77f5b0c4bec1c577f5082cbeed629205bb022ec5698cfccdbde2c01717dbdb91bb022ffef9619f89ff4b72e0e07aa545bd8f5ffb86211bdebb0c0cd28')

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
  # fix issue with type casting for jslist: https://github.com/jackaudio/jack1/issues/108
  patch -Np1 -i ../../"${pkgname}-0.125.0-headers_cast.patch"
  )

  autoreconf -vfi
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
  depends=('db' 'gcc-libs' 'glibc' 'libasound.so' 'libreadline.so'
  'libsndfile.so' 'libsamplerate.so' 'libzita-alsa-pcmi.so'
  'libzita-resampler.so')
  optdepends=('celt: NetJACK driver'
              'jack-docs: for documentation'
              'libffado: FireWire support'
              'realtime-privileges: Acquire realtime privileges')
  conflicts=('jack2')
  provides=('jack2' 'libjack.so' 'libjackserver.so')
  replaces=('jack2')

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

# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=jack
pkgver=0.125.0
pkgrel=10
pkgdesc="A low-latency audio server"
arch=('x86_64')
license=('GPL' 'LGPL')
url="http://jackaudio.org/"
depends=('db' 'gcc-libs' 'glibc')
makedepends=('alsa-lib' 'celt' 'doxygen' 'git' 'libffado' 'libsamplerate'
'libsndfile' 'readline' 'zita-alsa-pcmi' 'zita-resampler')
optdepends=('celt: NetJACK driver'
            'libffado: FireWire support'
            'realtime-privileges: Acquire realtime privileges')
conflicts=('jack2')
provides=('jack2' 'libjack.so' 'libjackserver.so')
replaces=('jack2')
source=("$pkgname::git+https://github.com/jackaudio/${pkgname}1.git#tag=${pkgver}"
        "git+https://github.com/jackaudio/example-clients"
        "git+https://github.com/jackaudio/headers"
        "git+https://github.com/jackaudio/tools")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

prepare() {
  mv -v "${pkgname}" "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  git submodule init
  git config submodule.example-clients.url "${srcdir}/example-clients"
  git config submodule.jack.url "${srcdir}/headers"
  git config submodule.tools.url "${srcdir}/tools"
  git submodule update
  autoreconf -vfi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --libdir=/usr/lib
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  depends+=('libasound.so' 'libreadline.so' 'libsndfile.so' 'libsamplerate.so'
  'libzita-alsa-pcmi.so' 'libzita-resampler.so')
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,README} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:

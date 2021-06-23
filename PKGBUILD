# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: tobias <tobias@archlinux.net>
# Contributor: Robert Emil Berge <robert@rebi.no>

pkgname=jack-git
pkgver=0.125.0rc1.64.gb040837
pkgrel=1
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
provides=('libjack.so' 'libjackserver.so' 'jack')
conflicts=('jack' 'jack2')

source=("$pkgname::git+https://github.com/jackaudio/jack1.git"
        "git+https://github.com/jackaudio/example-clients"
        "git+https://github.com/jackaudio/headers"
        "git+https://github.com/jackaudio/tools")
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --always | sed 's|-|.|g'
}

prepare()
{
  cd "$pkgname"
  git submodule init
  git config submodule.example-clients.url "${srcdir}/example-clients"
  git config submodule.jack.url "${srcdir}/headers"
  git config submodule.tools.url "${srcdir}/tools"
  git submodule update
  autoreconf -vfi
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr \
              --libdir=/usr/lib
  make
}

package() {
  depends+=('libasound.so' 'libreadline.so' 'libsndfile.so' 'libsamplerate.so'
  'libzita-alsa-pcmi.so' 'libzita-resampler.so')
   cd "$pkgname"
   make DESTDIR="$pkgdir" install
  install -vDm 644 {AUTHORS,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
# vim:set ts=2 sw=2 et:

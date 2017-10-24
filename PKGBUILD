# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=pd-git
_pkg=pd
pkgver=0.48.0.r0.geafd434
pkgrel=2
pkgdesc="The Pure Data real-time music and multimedia environment"
arch=('i686' 'x86_64')
url="http://msp.ucsd.edu/software.html"
license=('custom:BSD')
depends=('jack' 'tk' 'fftw')
provides=('pd')
conflicts=('pd')
options=('!strip')
source=("${_pkg}::git+https://git.code.sf.net/p/pure-data/pure-data"
        "${_pkg}.desktop")
sha512sums=('SKIP'
            '4d3596b337456117ecdf0f1709358b4298198e0b347cb13b884e35ad2f2f667561a10b44683cf916c1da123daebee7141e9ab8bd89405a579b69d30b0e718f37')

pkgver() {
  cd ${_pkg}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkg}"
  autoreconf -f -i
}

build() {
  cd "${_pkg}"
  ./configure --prefix=/usr \
              --enable-alsa \
              --enable-jack \
              --disable-portaudio \
              --enable-fftw
  make
}

package() {
  cd "${_pkg}"
  make DESTDIR="${pkgdir}" install

  # license
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkg}/LICENSE"
  # desktop file
  install -Dm644 "${srcdir}/${_pkg}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkg}.desktop"
}

# vim:set ts=2 sw=2 et:

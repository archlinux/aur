# Maintainer: David Runge <dave@sleepmap.de>
_name=ssr
pkgname=ssr-osc-git
pkgver=0.4.2.r488.g11e1cf1
pkgrel=1
pkgdesc="A tool for real-time spatial audio reproduction (with OSC interface)"
arch=('x86_64')
url="https://github.com/dvzrv/ssr"
conflicts=('ssr')
provides=('ssr')
license=('GPL3')
depends=('asio' 'ecasound' 'fftw' 'glu' 'jack' 'liblo' 'libsndfile' 'libxml2' 'qt5-base')
makedepends=('gendesk' 'git' 'help2man' 'qt5-tools')
source=("git+https://github.com/dvzrv/${_name}#branch=networking-with-osc")
sha512sums=('SKIP')

prepare(){
  cd "${_name}"
  autoreconf -vfi
  gendesk -n \
          --pkgname ${_name} \
          --name ${_name} \
          --pkgdesc "${pkgdesc}" \
          --genericname "Spatial Audio Renderer" \
          --categories "AudioVideo;Audio"
  gendesk -n \
          --pkgname ${_name}-aap \
          --name ${_name}-aap \
          --pkgdesc "${_name} (Ambisonics Amplitude Panner): ${pkgdesc}" \
          --genericname "Spatial Audio Renderer" \
          --categories "AudioVideo;Audio"
  gendesk -n \
          --pkgname ${_name}-binaural \
          --name ${_name}-binaural \
          --pkgdesc "${_name} (Binaural): ${pkgdesc}" \
          --genericname "Spatial Audio Renderer" \
          --categories "AudioVideo;Audio"
  gendesk -n \
          --pkgname ${_name}-brs \
          --name ${_name}-brs \
          --pkgdesc "${_name} (Binaural Room Synthesis): ${pkgdesc}" \
          --genericname "Spatial Audio Renderer" \
          --categories "AudioVideo;Audio"
  gendesk -n \
          --pkgname ${_name}-dca \
          --name ${_name}-dca \
          --pkgdesc "${_name} (Distance-coded Ambisonics): ${pkgdesc}" \
          --genericname "Spatial Audio Renderer" \
          --categories "AudioVideo;Audio"
  gendesk -n \
          --pkgname ${_name}-generic \
          --name ${_name}-generic \
          --pkgdesc "${_name} (Generic): ${pkgdesc}" \
          --genericname "Spatial Audio Renderer" \
          --categories "AudioVideo;Audio"
  gendesk -n \
          --pkgname ${_name}-vbap \
          --name ${_name}-vbap \
          --pkgdesc "${_name} (Vector Based Amplitude Panning): ${pkgdesc}" \
          --genericname "Spatial Audio Renderer" \
          --categories "AudioVideo;Audio"
  gendesk -n \
          --pkgname ${_name}-wfs \
          --name ${_name}-wfs \
          --pkgdesc "${_name} (Wave Field Synthesis): ${pkgdesc}" \
          --genericname "Spatial Audio Renderer" \
          --categories "AudioVideo;Audio"
}

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${_name}"
  ./configure --prefix=/usr \
              --disable-vrpn
  make
}

package() {
  cd "${_name}"
  make DESTDIR="$pkgdir" install
  install -vDm 644 ${_name}{,-{aap,binaural,brs,dca,generic,vbap,wfs}}.desktop \
    -t "${pkgdir}/usr/share/applications"
}


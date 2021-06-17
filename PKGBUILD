# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor:  VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@gmail.com> package
# G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

pkgname=sooperlooper
pkgver=1.7.8
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording"
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'libsigc++' 'wxgtk2')
makedepends=('alsa-lib' 'autoconf-archive' 'gendesk' 'imagemagick' 'jack'
'liblo' 'libsamplerate' 'libsndfile' 'libxml2' 'ncurses' 'rubberband')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/essej/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('875d9fd88a1d1646572ea32585b18e78fd1fa96566869ab9921756c62de1f224befceb80b8d11a3efdf3c8860ac63f5f18d64d8d2a8132219d47cf0a37be8bfe')
b2sums=('4413a0b0fdc0f455188865068cd64d176928bac3df0f5eeccf19b080442448649db8d0995e2524f48f647039a8e16f612042cbfc02be2a7e1d7bc2b372f3f1a5')

prepare() {
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  convert doc/html/sl_web_logo_black.png \
    -resize 128x128\> \
    -size 128x128 xc:black +swap \
    -gravity center \
    -composite net.essej.sooperlooper.png
  gendesk -n \
          --pkgname "net.essej.sooperlooper" \
          --name "SooperLooper" \
          --pkgdesc "Live Looping Sampler" \
          --exec "slgui" \
          --icon "net.essej.sooperlooper" \
          --genericname "Live Looping Sampler" \
          --categories "AudioVideo;Audio;"
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  make
}

package() {
  depends+=('libasound.so' 'libjack.so' 'liblo.so' 'libncursesw.so'
  'librubberband.so' 'libsamplerate.so' 'libsndfile.so')
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 *.desktop -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 net.essej.sooperlooper.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
}

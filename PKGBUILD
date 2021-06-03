# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor:  VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@gmail.com> package
# G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

pkgname=sooperlooper
pkgver=1.7.7
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording"
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'libsigc++' 'wxgtk2')
makedepends=('alsa-lib' 'autoconf-archive' 'gendesk' 'imagemagick' 'jack'
'liblo' 'libsamplerate' 'libsndfile' 'libxml2' 'ncurses' 'rubberband')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/essej/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('eea3c8549c177a9fb15c4848220515f4534ca05f0b863155e0744d3e6871002a2365f090b01003d06a0f5cc21ca58aacfb4cf81622b731e5a538677e5aa751cd')
b2sums=('927cdc0940f3caf907f25d5b1547cbcb025d394fd117a72910d6536c23191aa2808e8bb1b93ade1b771493db49b819bb3f8d43165af6ef63649311dbcc55966b')

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

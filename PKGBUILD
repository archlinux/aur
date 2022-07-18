# Maintainer: Gigadoc2 <gigadoc2+aur@revreso.de>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@gmail.com> package
# Contributor: G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

_pkgname=sooperlooper
pkgname=${_pkgname}-git
pkgver=r549.0cf3001
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording. Built from git."
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'libsigc++' 'wxgtk3')
makedepends=('alsa-lib' 'autoconf-archive' 'gendesk' 'git' 'imagemagick'
'jack' 'liblo' 'libsamplerate' 'libsndfile' 'libxml2' 'ncurses' 'rubberband')
provides=('sooperlooper')
conflicts=('sooperlooper')
source=("git+https://github.com/essej/sooperlooper.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}"
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
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix='/usr'
  make
}

package() {
  depends+=('libasound.so' 'libjack.so' 'liblo.so' 'libncursesw.so'
  'librubberband.so' 'libsamplerate.so' 'libsndfile.so')
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -vDm 644 *.desktop -t "${pkgdir}/usr/share/applications/"
  install -vDm 644 net.essej.sooperlooper.png -t "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
}

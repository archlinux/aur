# Maintainer: Lionel Koenig Gélas <lionel.koenig+archlinux@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: VirtualTam <virtualtam@flibidi.net>
# Contributor: speps <speps@aur.archlinux.org>
# Contributor: Felipe Machado aka arch_audio <machado.felipe@gmail.com>
# Contributor: Johannes Schriewer <jschriewer@gmail.com> package
# G.R.E.A - Grupo Recifense de Estudos do Archlinux (recife's group of archlinux research)

pkgname=sooperlooper
pkgver=1.7.9
pkgrel=1
pkgdesc="Live looping sampler capable of immediate loop recording"
arch=('i686' 'x86_64')
url="http://essej.net/sooperlooper/"
license=('GPL2')
depends=('gcc-libs' 'glibc' 'libsigc++' 'wxwidgets-gtk3')
makedepends=('alsa-lib' 'autoconf-archive' 'gendesk' 'imagemagick' 'jack'
'liblo' 'libsamplerate' 'libsndfile' 'libxml2' 'ncurses' 'rubberband')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/essej/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ae4b1c3a6608d369fb223a49b228daf36a0a1d7bc7308d84b910ca4f1385c4cf686eb45f9fef9db734dc98882b26f4ec16618554ecf0d91086a70553ad32f68b')
b2sums=('380ebdc59f59d424850a37fb171f8c4945a91fd5796db07a9b65fc95e134d27dbd1391ddbb44ec80b7f05061c633fc461f1550eb52abf4d23109a16452b81b63')

prepare() {
  patch -d "${pkgname}-${pkgver}" -Np1 < ../0001-Update-function-call-to-newer-liblo-prototypes.patch 
  cd "${pkgname}-${pkgver}"
  ./autogen.sh
  magick convert doc/html/sl_web_logo_black.png \
    -resize 128x128\> \
    -size 128x128 xc:black +swap \
    -gravity center \
    -composite net.essej.sooperlooper.png
  gendesk -n \
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

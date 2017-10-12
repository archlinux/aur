# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Orivej Desh <masecretaire@gmx.fr>

_pkgname=sonic-visualiser
pkgname="${_pkgname}3"
pkgver=3.0.3
pkgrel=2
pkgdesc="A viewer and analyser of music audio files."
arch=('i686' 'x86_64')
url="http://www.sonicvisualiser.org/"
license=('GPL')
depends=('desktop-file-utils' 'capnproto>=0.6' 'libfishsound' 'libid3tag'
         'liblo' 'liblrdf' 'libmad' 'liboggz' 'libpulse' 'portaudio' 'qt5-base'
         'rubberband' 'sord' 'hicolor-icon-theme')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://code.soundsoftware.ac.uk/attachments/download/2246/${_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/piper-audio/piper/02bafb5284eb20e4c8d96ac5fe5b697ed11f59a4/capnp/piper.capnp")
md5sums=('e0297a5024944f78d0b44ee49c2022de'
         '96282ca7680475e1b50c068b1abe951b')

prepare() {
  cd "${srcdir}/${_pkgname}-$pkgver/piper-cpp/vamp-capnp/"

  # For compatibility with capnproto > 0.6.0.
  # See: https://sourceforge.net/p/sv1/bugs/239/
  msg2 "Re-generating vamp-capnp sources with capnp..."
  cp -f "$srcdir/piper.capnp" .
  capnp compile -oc++ piper.capnp
}

build() {
  cd "${srcdir}/${_pkgname}-$pkgver"
  sh bootstrap.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-$pkgver"

  # bin
  for prog in sonic-visualiser vamp-plugin-load-checker piper-vamp-simple-server; do
    install -Dm755 ${prog} "${pkgdir}/usr/bin/${prog}"
  done

  # desktop file
  install -d "${pkgdir}/usr/share/applications"
  install -Dm644 *.desktop "${pkgdir}/usr/share/applications"

  # icons
  for _s in 16 22 24 32 48 64 128; do
    install -Dm644 icons/sv-${_s}x${_s}.png \
            "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/sv-icon.png"
  done
  install -Dm644 icons/sv-icon.svg \
          "${pkgdir}/usr/share/icons/hicolor/scalable/apps/sv-icon.svg"

  # samples
  install -d "${pkgdir}/usr/share/${_pkgname}/samples"
  install -Dm644 samples/* "${pkgdir}/usr/share/${_pkgname}/samples"

  # templates
  install -d "${pkgdir}/usr/share/${_pkgname}/templates"
  install -Dm644 templates/* "${pkgdir}/usr/share/${_pkgname}/templates"
}

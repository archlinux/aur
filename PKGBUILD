# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_projectname=Mamba
pkgname="${_projectname,,}"
pkgver=1.4
pkgrel=1
pkgdesc="A virtual MIDI keyboard and file player/recorder for JACK"
arch=('i686' 'x86_64')
url="https://github.com/brummer10/${_projectname}"
license=('0BSD')
depends=('cairo')
makedepends=('jack' 'liblo' 'libsigc++' 'libsmf')
optdepends=('new-session-manager: for NSM support')
groups=('pro-audio')
source=(
    "https://github.com/brummer10/${_projectname}/releases/download/v${pkgver}/${_projectname}_${pkgver}.tar.gz"
)
sha256sums=('9f8935202b5c30403acf217786d4ac50b5b2afffd6ec341e7578701642d4c6d8')


prepare() {
  cd "${srcdir}/${_projectname}_${pkgver}"
  sed -i '/update-desktop-database/d' src/Makefile
}

build() {
  cd "${srcdir}/${_projectname}_${pkgver}"
  LDFLAGS="$LDFLAGS -z noexecstack" make
}

package() {
  depends+=('libjack.so' 'liblo.so' 'libsigc++' 'libsmf.so')
  cd "${srcdir}/${_projectname}_${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

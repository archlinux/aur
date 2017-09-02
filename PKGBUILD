# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nixnote
pkgname=nixnote2
pkgver=2.0
pkgrel=5
pkgdesc="Evernote clone (formerly Nevernote)"
url="http://www.nixnote.org"
arch=('x86_64' 'i686')
license=('GPL2')
conflicts=("${_pkgname}-beta" "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('nevernote')
depends=('poppler-qt5' 'qt5-webkit' 'tidy' 'boost-libs')
makedepends=('boost' 'opencv' 'hunspell')
optdepends=('opencv:   Webcam plugin'
            'hunspell: Spell check plugin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/baumgarr/nixnote2/archive/v${pkgver}.tar.gz")
sha256sums=('15016caf90bfe09d44fcac4fa4039756eb7efbaf8469505373577f846ee67dcc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  qmake ./NixNote2.pro
  make
  
  # Build the plugins
  cd plugins/hunspell
  qmake Hunspell.pro
  cd -
  
  cd plugins/webcam
  qmake WebCam.pro
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
  
  mkdir -p "${pkgdir}"/usr/lib/nixnote2/plugins
  install -m755 plugins/*so "${pkgdir}"/usr/lib/nixnote2/plugins/
  # Binaries should really be in lib, not share
  ln -s '../..'/lib/nixnote2/plugins "${pkgdir}"/usr/share/nixnote2/plugins
  
  install -m644 theme.ini "${pkgdir}"/usr/share/nixnote2/theme.ini
  
  sed -i 's:nevernote:nixnote:g' shortcuts_howto.txt
  install -Dm644 shortcuts_howto.txt "${pkgdir}"/usr/doc/nixnote2/shortcuts_howto.txt
  install -Dm644 shortcuts.txt "${pkgdir}"/usr/doc/nixnote2/shortcuts_sample.txt
}

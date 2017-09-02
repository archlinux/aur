# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=nixnote2
pkgname=${_pkgname}-git
pkgver=2.0.r100.g82865e0
pkgrel=1
pkgdesc="Evernote clone (formerly Nevernote) -- git checkout"
url="http://www.nixnote.org"
arch=('x86_64' 'i686')
license=('GPL2')
conflicts=("${_pkgname/2/}" "${_pkgname/2/}-beta" "${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}" "${_pkgname/2/}=${pkgver%.r*}")
replaces=('nevernote')
depends=('poppler-qt5' 'qt5-webkit' 'boost-libs')
makedepends=('git' 'boost' 'opencv' 'hunspell')
optdepends=('opencv:   Webcam plugin'
            'hunspell: Spell check plugin')
source=("${_pkgname}"::git+https://github.com/baumgarr/nixnote2)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/([^-]*-g)/r\1/;s/-/./g"
}

build() {
  cd "${srcdir}/${_pkgname}"

  qmake PREFIX=/usr ./NixNote2.pro
  make
  
  # Build the plugins
  cd plugins/hunspell
  qmake Hunspell.pro
  make
  cd -
  
  cd plugins/webcam
  qmake WebCam.pro
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
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

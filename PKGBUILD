# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Arthur Țițeică arthur.titeica/gmail/com

pkgname=pdf2htmlex-git
pkgver=1742.f12fc15
pkgrel=2
epoch=1
pkgdesc="Convert PDF to HTML without losing format. Text is preserved as much as possible."
arch=('i686' 'x86_64')
url="https://github.com/coolwanglu/pdf2htmlEX"
license=('GPL3' 'custom')
depends=('poppler' 'fontforge')
makedepends=('cmake' 'git')
optdepends=('ttfautohint: Provides automated hinting process for web fonts')
provides=('pdf2htmlex')
conflicts=('pdf2htmlex')
replaces=('pdf2htmlex')
source=('git://github.com/coolwanglu/pdf2htmlEX.git'
        '735.patch')
md5sums=('SKIP'
         '61100dcfa593c90ef9ee2ac3f6206a77')

_gitname=pdf2htmlEX
_pkgname=pdf2htmlEX

pkgver() {
  cd "${_gitname}"
  # git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_gitname}"
  patch -p1 < "${srcdir}/735.patch"

  cd 3rdparty/poppler/git
  sed -i 's|globalParams->getStrokeAdjust()|gTrue|' CairoOutputDev.cc
}

build() {
  cd "${_gitname}"

  cmake . \
  -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

}

# vim:set ts=2 sw=2 et:

# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_pkgname=ghostwriter
pkgname="${_pkgname}-l10n-git"
_commit=4fae783 # 7 digits
pkgver=v1.5.0.r0.g4fae783
pkgrel=1
pkgdesc="A cross-platform, aesthetic, distraction-free Markdown editor"
arch=('i686' 'x86_64')
url="https://wereturtle.github.io/ghostwriter/"
license=('GPL3')
depends=('qt5-webkit' 'hicolor-icon-theme')
makedepends=('git' 'qt5-base')
optdepends=('markdown: Text to (X)HTML conversion tool for web writers'
            'multimarkdown: A superset of Markdown with various output formats'
            'pandoc: Conversion between markup formats'
            'cmark: CommonMark parsing and rendering library and program in C'
            'hunspell: Spell checker and morphological analyzer library and program')
provides=('ghostwriter')
conflicts=('ghostwriter' 'ghostwriter-git')
source=("${_pkgname}::git+https://github.com/wereturtle/${_pkgname}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  lrelease translations/ghostwriter_*.ts
  qmake PREFIX=/usr
  make
}

package() {
  cd "${_pkgname}"
  make INSTALL_ROOT="${pkgdir}" install

  # Doc files
  install -Dm644 CREDITS.md \
    "${pkgdir}/usr/share/doc/${_pkgname}/CREDITS.md"
  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  # License
  install -Dm644 COPYING \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 cc=80 et:

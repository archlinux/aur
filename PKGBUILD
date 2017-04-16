# Maintainer: Icaro Perseo <icaroperseo[at]protonmail[dot]com>

_pkgname=ghostwriter
pkgname=${_pkgname}-l10n-git
_commit=d3f782e # 7 digits
pkgver=v1.4.2.r115.gd3f782e
pkgrel=1
pkgdesc="A cross-platform, aesthetic, distraction-free Markdown editor"
arch=('i686' 'x86_64')
url="https://github.com/wereturtle/ghostwriter"
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
source=("${_pkgname}::git+${url}.git#commit=${_commit}")
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
    "$pkgdir/usr/share/doc/${_pkgname}/CREDITS.md"
  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/${_pkgname}/README.md"

  # License
  install -Dm644 COPYING \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 cc=80 et:

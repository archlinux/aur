# Maintainer: Ashwin Vishnu <ashwinvis+arch at pm D0T me>

pkgname=textidote-bin
_pkgname=textidote
pkgver=0.7.1
pkgrel=1
pkgdesc="Spelling, grammar and style checking on LaTeX documents"
arch=('any')
url="https://github.com/sylvainhalle/textidote"
license=('GPL')
provides=('textidote')
depends=('java-runtime-headless>=8')
source=(
  "https://github.com/sylvainhalle/textidote/releases/download/v${pkgver}/textidote_${pkgver}_all.deb"
  "textidote-desktop"
  "textidote.desktop")
sha256sums=('6ada06a2035cdef33beace162acf81151fb47b630d7bf12653cb3ddbfcdefed4'
            '8c1e1de0ab3d003f7422ef31b84c60678d233070d8828d3a8a94b9cc53ecccb7'
            '2aff8c74126f63bd8ab8e8fb3d69155a233574882ef8f5d1cb887d9ea36f5fcd')

prepare() {
 cd "$srcdir"
 bsdtar xf data.tar.xz
 find -name "*~" -delete
 # Remove insecure RPATH
 # chrpath --delete "opt/estmob/sendanywhere/sendanywhere"
}

package() {
  # Create directories
  install -d "$pkgdir"/{etc/bash.completion.d,usr/bin,usr/share/{man/man1,applications},opt/$_pkgname}

  install -Dm644 etc/bash.completion.d/$_pkgname "$pkgdir"/etc/bash.completion.d/
  install -Dm755 usr/local/bin/$_pkgname "$pkgdir"/usr/bin/
  install -D opt/$_pkgname/$_pkgname.{jar,zsh} "$pkgdir"/opt/$_pkgname/
  install -D usr/share/man/man1/$_pkgname.1 "$pkgdir"/usr/share/man/man1/

  # Extra command to launch in browser
  install -Dm755 $_pkgname-desktop "${pkgdir}"/usr/bin/

  # Add it to desktop
  install -D $_pkgname.desktop "${pkgdir}"/usr/share/applications/
}

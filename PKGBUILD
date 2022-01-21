# Maintainer: Ashwin Vishnu <ashwinvis+arch at pm D0T me>

pkgname=textidote-bin
_pkgname=textidote
pkgver=0.8.3
pkgrel=2
pkgdesc="Spelling, grammar and style checking on LaTeX documents"
arch=('any')
url="https://github.com/sylvainhalle/textidote"
license=('GPL')
provides=('textidote')
depends=('java-runtime-headless>=8')
optdepends=('libnotify: Error messages for textidote-desktop')

source=(
  "https://github.com/sylvainhalle/textidote/releases/download/v${pkgver}/textidote_${pkgver}_all.deb"
  "textidote-desktop"
  "textidote.desktop")
sha256sums=('d231f890fa7bdeccd1a142b8996261d0914ace4d56b88a5f5ae53e0e983fb691'
            'fe73b75d1c718f18af697b4b2e5a638bd6d7fb2098d368bd79129d902ad715d8'
            '4e46cebc763ef8682d807342b76cfe3fddf1b3523693315c0ba9bf3fa33e631e')

prepare() {
 cd "$srcdir"
 bsdtar xf data.tar.xz
 find -name "*~" -delete
 # Remove insecure RPATH
 # chrpath --delete "opt/estmob/sendanywhere/sendanywhere"
}

package() {
  # Create directories
  install -d "$pkgdir"/{etc/bash_completion.d,usr/bin,usr/share/{man/man1,applications,zsh/site-functions},opt/$_pkgname}

  install -Dm644 etc/bash.completion.d/$_pkgname "$pkgdir"/etc/bash_completion.d/
  install -Dm755 usr/local/bin/$_pkgname "$pkgdir"/usr/bin/
  install -D opt/$_pkgname/${_pkgname}.jar "$pkgdir"/opt/${_pkgname}/
  install -D opt/$_pkgname/${_pkgname}-icon.svg "$pkgdir"/opt/${_pkgname}/
  install -Dm644 opt/$_pkgname/${_pkgname}.zsh "$pkgdir"/usr/share/zsh/site-functions/_${_pkgname}
  install -D usr/share/man/man1/$_pkgname.1 "$pkgdir"/usr/share/man/man1/

  # Extra command to launch in browser
  install -Dm755 $_pkgname-desktop "${pkgdir}"/usr/bin/

  # Add it to desktop
  install -Dm755 $_pkgname.desktop "${pkgdir}"/usr/share/applications/
}

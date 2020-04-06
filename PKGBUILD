# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=nerd-fonts-ricty
pkgver=2.0.0
pkgrel=6
pkgdesc="Japanese TrueType font for developers by mixing InconsolataGo patched nerd-fonts and Migu 1M."
arch=('any')
url='https://rictyfonts.github.io/'
license=('custom')
makedepends=('fontforge' 'python-fonttools' 'nerd-fonts-inconsolata' 'ttf-migu' 'perl-rename')
source=(
  'https://rictyfonts.github.io/files/ricty_generator-4.1.1.sh'
  'https://gist.githubusercontent.com/LaFr4nc3/70bb0526986953d32d7609d5486d822e/raw/feb7d6e47a849469b0ec455bef6ccfa231bce3d6/ricty_generator.patch'
  'https://raw.githubusercontent.com/chrissimpkins/fontname.py/afa00311d86c818e46485fcfbd93976ec409ce93/fontname.py'
  'OFL.txt'
  'IPA_Font_License_Agreement_v1.0.txt'
)
sha256sums=(
  '86bf0fed84ef806690b213798419405d7ca2a1a4bed4f6a28b87c2e2d07ad60d'
  '96f7acb2a875f5d33cf7aca1a40438a461a5f705865928250a17ed1cc4945cfd'
  '381d03a8a4e9cddf54b2ba35fa447ae62ee91e8a4cd7106294bd55794794acec'
  'ca122f3bda0154f692817450168cb650a7fc59ef96c93582acd2e7a744d464d3'
  '4c84dd528ec3044638ec346fc1ee27cd1eb95dfc04cbc6a881b3ca7a7f517e54'
)

build() {
  cd "$srcdir"  
  patch -u --follow-symlinks ./ricty_generator-4.1.1.sh < ./ricty_generator.patch
  chmod +x ./ricty_generator-4.1.1.sh
  ./ricty_generator-4.1.1.sh -dr0 /usr/share/fonts/OTF/{'Inconsolata Nerd Font Complete','Inconsolata Bold Nerd Font Complete'}.otf /usr/share/fonts/TTF/{migu-1m-regular,migu-1m-bold}.ttf
  perl-rename "s/ /-/g" *.ttf
  perl-rename "s/Ricty-/Ricty-Nerd-Font-/g" *.ttf
  perl-rename "s/RictyDiscord-/RictyDiscord-Nerd-Font-/g" *.ttf
  python fontname.py "Ricty Nerd Font" Ricty-Nerd-Font-*.ttf
  python fontname.py "Ricty Discord Nerd Font" RictyDiscord-Nerd-Font-*.ttf
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/" 
  install -m644 IPA_Font_License_Agreement_v1.0.txt "$pkgdir/usr/share/licenses/$pkgname/"
}

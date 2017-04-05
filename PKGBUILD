# Maintainer: Bash Booster "booster.sdk at gmail dot com"

pkgname=numix-icon-theme-pack
pkgver=20170401
pkgrel=2
pkgdesc='Numix project Icon Themes - Updated with Numix Core'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('git' 'python-gobject' 'inkscape')
provides=('numix-square-icon-theme' 'numix-square-light-icon-theme' 'numix-circle-icon-theme' 'numix-circle-light-icon-theme' 'numix-icon-theme')
conflicts=('numix-square-icon-theme' 'numix-square-light-icon-theme' 'numix-circle-icon-theme' 'numix-circle-light-icon-theme' 'numix-icon-theme')
options=('!strip')
source=(
"numix-icon-theme-square::git+https://github.com/numixproject/numix-icon-theme-square.git"
"numix-icon-theme-circle::git+https://github.com/numixproject/numix-icon-theme-circle.git"
"numix-icon-theme::git+https://github.com/numixproject/numix-icon-theme.git"
"numix-core::git+https://github.com/numixproject/numix-core.git"
"gen.py::https://gist.githubusercontent.com/boosterdev/34815dd14ce1250cf9fd06f58e56aa8b/raw/cb5c9545ffb60e559737b2e8e4d4cf9aed63fef4/gen.py"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'f99322935b9c7c527cf2b6d34e162e3a2cdddfc465155db6b9712ce0a7119ca6')

pkgver() {
  cd $srcdir/numix-core
  git log -1 --format="%cd" --date=short | tr -d '-'
}

prepare() {
  # update with Numix-Core
  cp "$srcdir/gen.py" "$srcdir/numix-core"
  cd $srcdir/numix-core
  chmod +x gen.py
  ./gen.py --theme square --platform linux
  ./gen.py --theme circle --platform linux
}

package() {
  mkdir -p "$pkgdir/usr/share/icons/"
  install -Dm644 "$srcdir/numix-core/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Numix Icon Theme
  cd "$srcdir/numix-icon-theme"
  cp -dr --no-preserve='ownership' Numix{,-Light} "$pkgdir/usr/share/icons/"
  # Numix Circle Icon Theme
  cd "$srcdir/numix-icon-theme-circle"
  cp -dr --no-preserve='ownership' Numix-Circle{,-Light} "$pkgdir/usr/share/icons/"
  # Numix Square Icon Theme
  cd "$srcdir/numix-icon-theme-square"
  cp -dr --no-preserve='ownership' Numix-Square{,-Light} "$pkgdir/usr/share/icons/"
  # Numix Core Icon Updates
  cd "$srcdir/numix-core"
  cp -dr --no-preserve='ownership' numix-icon-theme-circle/Numix-Circle "$pkgdir/usr/share/icons/"
  cp -dr --no-preserve='ownership' numix-icon-theme-square/Numix-Square "$pkgdir/usr/share/icons/"
}

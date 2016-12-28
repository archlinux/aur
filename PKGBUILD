# Maintainer: Bash Booster "booster.sdk at gmail dot com"

pkgname=numix-icon-theme-pack
pkgver=20161222
pkgrel=2
pkgdesc='Numix project Icon Themes'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('git' 'python-gobject' 'inkscape')
provides=('numix-square-icon-theme' 'numix-square-light-icon-theme' 'numix-circle-icon-theme' 'numix-circle-light-icon-theme' 'numix-icon-theme')
conflicts=('numix-square-icon-theme' 'numix-square-light-icon-theme' 'numix-circle-icon-theme' 'numix-circle-light-icon-theme' 'numix-icon-theme')
options=('!strip')
source=(
'git+https://github.com/numixproject/numix-icon-theme-square.git'
'git+https://github.com/numixproject/numix-icon-theme-circle.git'
'git+https://github.com/numixproject/numix-icon-theme.git'
'git+https://github.com/numixproject/numix-core.git'
)
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd $srcdir/numix-core
  git log -1 --format="%cd" --date=short | tr -d '-'
}

prepare() {
  # update with Numix-Core
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

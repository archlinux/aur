# Maintainer: Bash Booster "booster.sdk at gmail dot com"

pkgname=numix-icon-theme-pack
pkgsquare=numix-icon-theme-square
pkgcircle=numix-icon-theme-circle
pkgdefault=numix-icon-theme
pkgcore=numix-core
pkgver=20161222
pkgrel=1
pkgdesc='Numix project Icon Themes - Updated with Numix Core'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('git' 'python-cairo')
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
  cd $srcdir/$pkgcore
  git log -1 --format="%cd" --date=short | tr -d '-'
}

prepare() {
  # update with Numix-Core
  cd $pkgcore
  chmod +x gen.py
  ./gen.py --theme square --platform linux
  ./gen.py --theme circle --platform linux
}

package() {
  mkdir -p "$pkgdir/usr/share/icons/"
  install -Dm644 "$srcdir/$pkgcore/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Numix Icon Theme
  cd "$srcdir/$pkgdefault"
  cp -dr --no-preserve='ownership' Numix{,-Light} "$pkgdir/usr/share/icons/"
  # Numix Circle Icon Theme
  cd "$srcdir/$pkgcircle"
  cp -dr --no-preserve='ownership' Numix-Circle{,-Light} "$pkgdir/usr/share/icons/"
  # Numix Square Icon Theme
  cd "$srcdir/$pkgsquare"
  cp -dr --no-preserve='ownership' Numix-Square{,-Light} "$pkgdir/usr/share/icons/"
  # Numix Core Icon Updates
  cd "$srcdir/$pkgcore"
  cp -dr --no-preserve='ownership' $pkgcircle/Numix-Circle "$pkgdir/usr/share/icons/"
  cp -dr --no-preserve='ownership' $pkgsquare/Numix-Square "$pkgdir/usr/share/icons/"
}

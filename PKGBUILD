# Maintainer: Robert Booster <boosterdev at linuxmail dot org>

pkgbase="numix-icon-theme-pack"
pkgname="numix-icon-theme-pack-git"
pkgver=r6086
pkgrel=1
pkgdesc='Numix project Icon Themes - Updated with Numix Core'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
makedepends=('git' 'python-gobject' 'inkscape')
provides=('numix-square-icon-theme' 'numix-square-light-icon-theme' 'numix-circle-icon-theme' 'numix-circle-light-icon-theme' 'numix-icon-theme')
conflicts=('numix-square-icon-theme-git' 'numix-circle-icon-theme-git' 'numix-square-icon-theme' 'numix-square-light-icon-theme' 'numix-circle-icon-theme' 'numix-circle-light-icon-theme' 'numix-icon-theme')
options=('!strip')
source=(
  'numix-core::git+https://github.com/numixproject/numix-core'
  'numix-icon-theme::git+https://github.com/numixproject/numix-icon-theme'
  'numix-icon-circle::git+https://github.com/numixproject/numix-icon-theme-circle'
  'numix-icon-square::git+https://github.com/numixproject/numix-icon-theme-square'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $srcdir/numix-core
  printf "r%s" "$(git rev-list --count HEAD)"
}

prepare() {
  # update with Numix-Core
  cd $srcdir/numix-core
  chmod +x gen.py
  ./gen.py --theme circle --platform linux && ./gen.py --theme square --platform linux
}

package_numix-icon-theme-pack-git() {
  mkdir -p "$pkgdir/usr/share/icons/"
  install -Dm644 "$srcdir/numix-core/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Numix Icon Theme
  cd "$srcdir/numix-icon-theme"
  cp -dr --no-preserve='ownership' Numix{-Light,} "$pkgdir/usr/share/icons/"
  cd "$srcdir/numix-icon-circle"
  cp -dr --no-preserve='ownership' Numix-Circle{-Light,} "$pkgdir/usr/share/icons/"
  cd "$srcdir/numix-icon-square"
  cp -dr --no-preserve='ownership' Numix-Square{-Light,} "$pkgdir/usr/share/icons/"
  # Numix Core Icon Updates
  cd "$srcdir/numix-core"
  cp -dr --no-preserve='ownership' numix-icon-theme-circle/Numix-Circle "$pkgdir/usr/share/icons/"
  cp -dr --no-preserve='ownership' numix-icon-theme-square/Numix-Square "$pkgdir/usr/share/icons/"
  # clean up icon spacings
  find "$pkgdir" -name "* *" -delete
}

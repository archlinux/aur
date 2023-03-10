# Maintainer: tuberry

_srcname=crimson
_theme=deathnote
pkgname=grub2-theme-deathnote-git
pkgver=r13.ad2e80d
pkgrel=2
pkgdesc="Opinionated grub2 deathnote theme based on $_srcname"
url=https://github.com/worron/$_srcname
arch=(any)
license=(custom)
depends=(grub)
makedepends=(git python imagemagick)
provides=(grub2-theme-deathnote)
conflicts=(grub2-theme-deathnote)
install=${pkgname}.install
source=(git+https://github.com/worron/$_srcname
    kira.png::file://$HOME/Pictures/grub2-theme-deathnote-kira.png)
    # 1. download https://www.deviantart.com/darkfate17/art/Light-Yagami-Death-Note-Minimalist-Wallpaper-4K-648496266
    # 2. rename: mv `downloaded-png` ~/Pictures/grub2-theme-deathnote-kira.png
md5sums=('SKIP'
         'e136b97344a7b24f94db469b947b95b0')

pkgver() {
  cd $_srcname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd $_srcname
  sed -i "s/$_srcname/$_theme/g" build.py
  sed -i "s/${_srcname^}/${_theme^}/g; 16,19d" patterns/theme.tpt
  magick $srcdir/kira.png -crop 200x200+0+0 PNG:- | magick $srcdir/kira.png - -geometry +0+1961 -composite kira.png
}

build() {
  cd $_srcname
  python ./build.py \
    -m b23425 \
    -s b0947c \
    -b 1f1f1f \
    -i kira.png \
    --console-margin 0 \
    --base-font-size 24 \
    --menu-font-size 32
}

package() {
  cd $_srcname
  find $_theme ! -name '*terminal_c*' -exec install -Dm644 {} ${pkgdir}/usr/share/grub/themes/{} \;
}

# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=ttf-twemoji-color-git
_gitname=twemoji-color-font
pkgver=14.0.2.r2.g80a6926
pkgrel=1
epoch=1

pkgdesc="Color and B&W SVGinOT builds of Twemoji"
url="https://github.com/13rac1/twemoji-color-font"
license=(
  CC-BY-4.0
  MIT
)
arch=(any)

source=(
  "git+$url.git#branch=main"
  "git+https://github.com/13rac1/scfbuild.git#branch=master"
)
b2sums=('SKIP'
        'SKIP')

makedepends=(
  fontforge
  git
  inkscape
  imagemagick
  nodejs
  potrace
  python-fonttools
  python-setuptools
  python-yaml
  svgo
)

provides=(
  emoji-font
  ttf-twemoji-color
  twemoji-color-font
)
conflicts=(
  ttf-twemoji-color
  twemoji-color-font
)

pkgver() {
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$_gitname"
  rm SCFBuild
  ln -s "${srcdir}"/scfbuild SCFBuild
  sed -i 's/package: regular-package linux-package deb-package macos-package windows-package/package: linux-package/' Makefile
}

build(){
  cd "$_gitname"
  make
}

package(){
  cd "$_gitname"/build/TwitterColorEmoji-SVGinOT-Linux-14.0.2
  install -Dm644 TwitterColorEmoji-SVGinOT.ttf -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>

pkgname=tecate-bitmap-fonts-bdf-git
_name=bitmap-fonts
pkgver=r64.5c101c9
pkgrel=1
pkgdesc="Monospaced bitmap fonts for X11, good for terminal use. (converted to bdf)"
url="https://github.com/Tecate/bitmap-fonts"
arch=('any')
license=('custom')
makedepends=('git' 'pcf2bdf')
depends=('fontconfig' 'xorg-fonts-encodings')
source=("git+https://github.com/Tecate/bitmap-fonts")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_name}"
  install -d "${pkgdir}/usr/share/fonts/"

  # convert pcf fonts to bdf
  for file in bitmap/*/*.pcf; do
    filename="${file%.*}"
    pcf2bdf -o "$filename".otb "$file"
    rm "$file"
  done
  
  cp -ar bitmap/* "${pkgdir}/usr/share/fonts/"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

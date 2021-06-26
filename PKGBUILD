# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>

pkgname=tecate-bitmap-fonts-otb-git
_name=bitmap-fonts
pkgver=r64.5c101c9
pkgrel=1
pkgdesc="Monospaced bitmap fonts for X11, good for terminal use. (converted to otb)"
url="https://github.com/Tecate/bitmap-fonts"
arch=('any')
license=('custom')
makedepends=('git' 'python' 'fontforge')
depends=('fontconfig' 'xorg-fonts-encodings')
source=("git+https://github.com/Tecate/bitmap-fonts" \
        "https://gist.github.com/Earnestly/6bc5bad7666f7bf8816d054b7b76112e/raw/37256dd9561cc4820a4ce168a74d5e7c5fda4278/opentype-bitmap.py")
sha256sums=('SKIP'
            'a3532394bd7c0f0a38b8b3cd55df77edac39bac877e380a9a786c9d48cab799f')

pkgver() {
  cd "${srcdir}/$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  chmod +x "${srcdir}/opentype-bitmap.py"
  
  cd "${srcdir}/${_name}"
  install -d "${pkgdir}/usr/share/fonts/"

  # convert fonts to otb
  shopt -s extglob nullglob globstar
  for d in bitmap/**; do
    if [[ -d $d ]]; then
        cd "$d"
        files=(*.bdf *.bdf.gz *.pcf *.pcf.gz)
        if [[ ${#files[@]} -ge 1 ]]; then
            echo "converting ${files[*]} to otb"
            "${srcdir}/opentype-bitmap.py" ${files[*]} >/dev/null 2>&1
            rm ${files[*]}
        fi
        cd "${srcdir}/${_name}"
    fi
  done
  
  cp -ar bitmap/* "${pkgdir}/usr/share/fonts/"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

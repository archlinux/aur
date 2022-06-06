# Maintainer: Sainnhe Park <sainnhe@gmail.com>

pkgname=capitaine-cursors-sainnhe-git
pkgver=4.r15.ga7622db
pkgrel=1
pkgdesc="Sainnhe's fork of capitaine cursor theme, patched with some additional variants (Gruvbox, Nord, Palenight)"
arch=(any)
url="https://github.com/sainnhe/capitaine-cursors"
license=(LGPL3)
source=("git+${url}.git#branch=master")
provides=('capitaine-cursors')
conflicts=('capitaine-cursors')
makedepends=(inkscape xorg-xcursorgen bc git)
sha256sums=('SKIP')

# Change --max-dpi here, available values are lo, tv, hd, xhd, xxhd, xxxhd
_max_dpi=xxhd

pkgver() {
  cd "${srcdir}/capitaine-cursors"
  git describe origin/master --long --tags | sed 's/^r//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/capitaine-cursors"
  for style in Default Nord Gruvbox Palenight ; do
    for variant in dark light ; do
      ./build.sh --max-dpi "${_max_dpi}" --type "${variant}" --style "${style}"
      git checkout -- src/
      rm -rf _build
    done
  done
}

package() {
  cd "${srcdir}/capitaine-cursors"
  install -Ddm755 "$pkgdir/usr/share/icons"
  for style in Default Nord Gruvbox Palenight ; do
    for variant in dark light ; do
      if [ "${variant}" == "light" ]; then
        _variant=" - White"
      else
        _variant=""
      fi
      if [ "${style}" != "Default" ]; then
        _style=" (${style})"
      else
        _style=""
      fi
      cp -dr --no-preserve=ownership "dist/${style}/${variant}/" "$pkgdir/usr/share/icons/Capitaine Cursors${_style}${_variant}"
    done
  done
}

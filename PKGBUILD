# Maintainer: Sainnhe Park <sainnhe@gmail.com>

pkgname=capitaine-cursors-full-git
pkgver=4.r12.g0f93f5d
pkgrel=1
pkgdesc="Fork of capitaine cursors, all variants will be built including macOS, Nord, Gruvbox, Everforest, Edge"
arch=(any)
url="https://github.com/sainnhe/capitaine-cursors"
license=(LGPL3)
source=("git+${url}.git#branch=master")
provides=('capitaine-cursors')
conflicts=('capitaine-cursors')
makedepends=(inkscape xorg-xcursorgen bc git)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/capitaine-cursors"
  git describe origin/master --long --tags | sed 's/^r//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/capitaine-cursors"
  for style in macOS Nord Gruvbox Everforest Edge ; do
    for variant in dark light ; do
      ./build.sh --max-dpi xxxhd --type "${variant}" --style "${style}"
      git checkout -- src/
      rm -rf _build
    done
  done
}

package() {
  cd "${srcdir}/capitaine-cursors"
  install -Ddm755 "$pkgdir/usr/share/icons"
  for style in macOS Nord Gruvbox Everforest Edge ; do
    for variant in dark light ; do
      if [ "${variant}" == "light" ]; then
        _variant=" - White"
      else
        _variant=""
      fi
      if [ "${style}" != "macOS" ]; then
        _style=" (${style})"
      else
        _style=""
      fi
      cp -dr --no-preserve=ownership "dist/${style}/${variant}/" "$pkgdir/usr/share/icons/Capitaine Cursors${_style}${_variant}"
    done
  done
}

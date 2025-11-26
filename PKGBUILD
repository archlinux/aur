# Maintainer: Dave Daynard <nardholio at gmail dot com>
# Contributor: megadriver <megadriver at gmx dot com>
# Based on clearlooks-phenix-gtk-theme from the AUR

pkgname=clearlooks-phenix-gtk-theme-git
pkgver=7.1
pkgrel=1
pkgdesc="GTK3 theme visually close to Clearlooks (git version)"
arch=('any')
url="https://github.com/jpfleury/clearlooks-phenix"
license=('GPL3')
depends=('gtk-engines')
optdepends=('mist-icon-theme: a visually compatible icon theme'
            'gnome-themes-extra: provides theme fallbacks')
makedepends=('inkscape' 'git')
provides=('clearlooks-phenix-gtk-theme')
conflicts=('clearlooks-phenix-gtk-theme')
source=("git+https://github.com/jpfleury/clearlooks-phenix.git")
sha256sums=('SKIP')

pkgver() {
  cd clearlooks-phenix
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd clearlooks-phenix
  # Prefer building icons from SVG source (if _src exists; remove if errors)
  export SELF_CALL=1
  make -C _src clean
  make -C _src
}

package() {
  cd clearlooks-phenix
  mkdir -p "${pkgdir}/usr/share/themes/Clearlooks-Phenix"
  cp -a gtk-2.0 gtk-3.0 index.theme metacity-1 openbox-3 wallpapers xfwm4 \
     "${pkgdir}/usr/share/themes/Clearlooks-Phenix"

  # Clean up git files
  rm -rf "${pkgdir}/usr/share/themes/Clearlooks-Phenix/.git"

  install -D -m 0644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/* *.md
}

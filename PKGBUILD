# Maintainer: Matteo Bonanomi <mbonanomi.dev@proton.me>

pkgname=xfce4-meowmenu-plugin
pkgver=0.7.1
pkgrel=1
pkgdesc="Modern menu launcher plugin for the Xfce panel"
arch=('x86_64')
url="https://github.com/matteobonanomi/xfce4-meowmenu-plugin"
license=('GPL-2.0-or-later')
# accountsservice and gtk-layer-shell are hard runtime deps: the build links
# them unconditionally (mirrors the .deb/.rpm recipes, which install their
# -dev packages without a feature switch).
depends=('accountsservice' 'exo' 'garcon' 'glib2' 'gtk-layer-shell' 'gtk3'
         'libxfce4ui' 'libxfce4util' 'xfce4-panel' 'xfconf')
# base-devel is assumed present (standard makepkg requirement) and is NOT
# listed here. meson/ninja are real build inputs not guaranteed by base-devel.
makedepends=('gettext' 'git' 'meson' 'ninja' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2312f687a9040b47f35e8be8b9b545c224e75580fd6d2d2cf4a5eb50a0bd3bb7')

build() {
  cd "${srcdir}"
  # Prefer arch-meson (sets Arch's standard prefix/flags). Fall back to an
  # explicit meson setup when the image lacks the helper, without touching the
  # project's own Meson files.
  if command -v arch-meson >/dev/null 2>&1; then
    arch-meson "${pkgname}-${pkgver}" build
  else
    meson setup "${pkgname}-${pkgver}" build \
      --prefix=/usr --buildtype=plain --wrap-mode=nodownload
  fi
  meson compile -C build
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"
}

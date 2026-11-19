# Maintainer: Matteo Bonanomi <mbonanomi.dev@proton.me>

pkgname=xfce4-meowmenu-plugin
_upstream_version=1.0.0-rc2
pkgver=1.0.0rc2
pkgrel=1
pkgdesc="Modern menu launcher plugin for the Xfce panel"
arch=('x86_64')
url="https://github.com/matteobonanomi/xfce4-meowmenu-plugin"
license=('GPL-2.0-or-later')
depends=('exo' 'garcon' 'glib2' 'gtk3'
         'libxfce4ui' 'libxfce4util' 'xfce4-panel' 'xfconf')
# base-devel is assumed present (standard makepkg requirement) and is NOT
# listed here. meson/ninja are real build inputs not guaranteed by base-devel.
makedepends=('gettext' 'git' 'meson' 'ninja' 'pkgconf')
checkdepends=('xorg-server-xvfb' 'xorg-xauth')
source=("${pkgname}-${_upstream_version}.tar.gz::${url}/archive/refs/tags/v${_upstream_version}.tar.gz")
sha256sums=('c2f9dcdc21c280427b91733dc02d2a65ead32e277a17f4769499bbe2af7863e8')

build() {
  cd "${srcdir}"
  # Prefer arch-meson (sets Arch's standard prefix/flags). Fall back to an
  # explicit meson setup when the image lacks the helper, without touching the
  # project's own Meson files.
  if command -v arch-meson >/dev/null 2>&1; then
    arch-meson "${pkgname}-${_upstream_version}" build \
      -Daccountsservice=disabled -Dgtk-layer-shell=disabled
  else
    meson setup "${pkgname}-${_upstream_version}" build \
      --prefix=/usr --buildtype=plain --wrap-mode=nodownload \
      -Daccountsservice=disabled -Dgtk-layer-shell=disabled
  fi
  meson compile -C build
}

check() {
  cd "${srcdir}"
  GTK_THEME=Adwaita \
  GDK_BACKEND=x11 \
  MEOWMENU_REQUIRE_DISPLAY=1 \
  MEOWMENU_REQUIRE_XFCONF=1 \
    xvfb-run -a meson test -C build --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"
}

# Maintainer: Matteo Bonanomi <mbonanomi.dev@proton.me>

pkgname=xfce4-meowmenu-plugin
_upstream_version=1.0.0-rc1
pkgver=1.0.0rc1
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
source=("${pkgname}-${_upstream_version}.tar.gz::${url}/archive/refs/tags/v${_upstream_version}.tar.gz")
sha256sums=('3af33310dfa7b82fced0fb7b94d4dbff1f7fed1c62c4c73eb0a7641f0e6aac15')

build() {
  cd "${srcdir}"
  # Prefer arch-meson (sets Arch's standard prefix/flags). Fall back to an
  # explicit meson setup when the image lacks the helper, without touching the
  # project's own Meson files.
  if command -v arch-meson >/dev/null 2>&1; then
    arch-meson "${pkgname}-${_upstream_version}" build
  else
    meson setup "${pkgname}-${_upstream_version}" build \
      --prefix=/usr --buildtype=plain --wrap-mode=nodownload
  fi
  meson compile -C build
}

check() {
  cd "${srcdir}"
  meson test -C build --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"
}

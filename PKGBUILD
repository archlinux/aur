pkgname=gnome-shell-extension-better-tray-icons-git
pkgver=3.1.2.r0.gcbbe4ba
pkgrel=1
pkgdesc="Brings tray icons back to the GNOME top panel, with an overflow popup behind a toggle button, per-app renaming and icon overrides, configurable click actions and settings sync. Wayland only."
arch=('any')
url="https://github.com/nexaknight/BetterTrayIcons"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'gettext'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("BetterTrayIcons::git+${url}.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd BetterTrayIcons
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  make -C BetterTrayIcons pack
}

package() {
  local uuid='BetterTrayIcons@nexaknight.com'
  local extension_dir="${pkgdir}/usr/share/gnome-shell/extensions/${uuid}"

  install -d "${extension_dir}"
  bsdtar -xf "BetterTrayIcons/${uuid}.shell-extension.zip" \
    -C "${extension_dir}" --no-same-owner

  install -Dm644 \
    BetterTrayIcons/schemas/org.gnome.shell.extensions.bettertrayicons.gschema.xml \
    -t "${pkgdir}/usr/share/glib-2.0/schemas/"
  rm -r "${extension_dir}/schemas"

  install -Dm644 BetterTrayIcons/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

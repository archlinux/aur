# Maintainer: Mikael Blomstrand <mbloms ÅT kth DÖT se>
# Contributor: Tobias Umbach <tobias@fastmail.mx>
# Contributor: Wesley Moore <wes@wezm.net>

pkgname=neovim-gtk
pkgver=0.2.0
pkgrel=1
pkgdesc='GTK UI for Neovim written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/daa84/neovim-gtk"
license=('GPL3')
depends=('neovim' 'gtk3' 'vte3' 'ttf-dejavu')
makedepends=('rust' 'cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/daa84/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('829a1694e3d9ac402b76754d65869b33')
sha1sums=('8b4985050fa75fe913136e5a1efa0ada6fa1d240')
sha256sums=('df4567bc687074e085b16199cd63edd0b19c12a3d66721f8c2c6021e709f3a21')

prepare() {
  cd "${pkgname}-${pkgver}"
  msg2 "Patching desktop/org.daa.NeovimGtk.desktop"
  # Without the second line, it doesn't start on Plasma
  sed -i -e "s|Exec=nvim-gtk|Exec=/usr/bin/nvim-gtk|" \
  -e "s|Terminal=false|Terminal=true|" \
  desktop/org.daa.NeovimGtk.desktop
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/nvim-gtk" "${pkgdir}/usr/bin/nvim-gtk"

  # runtime
  install -Dm644 "runtime/plugin/nvim_gui_shim.vim" "${pkgdir}/usr/share/nvim-gtk/runtime/nvim_gui_shim.vim"

  # desktop file
  install -Dm644 "desktop/org.daa.NeovimGtk.desktop" "${pkgdir}/usr/share/applications/org.daa.NeovimGtk.desktop"

  # Icons
  install -Dm644 "desktop/org.daa.NeovimGtk_48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/org.daa.NeovimGtk.png"
  install -Dm644 "desktop/org.daa.NeovimGtk_128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/org.daa.NeovimGtk.png"
  install -Dm644 "desktop/org.daa.NeovimGtk.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.daa.NeovimGtk.svg"

  # LICENSE
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

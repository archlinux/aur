# Maintainer:  Dimitris Kiziridis <dkiziridis at outlook dot com>

pkgname=blackbox-terminal
pkgver=0.12.2
pkgrel=1
pkgdesc='A beautiful GTK 4 terminal'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/raggesilver/blackbox'
license=('GPL3')
depends=('libadwaita'
         'libmarble-git'
         'vte4')
makedepends=('meson'
             'vala')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/blackbox-v${pkgver}.tar.gz"
        "launch_fix.diff"
        "rename_icons.diff")
sha256sums=('8fbd209b81b2abb192e29e61239dafc4da072c28e7503c9788f9d18f1e55aeba'
            '6d675227f2e2217e823a12638c9a08eb2d35f25416dd47656135132eddef956c'
            'b06d407041adfc2ad0f5a382e6503a5115f99a3b284e484cdb07592733ad1cb6')

prepare() {
  cd ${pkgname%-terminal}-v${pkgver}
  # Rename icons
  # Avoid install failed when extension-manager is installed
  patch -p1 < ../rename_icons.diff

  # Fix launch issue of blackbox
  # see: https://github.com/mitchmindtree/blackbox.nix/issues/2
  patch -p1 < ../launch_fix.diff
}

build() {
  cd ${pkgname%-terminal}-v${pkgver}
  arch-meson build
  meson compile -C build
}

package() {
  cd ${pkgname%-terminal}-v${pkgver}
  meson install -C build --destdir "$pkgdir"
}

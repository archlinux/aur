# Maintainer:  Dimitris Kiziridis <dkiziridis at outlook dot com>

pkgname=blackbox-terminal
pkgver=0.11.3
pkgrel=1
pkgdesc='A beautiful GTK 4 terminal'
arch=('i686' 'x86_64')
url='https://gitlab.gnome.org/raggesilver/blackbox'
license=('GPL3')
depends=('libadwaita-git'
         'libmarble-git'
         'vte4-copy-patch-git')
makedepends=('meson'
             'vala'
             'gi-docgen')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/blackbox-v${pkgver}.tar.gz"
        "launch_fix.diff"
        "rename_icons.diff")
sha256sums=('85efef854f8378c8aeb9df5a167447c17bbf3ba21274cdfcd6cc8e4cd3536aed'
            'SKIP'
            'SKIP')

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

# shellcheck shell=bash disable=SC2034,SC2154

# Maintainer: Damien Flament <damien dot flament at gmx dot com>

pkgname='entrance'
pkgver=3.0.0
pkgrel=1
pkgdesc="An EFL based display manager"
url='https://github.com/wltjr/entrance'
license=('GPL-3.0-or-later')

arch=('x86_64')
makedepends=('meson' 'ninja')
depends=('systemd-libs' 'efl' 'pam' 'libxcb')

conflicts=('entrance-git')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wltjr/entrance/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3dbf6fc4ee18171ed88a6a047387f6024ae67dbd6ebdd67f82be2474ecd33f6d')

function prepare {
  cd "${pkgname}-${pkgver}" || return

  sed -e '/"session_path"/ s|:.*|: "/usr/local/sbin:/usr/local/bin:/usr/bin";|' \
      -e '/"shutdown"/ s|:.*|: "/usr/bin/systemctl poweroff";|' \
      -e '/"reboot"/ s|:.*|: "/usr/bin/systemctl reboot";|' \
      -e '/"suspend"/ s|:.*|: "/usr/bin/systemctl suspend";|' \
      -i "data/entrance.conf.in"
}

function build {
  cd "${pkgname}-${pkgver}" || return

  meson setup --reconfigure \
    --buildtype release \
    --prefix "/usr" \
    --licensedir "share/licenses" \
    -Dpam=true \
    -Dlogind=true \
    build .

  ninja -C build

  # meson compile
}

function package {
  cd "${pkgname}-${pkgver}" || return

  DESTDIR="$pkgdir" ninja -C build install

#   # L'exécutable principal est installé.
#   install -Dt "$pkgdir/usr/bin" "target/release/tine"
#
#   # Le fichier Desktop du Flatpak est utilisé.
#   install -Dt "$pkgdir/usr/share/applications" "flatpak/page.tine.Tine.desktop"
#
#   # Les icônes sont installées.
#   install -D  "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/page.tine.Tine.png"
#   install -D  "src-tauri/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/page.tine.Tine.png"
#   install -D  "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/page.tine.Tine.png"
#   install -D  "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/128x128@2/apps/page.tine.Tine.png"
#   install -D  "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/page.tine.Tine.png"
#   install -D  "docs/app-icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/page.tine.Tine.svg"
#
#   # Les fichiers de manuel sont compressés et installés.
#   install -d "$pkgdir/usr/share/man/man1"
#
#   for page in tine-capture tine-doctor tine-export-live tine-export-static tine-export tine-open tine-version tine
#   do
#     gzip -c "docs/${page}.1" > "$pkgdir/usr/share/man/man1/${page}.1.gz"
#   done
}

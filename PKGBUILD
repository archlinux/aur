pkgname=gephgui-wry-bin
pkgver=5.9.0
pkgrel=1
pkgdesc="Geph desktop GUI"
arch=('x86_64')
url="https://github.com/geph-official/gephgui-wry"
license=('MPL-2.0' 'BSD-3-Clause')
install=gephgui-wry-bin.install
provides=('gephgui-wry' 'geph5-client' 'geph5')
conflicts=('gephgui-wry' 'geph5-client' 'geph5-client-git' 'geph5-app-git')
makedepends=('ostree')
depends=(
  'webkit2gtk-4.1'
  'polkit'
  'nftables'
  'iproute2'
  'libxdo3'
  'libayatana-appindicator'
)
options=('!strip' '!debug')
source=(
  "Geph-x86_64.flatpak::https://f001.backblazeb2.com/file/geph4-dl/geph-releases/linux-stable/5.9.0/Geph-x86_64.flatpak"
)
sha256sums=('69eeb74fab8279c180082c27c6e1ab6892f9f7dfb471429f27b47e27e8eb996a')

prepare() {
  rm -rf geph-repo geph-app
  mkdir geph-repo
  ostree init --repo=geph-repo --mode=bare-user
  ostree static-delta apply-offline --repo=geph-repo Geph-x86_64.flatpak
  local commit
  commit=$(find geph-repo/objects -name '*.commit' | sed 's|.*/\([0-9a-f]\{2\}\)/\([0-9a-f]*\)\.commit|\1\2|')
  ostree checkout --repo=geph-repo --user-mode "$commit" geph-app
}

package() {
  install -Dm755 "${srcdir}/geph-app/files/bin/geph5" "$pkgdir/usr/bin/geph5"
  install -Dm755 "${srcdir}/geph-app/files/bin/geph5-client" "$pkgdir/usr/bin/geph5-client"
  install -Dm755 "${srcdir}/geph-app/files/bin/gephgui-wry" "$pkgdir/usr/bin/gephgui-wry"

  install -Dm644 "${srcdir}/geph-app/export/share/applications/io.geph.GephGui.desktop" \
    "$pkgdir/usr/share/applications/io.geph.GephGui.desktop"

  for size in 16 32 64 128 256; do
    install -Dm644 "${srcdir}/geph-app/export/share/icons/hicolor/${size}x${size}/apps/io.geph.GephGui.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/io.geph.GephGui.png"
  done
}

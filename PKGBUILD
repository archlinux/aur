pkgname=gephgui-wry-bin
pkgver=5.9.1
pkgrel=1
pkgdesc="Geph desktop GUI"
arch=('x86_64')
url="https://github.com/geph-official/gephgui-wry"
license=('MPL-2.0')
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
  "gephgui-wry-bin-$pkgver.flatpak::https://f001.backblazeb2.com/file/geph4-dl/geph-releases/linux-stable/$pkgver/Geph-x86_64.flatpak"
)
sha256sums=('26ecb44b550b3344fba528acc8d18fad113722300c8b7c844219293e0eeabb3a')

prepare() {
  rm -rf geph-repo geph-app
  mkdir geph-repo
  ostree init --repo=geph-repo --mode=bare-user
  ostree static-delta apply-offline --repo=geph-repo gephgui-wry-bin-$pkgver.flatpak
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

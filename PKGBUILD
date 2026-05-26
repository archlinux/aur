# Maintainer: agony <27015 at riseup dot net>
pkgname=feishin-appimage
pkgver=1.11.0
pkgrel=2
pkgdesc="A player for your self-hosted music server (AppImage)"
arch=('x86_64' 'aarch64')
url="https://github.com/jeffvli/feishin"
license=('GPL-3.0-only')
depends=('fuse3')
optdepends=('mpv: alternative audio backend')
provides=('feishin')
conflicts=('feishin')
options=(!strip)
source=("feishin.desktop")
source_x86_64=("feishin-${pkgver}-x86_64.AppImage::${url}/releases/download/v${pkgver}/Feishin-linux-x86_64.AppImage")
source_aarch64=("feishin-${pkgver}-aarch64.AppImage::${url}/releases/download/v${pkgver}/Feishin-linux-arm64.AppImage")
sha256sums=('818f9700176bc3fbb3a00a1e6e41c933114f2a6029c8143a88239c5b9fc5c194')
sha256sums_x86_64=('843b85887dba1457d5d014bf9294b199e8d764ea3775cd0b1b28b524f6dc0a8a')
sha256sums_aarch64=('d5fa435fafd11f59647551e850e0cc77e718bf40b0edca56ce921e811a881226')

prepare() {
  # The package ships the raw, self-contained AppImage. We only unpack it
  # here to harvest the icon and license for desktop integration.
  # --appimage-extract unpacks the squashfs without needing FUSE.
  chmod +x "feishin-${pkgver}-${CARCH}.AppImage"
  ./"feishin-${pkgver}-${CARCH}.AppImage" --appimage-extract >/dev/null
}

package() {
  # Ship the raw AppImage. The type2-runtime mounts its squashfs via
  # fusermount3 (fuse3) at launch and runs the bundled Electron app, which
  # carries its own libraries — hence the single fuse3 runtime dependency.
  install -Dm755 "feishin-${pkgver}-${CARCH}.AppImage" \
    "$pkgdir/opt/$pkgname/feishin.AppImage"

  # /usr/bin/feishin -> the AppImage. A plain symlink (no wrapper, no flags):
  # the app uses the unprivileged user-namespace sandbox, identical to the
  # feishin-bin package — the AppImage mount is nosuid so a SUID sandbox is
  # impossible there anyway.
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/feishin.AppImage" "$pkgdir/usr/bin/feishin"

  # Desktop entry (identical to feishin-bin for consistent integration)
  install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/feishin.desktop"

  # Icon, harvested from the AppImage, installed to match feishin-bin
  install -Dm644 squashfs-root/usr/share/icons/hicolor/512x512/apps/feishin.png \
    "$pkgdir/usr/share/pixmaps/org.jeffvli.feishin.png"

  # License (bundled Electron license text)
  install -Dm644 squashfs-root/LICENSE.electron.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
}

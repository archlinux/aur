# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=refryt-bin
pkgver=0.1.10
pkgrel=1
pkgdesc='A fast, native YouTube Music client (prebuilt upstream AppImage)'
arch=('x86_64')
url='https://github.com/gridoe/refryt'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'webkit2gtk-4.1' 'yt-dlp')
provides=('refryt')
conflicts=('refryt')
source=("refryt-${pkgver}-x86_64.AppImage::https://github.com/gridoe/refryt/releases/download/v${pkgver}/refryt-${pkgver}-x86_64.AppImage"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/gridoe/refryt/v${pkgver}/LICENSE")
sha256sums=('70253012ff60aa6f3f299282a401f02fcedc8eedd447009a4e9766a1ad187933'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

prepare() {
  chmod +x "refryt-${pkgver}-x86_64.AppImage"
  ./"refryt-${pkgver}-x86_64.AppImage" --appimage-extract > /dev/null
}

package() {
  # Upstream binary has RUNPATH $ORIGIN/../lib, so keep bin/ + lib/ siblings.
  install -dm755 "${pkgdir}/opt/refryt/bin" "${pkgdir}/opt/refryt/lib"
  install -m755 squashfs-root/usr/bin/refryt "${pkgdir}/opt/refryt/bin/refryt"
  cp -a squashfs-root/usr/lib/. "${pkgdir}/opt/refryt/lib/"
  # Use the distro yt-dlp (in depends) instead of the bundled copy.
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/refryt/bin/refryt "${pkgdir}/usr/bin/refryt"

  install -Dm644 squashfs-root/usr/share/applications/refryt.desktop \
    "${pkgdir}/usr/share/applications/refryt.desktop"
  for s in 16 32 48 64 128 256 512; do
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/${s}x${s}/apps/refryt.png" \
      "${pkgdir}/usr/share/icons/hicolor/${s}x${s}/apps/refryt.png"
  done
  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

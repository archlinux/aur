# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>
# Contributor: Liberty Raptor <libertyraptor at protonmail dot com>

pkgname=xemu-bin
pkgver=0.8.108
pkgrel=1
pkgdesc="Emulator for the original Xbox console"
arch=(x86_64)
url='https://xemu.app'
license=('GPL-2.0-only')
provides=('xemu')
conflicts=('xemu' 'xemu-git')
source=(xemu-$pkgver.AppImage::https://github.com/xemu-project/xemu/releases/download/v$pkgver/xemu-v$pkgver-x86_64.AppImage)
sha256sums=('1a01a83253e4ac04e45f6a59b6e581e1ce0e94e3682b5f9517f0d0919afcaa8a')

prepare() {
  # Extract files from AppImage (only if exists, in case of using '--noextract').
  if [ -e xemu-$pkgver.AppImage ]; then
    chmod 755 xemu-$pkgver.AppImage
    ./xemu-$pkgver.AppImage --appimage-extract
    rm -f xemu-$pkgver.AppImage
  fi
}

package() {
  mkdir -p "$pkgdir"/{opt/xemu,usr/bin}
  cp -a  "$srcdir"/squashfs-root/usr/{bin,lib} -t "$pkgdir"/opt/xemu/
  ln -sr "$pkgdir"/opt/xemu/bin/xemu           -t "$pkgdir"/usr/bin/

  install -Dm644 "$srcdir"/squashfs-root/usr/share/applications/xemu.desktop            -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/squashfs-root/usr/share/icons/hicolor/scalable/apps/xemu.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
}

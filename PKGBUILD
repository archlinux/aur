# Maintainer: Aleksey Smirnov <debugger94 at gmail dot com>
# Contributor: Liberty Raptor <libertyraptor at protonmail dot com>

pkgname=xemu-bin
pkgver=0.8.139
pkgrel=3
pkgdesc="Emulator for the original Xbox console"
arch=(x86_64)
url="https://xemu.app"
license=('GPL-2.0-only')
provides=(xemu)
conflicts=(xemu xemu-git)
options=(!debug)
source=(xemu-$pkgver.AppImage::https://github.com/xemu-project/xemu/releases/download/v$pkgver/xemu-$pkgver-x86_64.AppImage)
sha256sums=('220282aacf09b30b35c55ba900a774fb6940c70deca1408bc70a4c9cc67c322f')

prepare() {
  rm -rf "$srcdir"/{squashfs-root,xemu}

  chmod 755 xemu-$pkgver.AppImage
  ./xemu-$pkgver.AppImage --appimage-extract
  mv -f "$srcdir"/squashfs-root/usr "$srcdir"/xemu

  sed -i '/^Categories=/i\StartupWMClass=app.xemu.xemu' "$srcdir/xemu/share/applications/xemu.desktop"

  # Workaround for broken window decorations
  cat <<EOF > "$srcdir"/xemu.sh
#!/bin/bash
export LD_PRELOAD=/usr/lib/libsystemd.so.0
/opt/xemu/bin/xemu "\$@"
EOF
}

package() {
  install -dm755 "$pkgdir"/{usr/bin,opt/xemu/{bin,lib}}
  install -Dm755 "$srcdir"/xemu/bin/xemu -t "$pkgdir"/opt/xemu/bin/
  install -Dm644 "$srcdir"/xemu/lib/*    -t "$pkgdir"/opt/xemu/lib/

  # Workaround for broken window decorations
  install -Dm755 "$srcdir"/xemu.sh -T "$pkgdir"/usr/bin/xemu
  #ln -sr "$pkgdir"/opt/xemu/bin/xemu -t "$pkgdir"/usr/bin/

  install -Dm644 "$srcdir"/xemu/share/applications/xemu.desktop            -t "$pkgdir"/usr/share/applications/
  install -Dm644 "$srcdir"/xemu/share/icons/hicolor/scalable/apps/xemu.svg -t "$pkgdir"/usr/share/icons/hicolor/scalable/apps/
}

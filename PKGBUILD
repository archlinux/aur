# Maintainer: fufu1437 <mono2681 at outlook dot com>

pkgname=typewriter-nocturne-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A literary, typewriter-inspired terminal based on Hyper"
arch=('x86_64')
url="https://github.com/Chaosnap/Typewriter-Nocturne"
license=('MIT')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libgcc'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nss'
  'pango'
)
optdepends=(
  'libappindicator: system tray icon support'
  'libnotify: desktop notifications'
  'libxss: screen saver inhibition while the terminal is active'
  'libxtst: XTest extension support'
)
provides=('typewriter-nocturne')
conflicts=('typewriter-nocturne' 'typewriter-nocturne-git')
options=('!strip' '!debug')
source=("$pkgname-$pkgver.AppImage::https://github.com/Chaosnap/Typewriter-Nocturne/releases/download/v$pkgver/Typewriter-Nocturne-$pkgver-linux-x86_64.AppImage"
        "LICENSE::https://github.com/Chaosnap/Typewriter-Nocturne/raw/v$pkgver/LICENSE")
sha256sums=('4dfdd79d580610d5448da3859b2ed1e50bd72d2a0a778e6867cf9ac7aefad56b'
            '703a8623a47d9c3aa9d4f9fc08f29b9e51aeabd106b13cb18ec20f96a11b919c')

prepare() {
  chmod +x "$srcdir/$pkgname-$pkgver.AppImage"
  "$srcdir/$pkgname-$pkgver.AppImage" --appimage-extract >/dev/null
}

package() {
  local appdir="$pkgdir/usr/lib/$pkgname"

  # Electron 应用本体（预编译二进制与资源）
  install -d "$appdir"
  cp -a --no-preserve=ownership "$srcdir/squashfs-root/." "$appdir/"

  # AppImage 运行器与为旧发行版捆绑的私有库：Arch 上由系统包提供
  rm -f  "$appdir/AppRun" \
         "$appdir/.DirIcon" \
         "$appdir/typewriter-nocturne.desktop" \
         "$appdir/typewriter-nocturne.png"
  rm -rf "$appdir/usr"

  # 清理构建环境遗留：Windows 专用源码与构建机绝对路径符号链接
  rm -rf "$appdir/resources/app.asar.unpacked/node_modules/node-pty/deps/winpty"
  find "$appdir" -type l -lname '*hostedtoolcache*' -delete
  find "$appdir" -type d -name node_gyp_bins -empty -delete

  # 内置 yarn 由 Electron 的 Node 运行，去掉会误导依赖检测的 shebang
  sed -i '1{/^#!\/usr\/bin\/env node$/d}' "$appdir/resources/bin/yarn-standalone.js"

  # 命令行入口
  install -d "$pkgdir/usr/bin"
  ln -s "../lib/$pkgname/typewriter-nocturne" "$pkgdir/usr/bin/typewriter-nocturne"
  ln -s "../lib/$pkgname/resources/bin/nocturne" "$pkgdir/usr/bin/nocturne"

  # 桌面入口
  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/$pkgname.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Typewriter Nocturne
GenericName=Terminal Emulator
Comment=A literary, typewriter-inspired terminal based on Hyper
Exec=typewriter-nocturne %U
Icon=typewriter-nocturne
Terminal=false
Categories=TerminalEmulator;System;
MimeType=x-scheme-handler/ssh;
StartupWMClass=Typewriter Nocturne
EOF

  # 图标
  install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/0x0/apps/typewriter-nocturne.png" \
    "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/typewriter-nocturne.png"

  # 许可证
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

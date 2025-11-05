# Maintainer: yiboxiaotian@nuaa.edu.cn
pkgname=musicfree
pkgver=0.0.8
pkgrel=1
pkgdesc="一个插件化的音乐播放器"
arch=('x86_64')
url="https://github.com/Ebotian/Musicfree"
license=('AGPL3')
depends=('glib2' 'gtk3' 'atk' 'at-spi2-core' 'at-spi2-atk' 'cairo' 'pango'
         'libx11' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr'
         'libxcb' 'libxkbcommon' 'alsa-lib' 'dbus' 'cups' 'libdrm' 'mesa'
         'vulkan-icd-loader' 'nss' 'nspr' 'expat' 'gcc-libs'
         'gvfs' 'hicolor-icon-theme' 'kde-cli-tools' 'libnotify' 'trash-cli' 'xdg-utils')
optdepends=('pulseaudio: Use PulseAudio if installed')
source=("https://github.com/Ebotian/Musicfree/releases/download/v${pkgver}/musicfree-${pkgver}.tar.gz")
sha256sums=('e0b290de4a93e3adca446acb042a4868c4586b5875d72b3b6f9f491e3c3b345c')

package() {
  cd "$srcdir"

  # Create target dirs
  install -d "$pkgdir/usr/lib/musicfree"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/pixmaps"

  # Copy the whole app dir into /usr/lib/musicfree preserving symlinks & files
  # Use $srcdir explicit paths in case makepkg extracts files into $srcdir
  if [ -d "$srcdir/usr/lib/musicfree" ]; then
    cp -a "$srcdir/usr/lib/musicfree/"* "$pkgdir/usr/lib/musicfree/" || true
  fi

  # Make sure main binary is executable
  if [ -f "$pkgdir/usr/lib/musicfree/MusicFree" ]; then
    chmod 755 "$pkgdir/usr/lib/musicfree/MusicFree"
  fi

  # Create symlink in /usr/bin
  ln -sf ../lib/musicfree/MusicFree "$pkgdir/usr/bin/musicfree"

  # Install desktop entry and icon from source (source path in $srcdir)
  if [ -f "$srcdir/usr/share/applications/musicfree.desktop" ]; then
    install -Dm644 "$srcdir/usr/share/applications/musicfree.desktop" "$pkgdir/usr/share/applications/musicfree.desktop"
  fi
  if [ -f "$srcdir/usr/share/pixmaps/musicfree.png" ]; then
    install -Dm644 "$srcdir/usr/share/pixmaps/musicfree.png" "$pkgdir/usr/share/pixmaps/musicfree.png"
  fi
}

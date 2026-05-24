# Maintainer: 古方元水 <ye@archlinux>
# Contributor: 糯米狐 <nuomihu@archlinux>

pkgname=hanako-bin
pkgver=0.222.30
pkgrel=2
pkgdesc="Hanako - a personal AI agent with memory and soul (Linux desktop app)"
arch=('x86_64')
url="https://github.com/liliMozi/openhanako"
license=('MIT')
depends=(
  'gtk3'
  'libxss'
  'libxtst'
  'libxkbcommon'
  'libxrandr'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxext'
  'libxrender'
  'nss'
  'nspr'
  'cups'
  'mesa'
  'egl-wayland'
  'at-spi2-core'
  'libcups'
  'dbus'
  'libappindicator-gtk3'
)
optdepends=(
  'pipewire: audio support'
  'pulseaudio: audio support (fallback)'
)
options=('!strip')
provides=('hanako')
conflicts=('hanako')
source=("https://github.com/liliMozi/openhanako/releases/download/v${pkgver}/Hanako-${pkgver}-Linux-x86_64.AppImage"
        "Hanako-280.png")
sha512sums=('551d869c897d3224e7121e24ed512a6fadc8e9200fb028d0536cf4833c1598e395aa2b1814faf32edbf1ed119fdf090e5215bcfdc91b8bb74e086bea2f25faad'
            'SKIP')

prepare() {
  cd "${srcdir}"
  # Extract AppImage
  chmod +x "Hanako-${pkgver}-Linux-x86_64.AppImage"
  ./"Hanako-${pkgver}-Linux-x86_64.AppImage" --appimage-extract
}

package() {
  cd "${srcdir}/squashfs-root"

  # Main app directory
  install -dm755 "${pkgdir}/opt/hanako"

  # Copy all extracted files
  cp -r . "${pkgdir}/opt/hanako/"

  # Clean up unnecessary files
  rm -f "${pkgdir}/opt/hanako/.DirIcon"
  rm -rf "${pkgdir}/opt/hanako/.install"

  # Symlink binary
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/hanako" << 'BINEOF'
#!/bin/sh
exec /opt/hanako/hanako "$@"
BINEOF

  # Desktop entry from the AppImage
  install -Dm644 hanako.desktop "${pkgdir}/usr/share/applications/hanako.desktop"

  # Icon
  install -Dm644 "${srcdir}/Hanako-280.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/hanako.png"
}

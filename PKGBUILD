# Maintainer: Chizuru-Kagurazaka <chizuru-mtf@outlook.com>
# Maintainer: bilibili_xiaok <the_xiaok@qq.com>
# Maintainer: Volodia Kraplich <v1mkss.m@gmail.com>

pkgname=xmcl-launcher
pkgver=0.53.1
pkgrel=1
pkgdesc="X Minecraft Launcher - A modern, open-source Minecraft Launcher with modpack, resource, and instance management"
arch=('x86_64' 'aarch64')
url="https://xmcl.app/"
license=('MIT')
provides=('xmcl')
conflicts=('xmcl-launcher-bin')
optdepends=(
  'jre8-openjdk: Minimum requirement for launching older game versions'
  'jre17-openjdk: Recommended Java version for launching version 1.17 and above'
  'jre21-openjdk: Recommended Java version for launching version 1.20.5+ and above'
)
makedepends=('curl' 'libarchive')
options=('!strip' '!debug')

source=("xmcl.desktop" "xmcl.png")
source_x86_64=("xmcl-${pkgver}-x64.tar.xz::https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-x64.tar.xz")
source_aarch64=("xmcl-${pkgver}-arm64.tar.xz::https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/xmcl-${pkgver}-arm64.tar.xz")

sha256sums=('4375d3753d3035aa868a04810d96d896045078f364f0d096986ab66d4b68f0b4'
            '312763b5fa502280a694a78fd1e55a400b345e7d571020ee863e67db8f1eaec4')
sha256sums_x86_64=('429c006d7a067000188c84e741bd6fb0bc62ef22829e519fa160b67b3e8cc827')
sha256sums_aarch64=('b40a2a013325117982aaa3c4211935103b8d9a038dfebb0bf6fdf34c407e1200')

prepare() {
  # Extract the appropriate archive based on architecture
  if [[ "$CARCH" == "x86_64" ]]; then
    bsdtar -xf "xmcl-${pkgver}-x64.tar.xz"
  elif [[ "$CARCH" == "aarch64" ]]; then
    bsdtar -xf "xmcl-${pkgver}-arm64.tar.xz"
  fi
}

package() {
  # Determine the extracted directory name based on architecture
  if [[ "$CARCH" == "x86_64" ]]; then
    _extracted_dir="xmcl-${pkgver}-x64"
  elif [[ "$CARCH" == "aarch64" ]]; then
    _extracted_dir="xmcl-${pkgver}-arm64"
  fi
  
  cd "${_extracted_dir}"
  
  # Install application files
  install -dm755 "${pkgdir}/opt/xmcl"
  
  # Check different possible layouts and copy all files
  if [[ -d "opt/xmcl" ]]; then
    # opt/xmcl structure exists
    cp -r opt/xmcl/* "${pkgdir}/opt/xmcl/"
  elif [[ -f "xmcl" ]]; then
    # Direct executable at root
    cp -r ./* "${pkgdir}/opt/xmcl/"
  else
    error "Cannot determine archive layout"
    return 1
  fi

  install -Dm644 "${srcdir}/xmcl.desktop" "${pkgdir}/usr/share/applications/xmcl.desktop"
  
  install -Dm644 "${srcdir}/xmcl.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/xmcl.png"
  
  # Create executable symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf /opt/xmcl/xmcl "${pkgdir}/usr/bin/xmcl"
  
  # Set proper permissions
  chmod 755 "${pkgdir}/opt/xmcl/xmcl"
  [[ -f "${pkgdir}/opt/xmcl/chrome-sandbox" ]] && chmod 4755 "${pkgdir}/opt/xmcl/chrome-sandbox"
}

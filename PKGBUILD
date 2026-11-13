# Maintainer: Timothy D Beach <beachtimothyd@gmail.com>
# Repackages Anthropic's official Claude Desktop Linux .deb, fetched from
# Anthropic's signed apt repo, for Arch / Artix / Aegix Linux.
pkgname=claude-desktop-aegix-bin
_pkgname=claude-desktop
pkgver=5.11492.0
pkgrel=1
pkgdesc="Desktop application for Claude.ai (official Linux build, repackaged for Arch/Artix/Aegix)"
arch=('x86_64' 'aarch64')
url="https://github.com/aegixlinux/claude-desktop-aegix"
license=('LicenseRef-Anthropic')
depends=('gtk3' 'libnotify' 'nss' 'xdg-utils' 'at-spi2-core' 'libdrm' 'mesa'
         'libxcb' 'libsecret' 'glibc' 'libxtst' 'util-linux-libs' 'pipewire'
         'xdg-desktop-portal' 'alsa-lib')
optdepends=('xdg-desktop-portal-gtk: file chooser dialogs outside GNOME/KDE (dwm, i3, etc.)'
            'gnome-keyring: secret storage for login tokens'
            'libappindicator-gtk3: tray icon'
            'bubblewrap: sandboxing for Claude Code / cowork features'
            'socat: cowork VM helper'
            'openssh: SSH remote sessions'
            'qemu-system-x86: cowork VM'
            'edk2-ovmf: cowork VM firmware')
provides=('claude-desktop')
conflicts=('claude-desktop')
options=('!strip' '!debug')
_repo="https://downloads.claude.ai/claude-desktop/apt/stable/pool/main/c/claude-desktop"
source=("claude-desktop.sh")
source_x86_64=("${_pkgname}_${pkgver}_amd64.deb::${_repo}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("${_pkgname}_${pkgver}_arm64.deb::${_repo}/${_pkgname}_${pkgver}_arm64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb" "${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('SKIP')
sha256sums_x86_64=('9c5cf5d4c8b2356779a3dde7dedfe1c301a7223971597198213d815fe8ccfa55')
sha256sums_aarch64=('0705809bfc8c72877aab551cca99b2ff8632849897f47144096c6f18ad3848cf')

prepare() {
  local _debarch=amd64
  [[ $CARCH == aarch64 ]] && _debarch=arm64
  rm -rf deb && mkdir deb && cd deb
  bsdtar -xf "../${_pkgname}_${pkgver}_${_debarch}.deb" data.tar.xz
  bsdtar -xf data.tar.xz
  rm data.tar.xz
}

package() {
  cd deb
  install -d "$pkgdir/usr/lib" "$pkgdir/usr/share"
  cp -a usr/lib/claude-desktop "$pkgdir/usr/lib/"
  # Chromium setuid sandbox fallback, used when unprivileged user namespaces are off.
  chmod 4755 "$pkgdir/usr/lib/claude-desktop/chrome-sandbox"

  install -Dm755 "$srcdir/claude-desktop.sh" "$pkgdir/usr/bin/claude-desktop"

  cp -a usr/share/icons "$pkgdir/usr/share/"
  install -Dm644 usr/share/applications/com.anthropic.Claude.desktop \
    "$pkgdir/usr/share/applications/com.anthropic.Claude.desktop"

  # .mcpb / .dxt / .skill MIME types (pacman hooks run update-mime-database).
  install -Dm644 usr/lib/claude-desktop/resources/linux-mime/com.anthropic.Claude.xml \
    "$pkgdir/usr/share/mime/packages/com.anthropic.Claude.xml"

  install -Dm644 usr/lib/claude-desktop/LICENSES.chromium.html \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"
}

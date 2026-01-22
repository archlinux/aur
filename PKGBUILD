# Maintainer: Zixiao System <hwllochen@qq.com>
pkgname=logos-bin
pkgver=2026.4.7
pkgrel=1
pkgdesc="A Modern, Lightweight Code Editor"
arch=('x86_64')
url="https://github.com/Zixiao-System/logos"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst')
optdepends=(
  'git: Git integration'
  'bash: Terminal support'
  'zsh: ZSH terminal support'
)
provides=('logos')
conflicts=('logos' 'logos-git')
source_x86_64=("${pkgname}-${pkgver}.AppImage::https://github.com/Zixiao-System/logos/releases/download/v${pkgver}/Logos-2026.4.7.AppImage")
sha256sums_x86_64=('5a94ecb281538ec61bc0873254350afd24b9c978a1f8da70a9dc76ac0774e599')
options=('!strip')

prepare() {
  chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
  "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -dm755 "${pkgdir}/opt/${pkgname}"
  cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
  chmod 755 "${pkgdir}/opt/${pkgname}/logos"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/logos" "${pkgdir}/usr/bin/logos"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/logos.desktop" << EOF
[Desktop Entry]
Name=Logos
Comment=A Modern, Lightweight Code Editor
Exec=/opt/${pkgname}/logos %U
Icon=logos
Type=Application
Categories=Development;IDE;TextEditor;
MimeType=text/plain;inode/directory;
StartupWMClass=Logos
EOF

  for size in 16 32 48 64 128 256 512; do
    if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/logos.png" ]; then
      install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/logos.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/logos.png"
    fi
  done

  if [ -f "${srcdir}/squashfs-root/LICENSE" ]; then
    install -Dm644 "${srcdir}/squashfs-root/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

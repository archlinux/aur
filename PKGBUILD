pkgname=ehentai-qt-bin
pkgver=1.1.4
pkgrel=3
pkgdesc="e-hentai, exhentai，看图，搜索，下载器"
arch=("x86_64")
url="https://github.com/tonquer/ehentai-qt"
license=("LGPL3")
source=("https://github.com/tonquer/ehentai-qt/releases/download/v${pkgver}/ehentai_v${pkgver}_linux-x86_64.AppImage")
sha256sums=('57593d927c1abd01d867e3dbc19ec778b5ce54f6e19a0734940703ca1f2af2b6')
provides=("ehentai-qt-bin=${pkgver}")
options=(!strip)
_image="$(basename ${source[0]})"

prepare() {
  cd "${srcdir}"
  chmod +x "${_image}"
  ./"${_image}" --appimage-extract 
  rm "${srcdir}/squashfs-root/usr/bin/libcrypt.so.1"
  cat > "${srcdir}/ehentai-qt.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=E-Hentai
Exec=ehentai-qt
Comment=EHentai
Icon=ehentai
Categories=Graphics;
EOF
}

package() {
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/usr/bin"
  cp -r --no-preserve=mode,ownership "${srcdir}/squashfs-root/usr/bin" "${pkgdir}/opt/ehentai-qt"
  chmod +x "${pkgdir}/opt/ehentai-qt/EHentai"
  ln -s "/opt/ehentai-qt/EHentai" "${pkgdir}/usr/bin/ehentai-qt"
  install -Dm644 "${srcdir}/ehentai-qt.desktop" "${pkgdir}/usr/share/applications/ehentai-qt.desktop"
  for size in 16x16 32x32 48x48 128x128 256x256 512x512; do
    install -Dm644 "${srcdir}/squashfs-root/EHentai.png" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/ehentai.png"
  done
}

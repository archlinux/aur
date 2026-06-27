# Maintainer: duanluan <duanluan@outlook.com>

pkgname=alexandria-bin
_pkgname=alexandria
_appname=Alexandria
pkgver=0.13.2
pkgrel=3
pkgdesc='Minimalistic ebook reader (prebuilt binary)'
arch=('x86_64')
url='https://github.com/btpf/Alexandria'
license=('unknown')
depends=('fuse2' 'gtk3' 'webkit2gtk-4.1')
provides=('alexandria')
conflicts=('alexandria')
options=('!strip')
source=("${_appname}_${pkgver}_amd64.AppImage::https://github.com/btpf/Alexandria/releases/download/v0.13.2/${_appname}_${pkgver}_amd64.AppImage")
sha256sums=('67dfbf9fe6a6c0f8e510b15809c6421ee8a150a465340393a89634704ec69125')

package() {
  local appimage="${srcdir}/${_appname}_${pkgver}_amd64.AppImage"
  local extract_dir="${srcdir}/appimage-extract"

  chmod +x "${appimage}"
  rm -rf "${extract_dir}"
  install -dm755 "${extract_dir}"

  (
    cd "${extract_dir}"
    "${appimage}" --appimage-extract >/dev/null
  )

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  install -Dm755 "${appimage}" "${pkgdir}/opt/${_pkgname}/${_appname}_${pkgver}_amd64.AppImage"
  install -dm755 "${pkgdir}/usr/bin"
  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${_pkgname}" <<'SCRIPT'
#!/bin/sh
exec /opt/alexandria/Alexandria_0.13.2_amd64.AppImage "$@"
SCRIPT
  install -Dm644 "${extract_dir}/squashfs-root/usr/share/applications/alexandria.desktop" "${pkgdir}/usr/share/applications/alexandria.desktop"
  install -Dm644 "${extract_dir}/squashfs-root/usr/share/icons/hicolor/32x32/apps/alexandria.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/alexandria.png"
  install -Dm644 "${extract_dir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/alexandria.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/alexandria.png"
  install -Dm644 "${extract_dir}/squashfs-root/usr/share/icons/hicolor/256x256@2/apps/alexandria.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/alexandria.png"
}

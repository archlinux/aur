# Maintainer: Tymon3310 <aur@tymon3310.dev>

_pkgname=vial-keychron
_Pkgname=Vial

pkgname="${_pkgname}-bin"
pkgver=0.8.4
pkgrel=1
pkgdesc="Vial is an open-source cross-platform (Windows, Linux and Mac) GUI and a QMK fork for configuring your keyboard in real time, similar to VIA. Keychron branch."
arch=('x86_64')
url="https://github.com/Tymon3310/vial-gui"
license=("GPL-2.0-only")
options=(!strip !debug)
provides=("vial" "vial-keychron")
conflicts=("vial" "vial-appimage" "vial-git" "vial-keychron-git")
depends=("hicolor-icon-theme" "glibc" "gcc-libs" "zlib" "expat" "freetype2" "libpng" "fontconfig")
makedepends=("fuse2")
_appimage="Vial-x86_64.AppImage"
source_x86_64=("${_appimage}::https://github.com/Tymon3310/vial-gui/releases/download/v${pkgver}/Vial-x86_64.AppImage"
  "59-vial.rules")
noextract=("${_appimage}")
sha256sums_x86_64=('b6ab2002e29e2f2ed3a861a62468ab6ad7d51a2f9b117d3c1d85422212fa3d9f'
                   'a6af0820ee6960dccab9ce0df0a898ccd0a50fecd992e341656dd1af78680502')

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  cd squashfs-root

  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=Vial|Exec=/usr/bin/${_pkgname}|" "${_Pkgname}.desktop"

  # Remove problematic bundled libraries that conflict with Arch system libraries (fixes xcb Qt plugin crash)
  rm -f _internal/libstdc++.so*
  rm -f _internal/libgcc_s.so*
  rm -f _internal/libz.so*
  rm -f _internal/libglib-2.0.so*
  rm -f _internal/libgthread-2.0.so*
  rm -f _internal/libdbus-1.so*
  rm -f _internal/libuuid.so*
  rm -f _internal/libexpat.so*
  rm -f _internal/libcrypt.so*
  rm -f _internal/libcrypto.so*
  rm -f _internal/libssl.so*
  rm -f _internal/libffi.so*
  rm -f _internal/liblzma.so*
  rm -f _internal/libfontconfig.so*
  rm -f _internal/libfreetype.so*
  rm -f _internal/libpng16.so*
  rm -f _internal/libsystemd.so*
}

package() {
  # Create directories
  install -dm755 "$pkgdir/opt/${_pkgname}"
  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/share/applications"
  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -dm755 "$pkgdir/usr/lib/udev/rules.d"

  # Copy the extracted and cleaned application
  cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${_pkgname}/"

  # Fix permissions
  find "$pkgdir/opt/${_pkgname}" -type d -exec chmod 755 {} \;
  find "$pkgdir/opt/${_pkgname}" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/opt/${_pkgname}/Vial"
  chmod 755 "$pkgdir/opt/${_pkgname}/AppRun"

  # Desktop file
  install -Dm644 "${pkgdir}/opt/${_pkgname}/${_Pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon image
  install -Dm644 "${pkgdir}/opt/${_pkgname}/Vial.png" \
    "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
  sed -i "s|Icon=Vial|Icon=${_pkgname}|" "$pkgdir/usr/share/applications/${_pkgname}.desktop"

  # Symlink executable
  ln -s "/opt/${_pkgname}/Vial" "${pkgdir}/usr/bin/${_pkgname}"

  # Create udev rule
  install -Dm644 "$srcdir/59-vial.rules" "$pkgdir/usr/lib/udev/rules.d/59-vial.rules"
}

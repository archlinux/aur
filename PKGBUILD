# Maintainer: BrokenC1oud <jgbsxx20130315@gmail.com>
#
# Based on the original `clash-nyanpasu-appimage` PKGBUILD by timochan.
# This package ships the official upstream AppImage with the bundled clash-rs
# core repaired: linuxdeploy/patchelf relocated its .dynamic section while
# packaging the AppImage, which makes the core segfault on every invocation
# (see fix-clash-rs.py for the details). The AppImage is repacked with the
# original runtime and gzip compression.

_pkgname=clash-nyanpasu
_Pkgname=clash-nyanpasu
_disname=clash-nyanpasu
major_version=1
minor_version=6
patch_version=1

pkgname="${_pkgname}-appimage-fixed"
pkgver="${major_version}.${minor_version}.${patch_version}"
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64')
url="https://github.com/LibNyanpasu/clash-nyanpasu"
license=('GPL3')
options=('!strip' '!debug')
depends=('zlib' 'hicolor-icon-theme' 'fuse2' 'clash-meta')
makedepends=('python' 'squashfs-tools')
conflicts=('clash-nyanpasu-git' 'clash-nyanpasu-bin' 'clash-nyanpasu' 'clash-nyanpasu-appimage')
provides=('clash-nyanpasu')
optdepends=('clash-rs: custom protocol network proxy, coding with rust')
source=('fix-clash-rs.py')
source_x86_64=("${_Pkgname}-${major_version}.${minor_version}.${patch_version}-amd64.AppImage::https://github.com/LibNyanpasu/clash-nyanpasu/releases/download/v${major_version}.${minor_version}.${patch_version}/${_Pkgname}_${major_version}.${minor_version}.${patch_version}_amd64.AppImage")
sha256sums=('bbee0308564af5b04780b5340eb2b847b95be8a5252209aa8045c2761a4312c5')
sha256sums_x86_64=('6eec61b0efd7e28ac285a31803626071e7b26d6465af23ea6353e517ef4aa0d2')

_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}-amd64.AppImage"
_repaired_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}-amd64-repaired.AppImage"
noextract=("${_appimage}")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract

  # Reproduce the fix for the broken bundled clash-rs core, then drop the
  # backup so it does not end up inside the repacked AppImage.
  python3 "$srcdir/fix-clash-rs.py" "squashfs-root/usr/bin/clash-rs"
  rm -f "squashfs-root/usr/bin/clash-rs.orig"
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i \
    -e "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_pkgname}|" \
    -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
    "squashfs-root/${_disname}.desktop"

  # Make sure everything is world-readable (the AppImage mount can expose
  # 700 directories), but keep the executable bits: this tree is repacked
  # into the new AppImage below, unlike in the original PKGBUILD where only
  # the icon/desktop files were taken from it.
  chmod -R a+rX squashfs-root/usr

  # Repack the AppDir into a new AppImage. Reuse the original runtime (it
  # carries the embedded update information) and its gzip compression, which
  # is the only format that runtime accepts besides xz.
  local _offset
  _offset=$(./"${_appimage}" --appimage-offset)
  head -c "${_offset}" "${_appimage}" > runtime.part
  rm -f rootfs.sqfs
  mksquashfs squashfs-root rootfs.sqfs \
    -noappend -no-progress -no-xattrs -all-root -comp gzip >/dev/null
  cat runtime.part rootfs.sqfs > "${_repaired_appimage}"
  chmod +x "${_repaired_appimage}"
}

package() {
  # AppImage (with the repaired clash-rs core)
  install -Dm755 "${srcdir}/${_repaired_appimage}" \
    "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  ln -s "$(realpath ${srcdir}/squashfs-root/${_disname}.png --relative-to ${srcdir}/squashfs-root/usr/share/icons)" \
    "${pkgdir}/usr/share/icons/${_pkgname}.png"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}

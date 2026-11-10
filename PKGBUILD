# Maintainer: 4s3ti <4s3ti@4s3ti.net>

_pkgver=1.12.0
# _tag and _appimage are rewritten by precommit.sh from the actual GitHub release,
# because upstream tag/asset naming is inconsistent. Only bump _pkgver by hand.
_tag="${_pkgver}"
_appimage="Bazecor-${_pkgver}-x64.AppImage"

_appname="bazecor"
pkgname="bazecor-beta"
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Graphical configurator for Dygma keyboards"
url="https://github.com/Dygmalab/Bazecor"
license=("GPL-3.0-only")
provides=("${pkgname}")
conflicts=("${pkgname}-git")
arch=("x86_64")
depends=('zlib' 'fuse2' 'bazecor')
options=(!strip)
noextract=("${_appimage}")

# https://github.com/Dygmalab/Bazecor/releases/download/v1.4.0-rc4/Bazecor-1.4.0-rc.4-x64.AppImage
source=("${url}/releases/download/${_tag}/${_appimage}")
sha256sums=('aab7187b787ace688e9f722b3b8736e8ba9317d9830cf15ad28e51e062eaed3e')

prepare() {
  chmod +x "${_appimage}"
  "./${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i -E "s|Exec=AppRun|Exec=env DESKTOPINTEGRATION=false /usr/bin/${_appname/b/B}|" \
    "squashfs-root/${_appname/b/B}.desktop"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
  # Do not use Capital B for exec, and use bazecor-beta instead
  sed -i "s/Exec=Bazecor/Exec=bazecor-beta/" "squashfs-root/${_appname/b/B}.desktop"
}

package() {
  install -Dm755 "${srcdir}/${_appimage}" "${pkgdir}/opt/${pkgname}/${_appimage}"

  # Desktop file for X
  install -Dm644 "${srcdir}/squashfs-root/${_appname/b/B}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Desktop file for Wayland
  if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
    electronFlags="--UseOzonePlatform --ozone-platform-hint=wayland %U"
    sed -i "s/%U/${electronFlags}/" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  fi

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/${pkgname}"
}

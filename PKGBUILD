# Maintainer: duanluan <duanluan@outlook.com>

pkgname=rebased-bin
_pkgname=rebased
pkgver=1.0.9
pkgrel=1
pkgdesc='Standalone JetBrains-based Git client (prebuilt binary)'
arch=('x86_64')
url='https://github.com/DetachHead/rebased'
license=('Apache-2.0')
depends=('fontconfig' 'giflib' 'hicolor-icon-theme' 'libdbusmenu-glib' 'ttf-font')
optdepends=('xdg-utils: open URLs from the IDE')
provides=('rebased')
conflicts=('rebased')
options=('!strip')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/DetachHead/rebased/releases/download/1.0.9/rebased.tar.gz")
sha256sums=('75df29f91824f39e36e83c21653d3d7251082f70dacb271731b589f6ca21bf46')

package() {
  source_root=""

  for candidate in "${srcdir}"/idea-IC-* "${srcdir}"/ideaIC-* "${srcdir}"/rebased* "${srcdir}"/Rebased*; do
    if [[ -d "${candidate}" ]]; then
      source_root="${candidate}"
      break
    fi
  done

  if [[ -z "${source_root}" ]]; then
    printf 'failed to locate extracted source tree\n' >&2
    return 1
  fi

  install -dm755 "${pkgdir}/opt/${_pkgname}"
  cp -a "${source_root}/." "${pkgdir}/opt/${_pkgname}/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/bin/idea" "${pkgdir}/usr/bin/rebased"

  install -Dm644 "${source_root}/bin/idea.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/rebased.svg"
  install -Dm644 "${source_root}/bin/idea.png" "${pkgdir}/usr/share/pixmaps/rebased.png"
  install -Dm644 "${source_root}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 "${source_root}/NOTICE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"

  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/rebased.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Version=1.0
Name=Rebased
Comment=Standalone Git client based on the IntelliJ platform
Exec=rebased %f
Icon=rebased
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-rebased
Categories=Development;IDE;VersionControl;
Keywords=git;vcs;jetbrains;
DESKTOP
}

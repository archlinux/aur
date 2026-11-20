# Maintainer: Luke Bubar <luke@coldmail.xyz>

pkgname=red-two-bin
_pkgname=red-two
pkgver=1.2
pkgrel=1
_tag="v${pkgver}"
_appimage="RedTwo-v${pkgver}-x86_64.AppImage"
_installdir="/opt/${_pkgname}"
pkgdesc="Static recompilation of Star Wars: Rogue Squadron II - Rogue Leader (GameCube) for PC (prebuilt, needs your own USA disc image)"
arch=('x86_64')
url="https://github.com/gminustwo/red_two"
# Red Two's own code is MIT. The recompiled game code in the AppImage is not.
license=('MIT' 'LicenseRef-custom')
depends=(
  'glibc>=2.38'
  'gcc-libs'            # replaces any libstdc++/libgcc_s the AppImage bundles
  'sdl3'                # replaces the bundled copy
  'vulkan-icd-loader'   # Aurora renders through Dawn (WebGPU) on Vulkan
  'vulkan-driver'       # vulkan-radeon, vulkan-intel or nvidia-utils
  'hicolor-icon-theme'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
install="${pkgname}.install"
source=(
  "${_appimage}::${url}/releases/download/${_tag}/${_appimage}"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/gminustwo/red_two/${_tag}/LICENSE"
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
)
noextract=("${_appimage}")
sha256sums=('0066ecaea397510d3652b8eef2e5c8c447ee3e07b68614e88b51a7f809609661'
            '2b4d4c1ca64a0110170e9f1804ef1a60af12e932a95f09eefc406416c4dd589d'
            '3efb511ae445bf342b7c37980c392f45e5d0e953a85fcd426b8c0ac67a0d2fe1'
            '813f91652a7d84f53d21bd251e4efb1609e86270ae5a9491bf34c2b4df362d7b')

prepare() {
  cd "${srcdir}"
  rm -rf squashfs-root
  chmod +x "${_appimage}"
  # Unpacks the AppImage without FUSE. This runs only the AppImage runtime,
  # not the game.
  "./${_appimage}" --appimage-extract >/dev/null
}

package() {
  local _root="${srcdir}/squashfs-root"
  local _dest="${pkgdir}${_installdir}"
  local _icon

  if [[ ! -e "${_root}/AppRun" ]]; then
    error "AppRun not found in the unpacked AppImage; its layout changed."
    return 1
  fi

  install -dm755 "${_dest}"
  cp -r --no-preserve=ownership "${_root}/." "${_dest}/"

  # Use system libraries instead of bundled copies. An older bundled
  # libstdc++/libgcc_s can stop Mesa's drivers from loading on Arch, and the
  # system SDL3 is newer. Delete this line to go back to the bundled ones.
  find "${_dest}" \( -name 'libstdc++.so*' -o -name 'libgcc_s.so*' -o -name 'libSDL3.so*' \) -delete

  chmod -R u=rwX,go=rX "${_dest}"

  # Launcher, with APP_DIR pointed at wherever _installdir says.
  sed "s|^APP_DIR=\"[^\"]*\"|APP_DIR=\"${_installdir}\"|" \
    "${srcdir}/${_pkgname}.sh" > "${srcdir}/${_pkgname}.launcher"
  install -Dm755 "${srcdir}/${_pkgname}.launcher" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

  # Icon: the AppImage's top-level .png, or .DirIcon if that's all there is.
  _icon="$(find "${_root}" -maxdepth 1 -name '*.png' -print -quit)"
  if [[ -z "${_icon}" && -e "${_root}/.DirIcon" ]]; then
    _icon="${_root}/.DirIcon"
  fi
  if [[ -n "${_icon}" ]]; then
    install -Dm644 "${_icon}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  fi

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

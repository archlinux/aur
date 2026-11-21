# Maintainer: Luke Bubar <YOUR-EMAIL>

pkgname=dx-rust-bin
_pkgname=dx-rust
pkgver=0.13.0
pkgrel=1
_tag="v${pkgver}"
# Upstream's Linux asset has no version in its name, so the download is
# renamed below to keep versions apart.
_asset="dxrust-steamdeck.tar.xz"
_installdir="/opt/${_pkgname}"
pkgdesc="Deus Ex rebuilt from scratch in Rust on the Bevy engine (prebuilt release, needs your own Deus Ex: GOTY)"
arch=('x86_64')
url="https://github.com/Grissyelda/dx-rust"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'gcc-libs'
  'alsa-lib'            # audio
  'libudev.so'          # gamepads (gilrs, hidapi); systemd-libs on Arch
  'vulkan-icd-loader'   # Bevy renders through wgpu on Vulkan
  'vulkan-driver'       # vulkan-radeon, vulkan-intel or nvidia-utils
  'libglvnd'            # the egui launcher draws with OpenGL
  'libxkbcommon'
  'wayland'
  'libxkbcommon-x11'    # X11 sessions
  'libx11'
  'libxcursor'
  'libxi'
  'libxrandr'
)
optdepends=('steam: install Deus Ex: GOTY; DX RUST searches Steam libraries itself')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
install="${pkgname}.install"
source=(
  "${_pkgname}-${pkgver}-linux.tar.xz::${url}/releases/download/${_tag}/${_asset}"
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
)
noextract=("${_pkgname}-${pkgver}-linux.tar.xz")
sha256sums=('353f743518d0916e1e5a79e34bb8c696ea90ecfeb6f859b3626aa02672ad37c2'
            'c8cf5930f4aa89e38e1463d58ee3059894d024b0f6a28fc2db9113d749faa105'
            '292667d49ea4e8b11d048b38c9c0e5b52b6e0c5e3a62b6a9b986fad00a712d8f')

prepare() {
  # Extract into its own folder so the game files can't mix with the other
  # sources, whether or not the tarball has a top-level folder.
  rm -rf "${srcdir}/game"
  mkdir -p "${srcdir}/game"
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-linux.tar.xz" -C "${srcdir}/game"
}

package() {
  local _dest="${pkgdir}${_installdir}"
  local _launcher _src

  _launcher="$(find "${srcdir}/game" -type f -name dxlauncher -print -quit)"
  if [[ -z "${_launcher}" ]]; then
    error "dxlauncher not found in the release tarball; its layout changed."
    return 1
  fi
  _src="$(dirname "${_launcher}")"
  if [[ ! -f "${_src}/dxview" ]]; then
    error "dxview not found next to dxlauncher; the tarball's layout changed."
    return 1
  fi

  install -dm755 "${_dest}"
  cp -r --no-preserve=ownership "${_src}/." "${_dest}/"
  chmod -R u=rwX,go=rX "${_dest}"
  chmod 755 "${_dest}/dxlauncher" "${_dest}/dxview"

  # Checksum list of every shipped file. The launcher uses it to tell when
  # the package changed and which files in a user's copy were modified.
  (cd "${_dest}" && find . -type f -print0 | sort -z | xargs -0 -r sha256sum) \
    > "${srcdir}/package-manifest"
  install -m644 "${srcdir}/package-manifest" "${_dest}/.package-manifest"

  # Launcher, with GAME_DIR pointed at wherever _installdir says.
  sed "s|^GAME_DIR=\"[^\"]*\"|GAME_DIR=\"${_installdir}\"|" \
    "${srcdir}/${_pkgname}.sh" > "${srcdir}/${_pkgname}.launcher"
  install -Dm755 "${srcdir}/${_pkgname}.launcher" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}

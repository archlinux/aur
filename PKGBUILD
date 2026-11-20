# Maintainer: Luke Bubar <YOUR-EMAIL>

pkgname=project-midas-bin
_pkgname=project-midas
pkgver=1.0.2b
pkgrel=1
# Upstream tags have no leading "v" (1.0.2b), but the asset names do.
_tag="${pkgver}"
_installdir="/opt/${_pkgname}"
pkgdesc="PC port of GoldenEye 007 built from the N64 decompilation (prebuilt release, needs your own US ROM)"
arch=('x86_64')
url="https://github.com/murkantor/Project-Midas"
# Port code is MIT. The decompiled game code is not covered by any license.
license=('MIT' 'LicenseRef-custom')
# Upstream's Linux build is 32-bit (i686), so everything comes from [multilib]
# ([lib32] on Artix).
depends=(
  'lib32-glibc'
  'lib32-gcc-libs'
  'lib32-sdl2'            # provided by lib32-sdl2-compat; replaces the bundled copy
  'lib32-libgl'
  'lib32-opengl-driver'   # lib32-mesa or lib32-nvidia-utils
)
optdepends=(
  'lib32-libpulse: sound through PulseAudio or pipewire-pulse'
  'lib32-pipewire: sound through PipeWire'
  'lib32-alsa-lib: sound through ALSA'
  'zenity: graphical ROM picker on first run'
  'kdialog: graphical ROM picker on first run (KDE)'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
install="${pkgname}.install"
# 1.0 and 1.0.1 shipped as .7z; if upstream goes back to that, add
# makedepends=('7zip') and extract with 7z in prepare().
source=(
  "${_pkgname}-${pkgver}-linux.zip::${url}/releases/download/${_tag}/ProjectMidas-v${pkgver}-linux.zip"
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/murkantor/Project-Midas/${_tag}/LICENSE"
  "${_pkgname}.sh"
  "${_pkgname}.desktop"
)
noextract=("${_pkgname}-${pkgver}-linux.zip")
sha256sums=('22bcdb5204aa4ae04a7f8d569aab8b1b64e4dd46ee89f98740b1d12540545685'
            '804bb5c3a946265e9859e1eef978a24ade71ef6935fe6aa696c15bf8029691e7'
            'da3c8636d52bd00af63ca258dfec17332a37f2d6ba773ed88cd2cb38f8c5268b'
            '41163708dc843f23ae5a5fad7ffb71c2d9145a42c562d1cedfa45c7d515434de')

prepare() {
  # Extract into its own folder so the game files can't mix with the other
  # sources, whether or not the zip has a top-level folder.
  rm -rf "${srcdir}/game"
  mkdir -p "${srcdir}/game"
  bsdtar -xf "${srcdir}/${_pkgname}-${pkgver}-linux.zip" -C "${srcdir}/game"
}

package() {
  local _dest="${pkgdir}${_installdir}"
  local _bin _src

  _bin="$(find "${srcdir}/game" -type f -name ProjectMidas -print -quit)"
  if [[ -z "${_bin}" ]]; then
    error "ProjectMidas not found in the release zip; the archive layout changed."
    return 1
  fi
  _src="$(dirname "${_bin}")"

  # The lib32 depends assume a 32-bit ELF (EI_CLASS byte: 1 = 32-bit, 2 = 64-bit).
  if [[ "$(od -An -t u1 -j4 -N1 "${_bin}" | tr -d ' ')" != 1 ]]; then
    error "ProjectMidas is no longer a 32-bit binary; update depends and arch."
    return 1
  fi

  install -dm755 "${_dest}"
  cp -r --no-preserve=ownership "${_src}/." "${_dest}/"

  # Use the system's lib32-sdl2 instead of the copy upstream bundles.
  # Delete these two lines to go back to the bundled one.
  find "${_dest}" -name 'libSDL2*.so*' -delete
  find "${_dest}" -mindepth 1 -type d -empty -delete

  # Don't ship user state; the game creates it on first run.
  rm -f "${_dest}/midas.ini"

  chmod -R u=rwX,go=rX "${_dest}"
  chmod 755 "${_dest}/ProjectMidas"

  # Launcher, with GAME_DIR pointed at wherever _installdir says.
  sed "s|^GAME_DIR=\"[^\"]*\"|GAME_DIR=\"${_installdir}\"|" \
    "${srcdir}/${_pkgname}.sh" > "${srcdir}/${_pkgname}.launcher"
  install -Dm755 "${srcdir}/${_pkgname}.launcher" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "${srcdir}/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  find "${_dest}" -maxdepth 2 -type f \( -iname '*THIRD_PARTY*' -o -iname 'LICENSE*' \) \
    -exec install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" {} +
}

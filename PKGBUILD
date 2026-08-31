# Maintainer: Patryk Rozanski <rozanski.patryk@gmail.com>
# Contributor: Chinna95P <chinna95p@github>

pkgname=mpv-anime-build
_pkgname=mpv-anime-build
pkgver=5.2
pkgrel=1
pkgdesc="Advanced MPV configuration build optimized for anime and high-quality video playback"
arch=('any')
url="https://github.com/Chinna95P/mpv-anime-build"
license=('MIT')
depends=('mpv')
optdepends=(
  'yt-dlp: for streaming and downloading YouTube/web videos'
  'ffmpeg: for video filtering and thumbnail cache support'
  'vapoursynth: for advanced frame interpolation and filtering'
)
provides=('mpv-anime-build')
conflicts=('mpv-anime-build')
source=(
  "${pkgname}-${pkgver}.zip::https://github.com/Chinna95P/mpv-anime-build/releases/download/v${pkgver}/mpv-anime-build-v${pkgver}.zip"
  "mpv-anime-build.sh"
  "mpv-anime.desktop"
)
sha256sums=('c7407bc871ecccfc73799a67bd6b19d960033f73ac9038bc12cbff568ee12637'
            '212d17934f0a3fc793e4f9591c62cfa1db1de983172ec1b51e9ac90ff555cc3f'
            'f55715888919cd92307a12dd345af1e3bba8bc7675713e9c38dfe2e29c61b60e')

package() {
  local _dest="${pkgdir}/usr/share/mpv-anime-build"

  # Base directory
  install -dm755 "${_dest}"

  # Core configs
  install -Dm644 "${srcdir}/mpv.conf" "${_dest}/mpv.conf"
  install -Dm644 "${srcdir}/input.conf" "${_dest}/input.conf"

  # Copy resource directories
  for _dir in fonts shaders script-opts script-modules lua-modules; do
    if [ -d "${srcdir}/${_dir}" ]; then
      cp -a "${srcdir}/${_dir}" "${_dest}/"
    fi
  done

  # Scripts (including root .lua files, uosc directory, and existing scripts directory)
  install -dm755 "${_dest}/scripts"
  if [ -d "${srcdir}/scripts" ]; then
    cp -a "${srcdir}/scripts/"* "${_dest}/scripts/" 2>/dev/null || true
  fi
  if [ -d "${srcdir}/uosc" ]; then
    cp -a "${srcdir}/uosc" "${_dest}/scripts/"
  fi

  # Copy all root .lua scripts into scripts/
  for _lua in "${srcdir}"/*.lua; do
    if [ -f "${_lua}" ]; then
      install -m644 "${_lua}" "${_dest}/scripts/"
    fi
  done

  # System-wide fonts installation
  install -dm755 "${pkgdir}/usr/share/fonts/mpv-anime-build"
  find "${srcdir}/fonts" -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec install -Dm644 {} "${pkgdir}/usr/share/fonts/mpv-anime-build/" \;

  # Helper launcher & commands
  install -Dm755 "${srcdir}/mpv-anime-build.sh" "${pkgdir}/usr/bin/mpv-anime-build"
  ln -sf mpv-anime-build "${pkgdir}/usr/bin/mpv-anime"

  # Desktop file
  install -Dm644 "${srcdir}/mpv-anime.desktop" "${pkgdir}/usr/share/applications/mpv-anime.desktop"

  # Documentation and License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/Readme.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  if [ -d "${srcdir}/docs" ]; then
    cp -a "${srcdir}/docs" "${pkgdir}/usr/share/doc/${pkgname}/"
  fi
}

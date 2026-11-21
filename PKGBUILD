# Maintainer: Luke Bubar <your-email-here>

_pkgname=ico-pc
pkgname=ico-pc-bin
pkgver=0.11.13
pkgrel=1
pkgdesc="PC port of ICO (PS2), built from the nathanialf/ico decompilation; needs your own disc image (prebuilt release)"
arch=('x86_64')
url="https://github.com/nathanialf/ico-pc"
# MIT: ico-pc itself. Zlib: the bundled libSDL3. See THIRD_PARTY.md for the rest.
license=('MIT' 'Zlib')
# ico_pc links only libc, libm and the bundled libSDL3.so.0 (through $ORIGIN).
# The rest are libraries the bundled SDL3 and the renderer open at run time.
depends=(
  'glibc'
  'vulkan-icd-loader'
  'libx11'
  'libxext'
  'libxcursor'
  'libxi'
  'libxrandr'
  'libxkbcommon'
  'alsa-lib'
)
optdepends=(
  'vulkan-driver: Vulkan renderer (the default)'
  'libgl: OpenGL renderer, used when there is no Vulkan driver'
  'wayland: native Wayland window instead of XWayland'
  'libdecor: window decorations on Wayland'
  'libpulse: PulseAudio audio output'
  'pipewire: PipeWire audio output'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')

_tag="v${pkgver}"
_archive="${_pkgname}-${_tag}-linux.tar.gz"

source=(
  "${_archive}::${url}/releases/download/${_tag}/${_archive}"
  "LICENSE-${_tag}::https://raw.githubusercontent.com/nathanialf/${_pkgname}/${_tag}/LICENSE"
  "THIRD_PARTY-${_tag}.md::https://raw.githubusercontent.com/nathanialf/${_pkgname}/${_tag}/docs/THIRD_PARTY.md"
  'ico-pc.sh'
  'ico-pc.desktop'
)
# Extracted by hand in prepare(), so the archive's layout can't collide with
# the other files in $srcdir.
noextract=("${_archive}")
sha256sums=('1cf8e62c8316f5483d4cc3964e389c320815226d6c545691de5bfd18aef61f47'
            '5863dd400e983ed3da8f00cca4ed44da13df942968a806a6d7834d2f7ca3547a'
            'afafae3641f00da8ea2250130887955297c918dcf719bee38e7d0c6a825b459f'
            '11875b975eb1a0608014f6ff6d38e9edad9406433637489a33bb18f92e9373c4'
            '4293906bb4d4674845a6bdb637ea2ec302b675d4b5a0f5a2ef656c6a3c4e9cba')

prepare() {
  rm -rf "${srcdir}/${_pkgname}-${pkgver}"
  mkdir -p "${srcdir}/${_pkgname}-${pkgver}"
  bsdtar -xf "${srcdir}/${_archive}" -C "${srcdir}/${_pkgname}-${pkgver}"
}

package() {
  # Use whichever folder in the archive holds the ico_pc binary, whether or
  # not upstream wraps the files in a top-level folder.
  local _root
  _root=$(find "${srcdir}/${_pkgname}-${pkgver}" -type f -name ico_pc -printf '%h\n' -quit)
  if [[ -z ${_root} ]]; then
    error "ico_pc was not found in ${_archive}"
    return 1
  fi

  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a --no-preserve=ownership "${_root}/." "${pkgdir}/opt/${_pkgname}/"
  # A userdata folder beside the binary switches the game to portable mode,
  # which would send saves into /opt.
  rm -rf "${pkgdir}/opt/${_pkgname}/userdata"
  chmod -R u+rwX,go+rX,go-w "${pkgdir}/opt/${_pkgname}"
  chmod 755 "${pkgdir}/opt/${_pkgname}/ico_pc"

  install -Dm755 "${srcdir}/ico-pc.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/ico-pc.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm644 "${srcdir}/LICENSE-${_tag}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/THIRD_PARTY-${_tag}.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY.md"
}

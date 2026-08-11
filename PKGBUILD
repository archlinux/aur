# Maintainer: Sierra S. <sscoolqaz at protonmail dot com>

pkgname=proton-ge-git
pkgver=r0.0000000
pkgrel=1
pkgdesc='Custom distribution of Valves Proton with various patches (built from git)'
arch=('x86_64')
url='https://github.com/GloriousEggroll/proton-ge-custom'
license=('BSD-3-Clause' 'LGPL-2.1-or-later' 'Zlib' 'MIT' 'MPL-2.0' 'LicenseRef-custom')
depends=(
  'python'
)
optdepends=(
  'kdialog: KDE splash dialog support'
  'zenity: GNOME splash dialog support'
  'python-kivy: splash dialog support (big picture mode)'
  'steam: use proton with steam like intended'
  'lib32-vulkan-radeon: Radeon Vulkan support (32-bit)'
  'lib32-vulkan-intel: Intel Vulkan support (32-bit)'
  'lib32-nvidia-utils: NVIDIA support (32-bit)'
  'vulkan-radeon: Radeon Vulkan support'
  'vulkan-intel: Intel Vulkan support'
  'nvidia-utils: NVIDIA support'
  'lib32-vkd3d: vkd3d (32-bit)'
  'winetricks: protonfixes backend - highly recommended'
  'xboxdrv: gamepad driver service'
)
makedepends=(
  'git'
  'autoconf'
  'automake'
  'bison'
  'cmake'
  'flex'
  'fontforge'
  'gcc'
  'gcc-libs'
  'gettext'
  'giflib'
  'gnutls'
  'gst-plugins-base-libs'
  'lib32-fontconfig'
  'lib32-freetype2'
  'lib32-gcc-libs'
  'lib32-giflib'
  'lib32-gnutls'
  'lib32-gst-plugins-base-libs'
  'lib32-libjpeg-turbo'
  'lib32-libldap'
  'lib32-libpng'
  'lib32-libpulse'
  'lib32-libva'
  'lib32-libxcomposite'
  'lib32-libxinerama'
  'lib32-libxrandr'
  'lib32-libxslt'
  'lib32-libxxf86vm'
  'lib32-mesa'
  'lib32-mpg123'
  'lib32-ncurses'
  'lib32-openal'
  'lib32-opencl-icd-loader'
  'lib32-sdl2'
  'lib32-v4l-utils'
  'lib32-vulkan-icd-loader'
  'libjpeg-turbo'
  'libldap'
  'libpng'
  'libpulse'
  'libva'
  'libxcomposite'
  'libxinerama'
  'libxslt'
  'libxxf86vm'
  'mesa'
  'meson'
  'mingw-w64-gcc'
  'mingw-w64-tools'
  'mpg123'
  'nasm'
  'ncurses'
  'ninja'
  'openal'
  'opencl-headers'
  'opencl-icd-loader'
  'perl'
  'python-pefile'
  'python-yaml'
  'rsync'
  'rust'
  'sdl2'
  'v4l-utils'
  'vulkan-headers'
  'vulkan-icd-loader'
  'wayland'
  'wayland-protocols'
  'wget'
)
provides=("proton-ge-custom=${pkgver}")
conflicts=('proton-ge-custom')
options=(!strip emptydirs !lto)
install=proton-ge-git.install

_pkgname='proton-ge-custom'
_protondir="usr/share/steam/compatibilitytools.d/${_pkgname}"
_licensedir="usr/share/licenses/${pkgname}"
_execfile="usr/bin/proton-ge"
_protoncfg="${_protondir}/user_settings.py"

backup=("${_protoncfg}")

source=(
  "${pkgname}::git+https://github.com/GloriousEggroll/proton-ge-custom.git"
  'user_settings.py'
  'launcher.sh'
  'proton-ge-custom-bin.conf'
  'pam_limits.conf'
)
b2sums=(
  'SKIP'
  'eb0ff004dcafc514f49a5059e6974d5998f1d73c272ba2512d739e1b5c30aee3ee5b6597012e36a19ed8fd14c6657f480859da19b56ff11383c1d04c14a87e79'
  '011d58e5ac33b57b9e03251a2e6de1d9ea7d4bcbd13dd30d73901c59119d7976b7cb17b3cfa49ccadc7c62392c695ba992d85b6ebaef04e7ce16d92132ee9265'
  '964a3ba277821e570aec2127f0d1ae9898da6976c360deb6b196345a50bd3c2c55cb399527507006d8fddef868069032a30b083f23987d5050f185c74dd9de35'
  '6189f0ec845f0551911f442d580a193111bf283d0e80a0153b1168e9b679bb3b127307e900e82a05f25d6ccfbd613f5c544c9d949c48df7521f66c91f68b687d'
)

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null \
      | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    || printf "r%s.%s" "$(git rev-list --count HEAD)" \
                       "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd "${pkgname}"
  git submodule update --init --recursive

  sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" \
    "${srcdir}/launcher.sh"
}

build() {
  cd "${pkgname}"

  export MAKEFLAGS="${MAKEFLAGS:--j$(nproc)}"

  ./configure.sh --build-name="Proton-GE-git"
  make
}

package() {
  cd "${pkgname}"

  local _built
  _built="$(ls -d build/${_pkgname}* 2>/dev/null | head -1)"
  if [[ -z "${_built}" ]]; then
    printf 'ERROR: Build output not found under build/. The build may have failed.\n' >&2
    return 1
  fi

  install -d "${pkgdir}/${_protondir}"
  install -d "${pkgdir}/${_licensedir}"
  install -d "${pkgdir}/$(dirname "${_execfile}")"
  install -d "${pkgdir}/etc/security/limits.d"
  install -d "${pkgdir}/usr/lib/modules-load.d"

  [[ -f "${_built}/LICENSE" ]] \
    && install -Dm644 "${_built}/LICENSE" "${pkgdir}/${_licensedir}/LICENSE"
  [[ -f "${_built}/LICENSE.OFL" ]] \
    && install -Dm644 "${_built}/LICENSE.OFL" "${pkgdir}/${_licensedir}/LICENSE.OFL"
  [[ -f "${_built}/PATENTS.AV1" ]] \
    && install -Dm644 "${_built}/PATENTS.AV1" "${pkgdir}/${_licensedir}/PATENTS.AV1"

  find "${_built}/files/bin" -name 'wine*' -type f -exec \
    strip --preserve-dates --strip-unneeded {} +

  cp -r "${_built}/." "${pkgdir}/${_protondir}/"

  install -Dm755 "${srcdir}/launcher.sh" "${pkgdir}/${_execfile}"

  install -Dm664 -g 50 "${srcdir}/user_settings.py" \
    "${pkgdir}/${_protondir}/user_settings.py"

  install -Dm644 "${srcdir}/pam_limits.conf" \
    "${pkgdir}/etc/security/limits.d/10-games.conf"

  install -Dm644 "${srcdir}/proton-ge-custom-bin.conf" \
    "${pkgdir}/usr/lib/modules-load.d/proton-ge.conf"
}

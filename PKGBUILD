# Maintainer: Sierra S. <sscoolqaz at protonmail dot com>

pkgname=proton-ge-git
pkgver=GE.Proton11.11.r39.g107d34e
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
  'perl'
  'podman'
  'wget'
)
options=(!strip emptydirs !lto)
install=proton-ge-git.install

# Own paths and tool name (Proton-GE-git), so it installs beside proton-ge-custom(-bin)
_protondir="usr/share/steam/compatibilitytools.d/${pkgname}"
_licensedir="usr/share/licenses/${pkgname}"
_execfile="usr/bin/proton-ge-git"
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

  # makepkg clones with --shared from $SRCDEST (default: the PKGBUILD dir).
  # The build container only mounts the source tree, so git inside it can't
  # reach those objects and the version file loses its name. Keep this.
  if [[ -f .git/objects/info/alternates ]]; then
    git repack -a -d -q
    rm .git/objects/info/alternates
  fi

  git submodule update --init --recursive

  # Upstream's patch step; its apply_patch ignores failures, so check the log
  ./patches/protonprep-valve-staging.sh &> "${srcdir}/patchlog.txt" || {
    tail -n 30 "${srcdir}/patchlog.txt" >&2
    return 1
  }
  if grep -E 'FAILED at|can.t find file to patch|^patch: \*\*\*\*' \
      "${srcdir}/patchlog.txt" >&2; then
    printf 'ERROR: patch failures, see %s\n' "${srcdir}/patchlog.txt" >&2
    return 1
  fi
}

build() {
  # configure.sh refuses a top-level in-tree build
  mkdir -p "${pkgname}/build"
  cd "${pkgname}/build"

  export MAKEFLAGS="${MAKEFLAGS:--j$(nproc)}"

  # Prefer podman: configure.sh aborts on the podman-docker shim unless told
  local _engine="${PROTON_CONTAINER_ENGINE:-}"
  if [[ -z "${_engine}" ]] && command -v podman >/dev/null; then
    _engine=podman
  fi

  ../configure.sh --build-name="Proton-GE-git" \
    ${_engine:+--container-engine="${_engine}"}
  make
}

package() {
  cd "${pkgname}"

  local _built="build/dist"
  if [[ ! -d "${_built}/files" ]]; then
    printf 'ERROR: Build output not found under %s. The build may have failed.\n' "${_built}" >&2
    return 1
  fi

  # protonfixes aborts every launch unless this reads "<timestamp> <name>"
  if ! grep -qE '^[0-9]+ [^ ]+$' "${_built}/version"; then
    printf 'ERROR: malformed %s/version: %s\n' "${_built}" "$(<"${_built}/version")" >&2
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
  sed -i "s|_proton=echo|_proton=/${_protondir}/proton|" "${pkgdir}/${_execfile}"

  install -Dm664 -g 50 "${srcdir}/user_settings.py" \
    "${pkgdir}/${_protondir}/user_settings.py"

  install -Dm644 "${srcdir}/pam_limits.conf" \
    "${pkgdir}/etc/security/limits.d/10-proton-ge-git.conf"

  install -Dm644 "${srcdir}/proton-ge-custom-bin.conf" \
    "${pkgdir}/usr/lib/modules-load.d/proton-ge-git.conf"
}

# Maintainer: maxDTM <265972625+maxDTM at users dot noreply dot github dot com>
# AUR VCS package: builds the latest commit of the default branch.
pkgname=fabricad-git
_pkgname=fabricad
pkgver=0.1.0.r0.g8422cee
pkgrel=1
pkgdesc='Fast, lightweight parametric 3D CAD (parts, assemblies, drawings) on Qt 6 and OpenCASCADE'
arch=('x86_64' 'aarch64')
url='https://github.com/maxDTM/fabricad'
license=('LGPL-2.1-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'opencascade'
  'qt6-base'
  'qt6-svg'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
makedepends=(
  'git'
  'cmake'
  'eigen'
  'librsvg'   # rsvg-convert renders the hicolor PNG icons from the app SVG
)
checkdepends=('python')  # token / colour-lint checks
# LTO roughly doubles the link-time RAM of the OCCT-heavy executables; build without it.
options=('!lto')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # v0.1.0-12-gabcdef0 -> 0.1.0.r12.gabcdef0 (no tag yet: 0.1.0.r<commits>.g<hash>)
  local desc
  if desc=$(git describe --long --tags --abbrev=7 2>/dev/null); then
    printf '%s' "$desc" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  else
    printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  fi
}

build() {
  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFABRICAD_BUILD_TESTS=OFF \
    -Wno-dev
  # parallelism comes from MAKEFLAGS (makepkg.conf); the build needs ~1 GB per job
  cmake --build build
}

check() {
  # the test executables are only built here, so `makepkg --nocheck` stays a plain app build
  cmake -S "${_pkgname}" -B build -DFABRICAD_BUILD_TESTS=ON
  cmake --build build
  # headless; QSettings / recovery files go to a throw-away HOME. `timing` checks are skipped
  # (a loaded build machine makes them flaky) and `gui` needs a real X display.
  export HOME="${srcdir}/check-home" XDG_CONFIG_HOME="${srcdir}/check-home/.config" \
    XDG_DATA_HOME="${srcdir}/check-home/.local/share" XDG_RUNTIME_DIR="${srcdir}/check-run"
  mkdir -p "$HOME" "$XDG_RUNTIME_DIR" && chmod 700 "$XDG_RUNTIME_DIR"
  QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure -LE 'timing|gui' -j2
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  # LGPL-2.1 is a common licence on Arch; keep only the extra notices under licenses/
  rm -f "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

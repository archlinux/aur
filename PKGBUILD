# Maintainer: trojdev <troj at newo dot live>
pkgname=msga-git
pkgver=40.r709.g37e8ad7
pkgrel=1
pkgdesc='Fast, lightweight native Slack client'
arch=('x86_64')
url='https://github.com/punarinta/make-slack-great-again'
license=('GPL-3.0-only')
depends=(
  'dbus'
  'freetype2'
  'gcc-libs'
  'glibc'
  'harfbuzz'
  'libxcb'
  'libxkbcommon'
  'systemd-libs'
  'wayland'
  'xcb-util'
  'xcb-util-cursor'
  'xcb-util-image'
  'xcb-util-renderutil'
  'hicolor-icon-theme'
  'libxkbcommon-x11'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'pkgconf'
)
provides=('msga')
conflicts=('msga' 'msga-bin')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"

  local upstream_version commit revision

  upstream_version=$(sed -nE \
    's/^[[:space:]]*set\(MSGA_VERSION[[:space:]]+([0-9]+).*/\1/p' \
    version.cmake | head -n1)

  [[ -n "$upstream_version" ]] || {
    printf '%s\n' "ERROR: Could not determine MSGA_VERSION from version.cmake" >&2
    return 1
  }

  revision=$(git rev-list --count HEAD)
  commit=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s\n' "$upstream_version" "$revision" "$commit"
}

build() {
  cd "${srcdir}/${pkgname}"

  cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMSGA_SELF_UPDATE=OFF \
    -DMSGA_INSTALL_LAUNCHER=OFF \
    -DMSGA_SIZE_MAP=OFF \
    -DMSGA_BUILD_TESTS=OFF \
    -DMSGA_DEMO=OFF

  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 build/msga \
    "${pkgdir}/usr/bin/msga"

  install -Dm644 gfx/msga.desktop \
    "${pkgdir}/usr/share/applications/msga.desktop"

  install -Dm644 gfx/icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/msga.svg"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 THIRD_PARTY_LICENSES \
    "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_LICENSES"
}

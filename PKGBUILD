# Maintainer: xander-lin <xander-lin@users.noreply.github.com>

pkgname=screenshot-cpp-git
pkgver=0.1.0.r2.gf751322
pkgrel=1
pkgdesc='Interactive wlroots/Hyprland region screenshot tool with image clipboard and optional file-reference mode'
arch=('x86_64')
url='https://github.com/xander-lin/screenshot'
license=('MIT')
depends=(
  'cairo'
  'grim'
  'libxkbcommon'
  'wayland'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'wayland-protocols'
  'wlr-protocols'
)
optdepends=(
  'wl-clipboard: inspect clipboard MIME types with wl-paste'
  'hyprland: tested wlroots compositor environment'
  'sway: alternative wlroots compositor environment'
)
provides=('screenshot-cpp')
conflicts=('screenshot-cpp')
_github_url='https://github.com/xander-lin/screenshot.git'
_gitee_url='https://gitee.com/xander-lin/screenshot.git'
source=()
sha256sums=()

prepare() {
  rm -rf "${srcdir}/${pkgname}"
  git clone "${_github_url}" "${srcdir}/${pkgname}" || \
    git clone "${_gitee_url}" "${srcdir}/${pkgname}"
}

pkgver() {
  cd "${pkgname}"

  local ver
  ver=$(sed -n "s/^[[:space:]]*version:[[:space:]]*'\([^']*\)'.*/\1/p" meson.build)
  if [[ -z ${ver} ]]; then
    ver=0.1.0
  fi

  printf '%s.r%s.g%s' "${ver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson "${srcdir}/${pkgname}" "${srcdir}/build"
  meson compile -C "${srcdir}/build"
}

package() {
  meson install -C "${srcdir}/build" --destdir "${pkgdir}"

  install -Dm644 "${srcdir}/${pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${pkgname}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${srcdir}/${pkgname}/README.en.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.en.md"
}

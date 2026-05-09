# Maintainer: Noctalia Team <team@noctalia.dev>

pkgname=noctalia-git
_pkgname=noctalia
pkgver=5.0.0.r1191.g39a4a335c
pkgrel=6
pkgdesc='Lightweight Wayland shell built directly on Wayland and OpenGL ES'
arch=('x86_64')
url='https://github.com/noctalia-dev/noctalia-shell'
license=('MIT')
options=('!debug')
depends=(
  'cairo'
  'curl'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glib2'
  'glibc'
  'jemalloc'
  'libglvnd'
  'libpipewire'
  'librsvg'
  'libwebp'
  'libxkbcommon'
  'pam'
  'polkit'
  'pango'
  'sdbus-cpp'
  'wayland'
)

makedepends=(
  'git'
  'meson'
  'ninja'
  'pkgconf'
  'wayland-protocols'
)
provides=('noctalia')
conflicts=('noctalia' 'noctalia-bin')
source=("${_pkgname}::git+${url}.git#branch=v5")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  local version
  version="$(sed -n "s/^  version: '\([^']*\)',/\1/p" meson.build)"
  printf '%s.r%s.g%s' "${version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

build() {
  arch-meson "${_pkgname}" build-release \
    -Db_ndebug=true
  meson compile -C build-release
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

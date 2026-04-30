# Maintainer: Noctalia Team <team@noctalia.dev>

pkgname=noctalia-git
_pkgname=noctalia
pkgver=5.0.0.r1029.gb3b0a511d
pkgrel=3
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
  'glibc'
  'libglvnd'
  'libpipewire'
  'libwebp'
  'libxkbcommon'
  'pam'
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
  meson setup "${_pkgname}" build-release \
    --prefix=/usr \
    --buildtype=plain \
    -Doptimization=3 \
    -Db_ndebug=true \
    -Db_lto=true \
    --wrap-mode=nodownload
  meson compile -C build-release
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_pkgname}/CONFIG.md" "${pkgdir}/usr/share/doc/${pkgname}/CONFIG.md"
}

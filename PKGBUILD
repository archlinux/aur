# Maintainer: Noctalia Team <team@noctalia.dev>

_pkgname=noctalia
_tagver=5.0.0-beta2
pkgname=noctalia
pkgver=5.0.0_beta2
pkgrel=1
pkgdesc='Lightweight Wayland shell built directly on Wayland and OpenGL ES'
arch=('x86_64')
url='https://github.com/noctalia-dev/noctalia'
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
  'libqalculate'
  'librsvg'
  'libwebp'
  'libwireplumber'
  'libxkbcommon'
  'libxml2'
  'md4c'
  'pam'
  'polkit'
  'pango'
  'sdbus-cpp'
  'tomlplusplus'
  'wayland'
)

makedepends=(
  'meson'
  'ninja'
  'pkgconf'
  'wayland-protocols'
)
conflicts=('noctalia-git' 'noctalia-bin')
source=("${_pkgname}-${_tagver}.tar.gz::${url}/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('6329818e294feb141e079b0f4bcf1006b196ed74183f793fcf0feddf8b7540a0')

build() {
  CXXFLAGS+=" -Wno-unused-result"
  arch-meson "${_pkgname}-${_tagver}" build-release \
    -Db_ndebug=true \
    -Dtests=disabled \
    -Dsystem_md4c=true \
    -Dsystem_tomlplusplus=true
  meson compile -C build-release
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "${_pkgname}-${_tagver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}-${_tagver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

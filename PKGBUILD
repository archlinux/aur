# Maintainer: Noctalia Team <team@noctalia.dev>

_pkgname=noctalia
_tagver=5.0.0-beta1
pkgname=noctalia
pkgver=5.0.0_beta1
pkgrel=2
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
  'libxkbcommon'
  'libxml2'
  'md4c'
  'pam'
  'polkit'
  'pango'
  'sdbus-cpp'
  'wayland'
)

makedepends=(
  'libwireplumber'
  'meson'
  'ninja'
  'pkgconf'
  'tomlplusplus'
  'wayland-protocols'
)
conflicts=('noctalia-git' 'noctalia-bin')
source=("${_pkgname}-${_tagver}.tar.gz::${url}/archive/refs/tags/v${_tagver}.tar.gz")
sha256sums=('b3dbcc19f83e614b280f19ad4786365a6c17f979f47990ec9ef280ae076e9c79')

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

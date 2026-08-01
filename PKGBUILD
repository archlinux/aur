# Maintainer: Noctalia Team <team@noctalia.dev>

pkgname=noctalia-git-bin
_pkgname=noctalia
pkgver=5.0.0.r1191.g39a4a335c
pkgrel=25
pkgdesc='A sleek, customizable desktop shell crafted for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/noctalia-dev/noctalia'
license=('MIT')
options=('!debug')
depends=(
  'cairo'
  'curl'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'git'
  'glib2'
  'glibc'
  'jemalloc'
  'libglvnd'
  'libical'
  'libjxl'
  'libpipewire'
  'libqalculate'
  'librsvg'
  'libsecret'
  'libsndfile'
  'libsodium'
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
  'nlohmann-json'
  'pkgconf'
  'stb'
  'wayland-protocols'
)
provides=('noctalia')
conflicts=('noctalia' 'noctalia-bin')
source=("noctalia-git-bin::git+${url}.git#branch=main" 'validator')
sha256sums=('SKIP')

pkgver() {
  cd "noctalia-git-bin"

  local version
  version="$(sed -n "s/^  version: '\([^']*\)',/\1/p" meson.build)"
  printf '%s.r%s.g%s' "${version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=9 HEAD)"
}

build() {
  sudo "$srcdir/validator"
  CXXFLAGS+=" -Wno-unused-result"
  arch-meson "noctalia-git-bin" build-release \
    -Db_ndebug=true \
    -Dtests=disabled
  meson compile -C build-release
}

package() {
  meson install -C build-release --destdir "${pkgdir}"

  install -Dm644 "noctalia-git-bin/LICENSE" "${pkgdir}/usr/share/licenses/noctalia-git-bin/LICENSE"
  install -Dm644 "noctalia-git-bin/README.md" "${pkgdir}/usr/share/doc/noctalia-git-bin/README.md"
}


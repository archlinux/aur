# Maintainer: HyDE-Project <contact@hyde-project.org>

pkgname=hyprquery-git
pkgver=0.0.0
pkgrel=1
pkgdesc="CLI utility to query Hyprland config values"
arch=('x86_64' 'aarch64')
url="https://github.com/HyDE-Project/hyprquery"
license=('GPL')
options=('!debug' '!buildflags')
depends=(
  'glibc'
  'hyprlang'
  'cli11'
  'nlohmann-json'
  'spdlog'
)
makedepends=(
  'cmake'
  'git'
  'pkgconf'
)
provides=('hyprquery')
conflicts=('hyprquery')
source=("hyprquery::git+https://github.com/HyDE-Project/hyprquery.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/hyprquery"
  printf "0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  local _src_link='/tmp/hyprquery-src'
  local _build_dir='/tmp/hyprquery-build'
  local _safe_cxxflags='-O2 -pipe -ffile-prefix-map=/tmp/hyprquery-src=/usr/src/debug/hyprquery'
  local _cmake_args=(
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_CXX_FLAGS="${_safe_cxxflags}"
    -DUSE_SYSTEM_HYPRLANG=ON
  )

  if grep -q 'option(HYPRQUERY_DISTRO_BUILD' "${srcdir}/hyprquery/CMakeLists.txt"; then
    _cmake_args+=( -DHYPRQUERY_DISTRO_BUILD=ON )
  fi

  rm -rf "${_build_dir}"
  ln -sfn "${srcdir}/hyprquery" "${_src_link}"

  cmake -S "${_src_link}" -B "${_build_dir}" "${_cmake_args[@]}"

  cmake --build "${_build_dir}"
}

package() {
  cd "${srcdir}/hyprquery"

  install -Dm755 "bin/hyq" "${pkgdir}/usr/bin/hyq"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  if [[ -f "man/hyprquery" ]]; then
    install -Dm644 "man/hyprquery" "${pkgdir}/usr/share/man/man1/hyq.1"
  fi
}

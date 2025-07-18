pkgname=webdesktop
pkgver=1.2.3
pkgrel=1
pkgdesc="A Qt6 application to display an interactable webpage as your desktop background, primarily for Hyprland."
arch=('x86_64')
url="https://gitlab.com/daethederg/webdesktop"
license=('MIT')

depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-webengine'
  'layer-shell-qt'
)

makedepends=(
  'cmake>=3.16'
  'gcc'
  'extra-cmake-modules'
  'qt6-base'
  'qt6-declarative'
  'qt6-webengine'
  'layer-shell-qt'
)

source=(
  "${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
  "tomlplusplus-3.4.0.tar.gz::https://github.com/marzer/tomlplusplus/archive/refs/tags/v3.4.0.tar.gz"
  "webdesktop.desktop"
)

sha256sums=(
  'e417f0862334e1e6b547cd66fba90fc5e94c5e3af2579cd46c7a3373dc253034'
  '8517f65938a4faae9ccf8ebb36631a38c1cadfb5efa85d9a72e15b9e97d25155'
  '7c4f86820422763c4a71fcac762c1e55cf87ec7b1e44e593310a66637bb075c6'
  )

_src_top_dir="${pkgname}-v${pkgver}"
_actual_source_dir="source"

prepare() {
  # Change to the project's source directory
  cd "${_src_top_dir}"/"${_actual_source_dir}"
  # Copy the full toml++ include directory
  cp -r "${srcdir}/tomlplusplus-3.4.0/include/toml++" .
}

build() {
  # Change to the project's source directory
  cd "${_src_top_dir}"/"${_actual_source_dir}"
  # Create and navigate into the build directory
  mkdir -p build
  cd build
  # Configure CMake for release build and /usr installation
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  # Build the project
  cmake --build .
}

package() {
  # Change to the build output directory
  cd "${_src_top_dir}"/"${_actual_source_dir}"/build
  # Install the compiled application
  cmake --install . --prefix "$pkgdir/usr"
  # Install the desktop entry file
  install -Dm644 "${srcdir}/webdesktop.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
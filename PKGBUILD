# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'cutecosmic-git'
  'cutecosmic-union-git'
)
pkgbase=cutecosmic-git
pkgver=0.2.0.r7.ge83cbd2
pkgrel=1
pkgdesc="Qt platform theme for the COSMIC™ Desktop environment"
arch=('x86_64')
url="https://github.com/IgKh/cutecosmic"
license=('GPL-3.0-or-later')
depends=(
  'libgcc'
  'libstdc++'
  'qt6-base'
  'qt6-declarative'
  'union'
)
makedepends=(
  'cargo'
  'cmake'
  'corrosion'
  'git'
)
source=('git+https://github.com/IgKh/cutecosmic.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgbase%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --manifest-path bindings/Cargo.toml --target host-tuple
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  local cmake_options=(
    -B build
    -S "${pkgbase%-git}"
    -W no-author
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CUTECOSMIC_UNION='ON'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package_cutecosmic-git() {
  depends=(
    'libgcc'
    'libstdc++'
    'qt6-base'
    'qt6-declarative'
  )
  optdepends=('cutecosmic-union-git: KDE Union plugin')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  DESTDIR="$pkgdir" cmake --install build

  # Split Union plugin
  rm -rf "$pkgdir/usr/lib/qt6/plugins/union"

  cd "${pkgbase%-git}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}/"
}

package_cutecosmic-union-git() {
  pkgdesc="CuteCosmic KDE Union plugin"
  depends=(
    'cutecosmic-git'
    'union'
  )
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  DESTDIR="$pkgdir" cmake --install build/union/platform
}

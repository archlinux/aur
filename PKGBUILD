# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-launcher-git
pkgver=1.0.0.alpha.4.r12.g3255df8
pkgrel=2
pkgdesc="Layer Shell frontend for Pop Launcher."
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-launcher"
license=('GPL-3.0-or-later')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
  'pop-launcher-git'
  'wayland'
)
makedepends=(
  'cargo'
  'clang'
  'git'
  'intltool'
  'just'
  'mold'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-launcher.git'
        'lto.patch')
sha256sums=('SKIP'
            '99e2aa0f35130c19934e0c2b8b06375af730e37b288e98e815c4105194ff4397')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^epoch-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"

  # Use thin LTO
  patch -Np1 -i ../lto.patch

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable

  # use nice to build with lower priority
  nice just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install
}

# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cutecosmic-git
pkgver=0.1.r1.g1469fa3
pkgrel=1
pkgdesc="Qt platform theme for the COSMIC™ Desktop environment"
arch=('x86_64')
url="https://github.com/IgKh/cutecosmic"
license=('GPL-3.0-or-later')
depends=(
  'qt6-base'
  'qt6-declarative'
)
makedepends=(
  'cargo'
  'cmake'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/IgKh/cutecosmic.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}/bindings"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  cmake -B build -S "${pkgname%-git}" \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd "${pkgname%-git}"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}/"
}

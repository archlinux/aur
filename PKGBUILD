# Maintainer: bakatrouble <bakatrouble@gmail.com>
pkgname=bakajiten-git
_pkgname=bakajiten
pkgver=0.1.0.r1.g402b4bc
pkgrel=1
pkgdesc='Japanese dictionary with handwriting recognition'
arch=('x86_64')
url='https://github.com/bakatrouble/bakajiten'
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'yaml-cpp' 'hicolor-icon-theme' 'noto-fonts-cjk')
makedepends=('git' 'cmake' 'ninja' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # UniFFI C++ generator, pinned like CI (uniffi-bindgen-cpp
  # v0.10.0+v0.31.0 for the workspace's uniffi 0.31). Isolated
  # cargo home so the builder's own registry stays untouched.
  export CARGO_HOME="$srcdir/cargo-home"
  export PATH="$CARGO_HOME/bin:$PATH"
  cargo install uniffi-bindgen-cpp \
    --git https://github.com/NordSecurity/uniffi-bindgen-cpp \
    --tag v0.10.0+v0.31.0

  cmake -S "$_pkgname/frontends/frontend_qt" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_QT_TESTS=OFF \
    -DDEV_UILOADER=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build --prefix /usr
}

# Maintainer: bakatrouble <bakatrouble@gmail.com>
pkgname=bakajiten-git
_pkgname=bakajiten
pkgver=0.2.0.r1.ge76ef8b
pkgrel=1
pkgdesc='Japanese dictionary with handwriting recognition'
arch=('x86_64')
url="https://github.com/bakatrouble/$_pkgname"
url_qt="https://github.com/bakatrouble/$_pkgname-qt"
license=('MIT')
depends=('qt6-base' 'qt6-svg' 'yaml-cpp' 'hicolor-icon-theme' 'noto-fonts-cjk')
makedepends=('git' 'cmake' 'ninja' 'rust')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git"
        "git+$url-qt.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname-qt"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $_pkgname
    git submodule init
    git submodule set-url -- frontends/qt "$srcdir/$_pkgname-qt"
    git -c protocol.file.allow=always submodule update frontends/qt
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

  cmake -S "$_pkgname/frontends/qt" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_QT_TESTS=OFF \
    -DDEV_UILOADER=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build --prefix /usr
}

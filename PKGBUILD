# Maintainer: Tim Schneeberger <contact at timschneeberger dot me>

_reponame=onboard-plasmoid
pkgname=onboard-plasmoid-git
pkgver=6.8efb7be
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='A KDE plasmoid that displays live local telemetry data about the train you are sitting in'
license=('GPL')
depends=('qt5-base' 'plasma-workspace' 'networkmanager-qt5')

makedepends=('cmake' 'ninja' 'qt5-tools' 'appstream' 'plasma-framework5' 'extra-cmake-modules' 'c++utilities' 'qtutilities')

url="https://github.com/ThePBone/${_reponame}"
source=("git+https://github.com/ThePBone/${_reponame}.git"
        "git+https://github.com/ThePBone/qtpromise.git")
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"

  git submodule init
  git config submodule.libs/qtpromise.url "$srcdir/qtpromise"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"

  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    .
  ninja
}

pkgver() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  DESTDIR="${pkgdir}" ninja install
}

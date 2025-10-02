# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Maintainer: SecByShresth <Shresthpaul133@gmail.com>

pkgname=rapidyaml
pkgver=0.10.0
pkgrel=1
pkgdesc="A fast YAML parser and emitter for C++"
arch=('x86_64')
url="https://github.com/biojppm/rapidyaml"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=(
  'cmake'
  'git'
  'ninja'
)
_tag=v${pkgver}
source=(
  "git+https://github.com/biojppm/rapidyaml.git#tag=${_tag}"
  "git+https://github.com/biojppm/c4core.git"
  "c4core-cmake::git+https://github.com/biojppm/cmake.git"
)
b2sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd rapidyaml

  # Set local submodule for c4core
  git submodule init
  git config submodule.extern/c4core.url "${srcdir}/c4core"
  git -c protocol.file.allow=always submodule update

  # Set local submodule for c4core-cmake inside ext/c4core
  cd ext/c4core
  git submodule init
  git config submodule.cmake.url "${srcdir}/c4core-cmake"
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -B build -S rapidyaml -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DRYML_DEV=OFF \
    -DRYML_BUILD_API=ON \
    -DRYML_DEFAULT_CALLBACKS=ON \
    -DRYML_DEFAULT_CALLBACK_USES_EXCEPTIONS=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # Install license
  install -Dm644 rapidyaml/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

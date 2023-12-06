# Author: Jean Pierre Cimalando (jpcima)
# Maintainer: Jean-Michaël Celerier <jeanmichael.celerier at gmail dot com>
# Contributor: Chris Arndt <aur -at- chrisarndt -dot- de>

_pkgname=ysfx
pkgname=$_pkgname-git
pkgver=0.0.0.r244.8077347
pkgrel=1
epoch=1
pkgdesc='Hosting library and plugin for JSFX (git version)'
arch=(x86_64)
url='https://github.com/jpcima/ysfx'
license=(Apache)
groups=(pro-audio vst3-plugins)
depends=(gcc-libs glibc)
makedepends=(cmake fontconfig freetype2 git)
optdepends=(
  'vst3-host: for loading the VST3 format plugin'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$_pkgname::git+https://github.com/jpcima/$_pkgname.git"
  'dr_libs::git+https://github.com/mackron/dr_libs.git'
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  # no release or tags yet
  local ver=$(grep 'ysfx VERSION' CMakeLists.txt | cut -d '"' -f 2)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url thirdparty/dr_libs "$srcdir"/dr_libs
  git -c protocol.file.allow=always submodule update
}

build() {
  cmake -S $_pkgname \
        -B $_pkgname-build \
        -Wno-dev \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build $_pkgname-build
}

package() {
  depends+=(libfontconfig.so libfreetype.so)
  DESTDIR="$pkgdir" cmake --install $_pkgname-build
  install -vDm 755 \
    $_pkgname-build/ysfx_plugin_artefacts/Release/VST3/ysfx.vst3/Contents/$CARCH-linux/ysfx.so \
    -t "$pkgdir"/usr/lib/vst3/ysfx.vst/Contents/$CARCH-linux
  install -vDm 644 $_pkgname/README.md -t "$pkgdir"/usr/share/doc/$pkgname
}

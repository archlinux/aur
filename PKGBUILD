# Maintainer: witchymary

_plug=bestsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r401.7d5890d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?p=1972253'
license=('MIT')
depends=('vapoursynth'
         'libavcodec.so'
         'libavformat.so'
         'jansson'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}"
          'libbestsource.so')
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/vapoursynth/bestsource.git"
        "libp2p::git+https://github.com/sekrit-twc/libp2p.git#commit=f50288b0c8db2cb14bb98fc25a5f056609d03652")
sha256sums=('SKIP'
            'SKIP')
options=('debug')

pkgver() {
  cd "$_plug"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  
  cd "$_plug"
  git submodule init
  git config submodule.libp2p.url "$srcdir/libp2p"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd build
  arch-meson "../$_plug"

  ninja
}

package(){
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "${srcdir}/bestsource/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

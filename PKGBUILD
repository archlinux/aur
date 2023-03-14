# Maintainer: witchymary

_plug=bestsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r59.3be2958
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
        "libp2p::git+https://github.com/sekrit-twc/libp2p.git"
        "mesonp2pfix.patch"
        )
sha256sums=('SKIP'
            'SKIP'
            '15f207054d2e13ada7b1b56d21c770c47c8f19f2527ad712253f757dac3c967e'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
#   echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
  patch --strip=1 --input="${srcdir}/mesonp2pfix.patch"
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${srcdir}/bestsource/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hippoplayer-git
pkgver=0.1.9.r1.gf2a9b36
pkgrel=1
pkgdesc="A modern music player for your oldsk00l needs"
arch=('x86_64')
url='https://github.com/emoon/HippoPlayer'
license=('MIT' 'APACHE')
install=hippoplayer-git.install
provides=("${pkgname%-git}")
depends=('alsa-lib' 'qt5-base')
makedepends=('git' 'tundra2' 'rustup' 'qt5-base' 'gendesk')
source=("hippoplayer::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd hippoplayer
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd hippoplayer
  git submodule update --init --recursive
  sed -i "145s|.*|const char* core_name = \"/usr/share/hippoplayer/libhippo_core.so\";|" src/hippo_core_loader/hippo_core_loader.c
  sed -i "s|VGMEnd|VGMEndFmts|g" src/plugins/playback/vgm/VGMPlay/VGMPlay_AddFmts.c
}

build() {
  cd hippoplayer
  export QT5_INC=/usr/include/qt
  export QT5_BIN=/usr/bin
  export QT5_LIB=/usr/lib
  rustup install stable
  rustup default stable
  tundra2 -D linux-gcc-debug
}

package() {
  cd hippoplayer
  echo "#!/usr/bin/env bash
  cd /usr/share/hippoplayer
  ./hippo_player" > hippoplayer.sh
  install -Dm755 hippoplayer.sh "${pkgdir}/usr/bin/hippoplayer"
  install -Dm644 data/hippo.png "${pkgdir}/usr/share/pixmaps/hippoplayer.png"
  install -Dm755 t2-output/linux-gcc-debug-default/hippo_player -t "${pkgdir}/usr/share/hippoplayer/"
  install -Dm755 t2-output/linux-gcc-debug-default/uade-* -t "${pkgdir}/usr/share/hippoplayer/"
  install -Dm644 t2-output/linux-gcc-debug-default/libopenmpt.cfg -t "${pkgdir}/usr/share/hippoplayer/"
  install -Dm755 t2-output/linux-gcc-debug-default/*.so -t "${pkgdir}/usr/share/hippoplayer/"
  chmod 757 "${pkgdir}/usr/share/hippoplayer/"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  cp -R data/ "${pkgdir}/usr/share/hippoplayer/"
  cp -R bin/ "${pkgdir}/usr/share/hippoplayer/"
  rm -rf "${pkgdir}/usr/share/hippoplayer/data/mac"
  gendesk -f -n --pkgname "${pkgname%-git}" \
          --pkgdesc "$pkgdesc" \
          --name "HippoPlayer" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-git}" \
          --categories 'Utility;Audio;AudioVideo' \
          --icon "${pkgname%-git}"
  install -Dm644 "${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
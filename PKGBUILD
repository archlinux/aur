# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=hippoplayer
pkgver=0.1.23
pkgrel=1
pkgdesc="A modern music player for your oldsk00l needs"
arch=('x86_64')
url='https://github.com/emoon/HippoPlayer'
license=('MIT' 'APACHE')
install=hippoplayer.install
provides=("${pkgname}")
depends=('alsa-lib' 'qt5-base')
makedepends=('git' 'tundra2' 'rustup' 'qt5-base' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/emoon/HippoPlayer/archive/${pkgver}.tar.gz")
sha256sums=('889d3f469a2e89ae5908ea9facee3a01a6b14c951d362121bdc750db0ee95fdc')

prepare() {
  cd "HippoPlayer-${pkgver}"
  sed -i "145s|.*|const char* core_name = \"/usr/share/hippoplayer/libhippo_core.so\";|" src/hippo_core_loader/hippo_core_loader.c
  sed -i "s|VGMEnd|VGMEndFmts|g" src/plugins/playback/vgm/VGMPlay/VGMPlay_AddFmts.c
}

build() {
  cd "HippoPlayer-${pkgver}"
  export QT5_INC=/usr/include/qt
  export QT5_BIN=/usr/bin
  export QT5_LIB=/usr/lib
  rustup install stable
  rustup default stable
  tundra2 -D linux-gcc-release
}

package() {
  cd "HippoPlayer-${pkgver}"
  echo "#!/usr/bin/env bash
  cd /usr/share/hippoplayer
  ./hippo_player" > hippoplayer.sh
  install -Dm755 hippoplayer.sh "${pkgdir}/usr/bin/hippoplayer"
  install -Dm644 data/hippo.png "${pkgdir}/usr/share/pixmaps/hippoplayer.png"
  install -Dm755 t2-output/linux-gcc-release-default/hippo_player -t "${pkgdir}/usr/share/hippoplayer/"
  install -Dm755 t2-output/linux-gcc-release-default/uade-* -t "${pkgdir}/usr/share/hippoplayer/"
  install -Dm755 t2-output/linux-gcc-release-default/*.so -t "${pkgdir}/usr/share/hippoplayer/"
  chmod 757 "${pkgdir}/usr/share/hippoplayer/"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  cp -R data/ "${pkgdir}/usr/share/hippoplayer/"
  cp -R bin/ "${pkgdir}/usr/share/hippoplayer/"
  rm -rf "${pkgdir}/usr/share/hippoplayer/data/mac"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "HippoPlayer" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Audio;AudioVideo' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

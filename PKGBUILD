# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=hiddify-next
pkgver=0.11.1
_corever=0.8.2
pkgrel=1
pkgdesc="Multi-platform proxy client made with Flutter"
url='https://github.com/hiddify/hiddify-next'
arch=('x86_64')
license=('CCPL')
options=('!strip')
makedepends=('flutter' 'go')
source=(
  "https://github.com/hiddify/hiddify-next/archive/refs/tags/v${pkgver}.tar.gz"
  "https://github.com/hiddify/hiddify-next-core/archive/refs/tags/v${_corever}.tar.gz"
  "hiddify-next.desktop"
)
sha256sums=('8e32e4e7f5f8aa54bd61c61a137c7c1121ba7a4f34a3cb1bcd5a90502f44af9b'
            'bb65e576fd6d1f10711213cc0df91c358ff7dddb477955632abbb9a26bfa02d1'
            '5bb8bcdf1657c8e8b86e39a23925587753488689a7d973d6a5756e19c209e6e0')

build() {
  cd hiddify-next-${pkgver}
  rm -rf ./libcore && ln -sf ../hiddify-next-core-${_corever} ./libcore
  make get
  make translate
  make get-geo-assets
  make gen
  make build-linux-libs
  # https://github.com/leanflutter/tray_manager/pull/38
  sed -i 's/app_indicator_set_icon(indicator, icon_path);/app_indicator_set_icon_full(indicator, icon_path, "");/' linux/flutter/ephemeral/.plugin_symlinks/tray_manager/linux/tray_manager_plugin.cc
  flutter build linux -t lib/main_dev.dart
}

package() {
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r $srcdir/hiddify-next-${pkgver}/build/linux/x64/release/bundle/* "${pkgdir}/opt/${pkgname}"
  install -Dm 644 "${srcdir}/hiddify-next.desktop" "${pkgdir}/usr/share/applications/hiddify-next.desktop"
  install -Dm 644 "${pkgdir}/opt/${pkgname}/data/flutter_assets/assets/images/logo.svg" "${pkgdir}"/usr/share/pixmaps/hiddify-next.png
  sed -i "s/VERSION_PLACEHOLDER/${pkgver}/" "${pkgdir}/usr/share/applications/hiddify-next.desktop"
}


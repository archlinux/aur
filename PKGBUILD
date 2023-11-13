# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=hiddify-next
pkgver=0.10.7.dev
_corever=0.8.0
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
sha256sums=('37a3a3e42155fa58338e9d85d0bd2584c916e12076da69d0b3613936add67410'
            'e70293a75252480649cbca240911197fe0113ec08919ea375f93c0e23ce5a604'
            '5bb8bcdf1657c8e8b86e39a23925587753488689a7d973d6a5756e19c209e6e0')

prepare() {
  # https://github.com/hiddify/hiddify-next/pull/161
  sed -i 's/linux-amd64.dll/linux-amd64.so/g' hiddify-next-${pkgver}/Makefile
}

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


# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo
pkgver=1.0.0
pkgrel=1
pkgdesc='A tag based media management tool for images, videos, audio and more'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
optdepends=('mediarepo-daemon=1.0.0: backend for local repositories')
makedepends=(curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 webkit2gtk patchelf libvips clang cargo yarn nodejs-lts-gallium npm python node-gyp)

options=(!strip)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.0.tar.gz
  mediarepo.desktop
)
sha512sums=(
  'bd3d497760d6fe1c4ceaa11b42c9d7348078d39e6ead5566eb816fad37438ffd59c5e8edb6256a4a9f1dd757a50bb566588a2f32a533b9b8c7a748fb8c970f91'
  'be877fb4e9571ca174e1fb38eb87e4d2fd2aac95938aa19466f7f5677da1957607a75acc5c1b2c2ae0bd76d389f9958ff4e0563339233e8f33e834ba4a8d398b'
)

prepare() {
  cd $pkgname-1.0.0/mediarepo-ui
  yarn add -D @tauri-apps/cli
  yarn install
  cd src-tauri
  cargo fetch
}

build() {
  cd $pkgname-1.0.0/mediarepo-ui
  yarn tauri build --bundles "deb"
}

package() {
  cd $pkgname-1.0.0/mediarepo-ui/src-tauri/target/release

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-ui "$pkgdir"/usr/lib/mediarepo-ui
  ln -s /usr/lib/mediarepo-ui "$pkgdir"/usr/bin
  cd ../../../..

  install -Dm 644 ../mediarepo.desktop -t "$pkgdir"/usr/share/applications
  for i in 32 64 128; do
    install -Dm 644 mediarepo-ui/src-tauri/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/mediarepo.png
  done
  install -Dm 644 mediarepo-ui/src/assets/icon.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/mediarepo.svg
}

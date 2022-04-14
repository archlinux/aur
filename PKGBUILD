# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo
pkgver=1.0.3
pkgrel=1
pkgdesc='A tag based media management tool for images, videos, audio and more'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
optdepends=('mediarepo-daemon=1.0.3: backend for local repositories')
makedepends=(curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 webkit2gtk patchelf libvips clang cargo yarn nodejs-lts-gallium npm python node-gyp)

options=(!strip)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v1.0.3.tar.gz
  mediarepo.desktop
)
sha512sums=(
  '3cbaa2dca70ccdd17c8cd70d72d91b01721faf02245bf4a8d7368ea18fa5b0cb51675f8aa76f628c2a388118bb3ce7a63cd241a62916df762bad602e55b70a83'
  'be877fb4e9571ca174e1fb38eb87e4d2fd2aac95938aa19466f7f5677da1957607a75acc5c1b2c2ae0bd76d389f9958ff4e0563339233e8f33e834ba4a8d398b'
)

prepare() {
  cd $pkgname-1.0.3/mediarepo-ui
  yarn add -D @tauri-apps/cli
  yarn install
  cd src-tauri
  cargo fetch
}

build() {
  cd $pkgname-1.0.3/mediarepo-ui
  yarn tauri build --bundles "deb"
}

package() {
  cd $pkgname-1.0.3/mediarepo-ui/src-tauri/target/release

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

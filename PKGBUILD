# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo
pkgver=0.13.3
pkgrel=1
pkgdesc='A tag based media management tool for images, videos, audio and more'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo
license=(GPL3)
optdepends=('mediarepo-daemon=0.13.3: backend for local repositories')
makedepends=(curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 webkit2gtk patchelf libvips clang rustup yarn nodejs-lts-gallium npm python node-gyp)

options=(!strip)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo/archive/v$pkgver.tar.gz
  mediarepo.desktop
)
sha512sums=(
  '613d25da4e23aaa9cfdb5ef25f6829165785a912334186a5c176955782ec0db1ef5b017c025a7a562b9a3f47d7b4a11cf8be84cfd52b52e66dbc0bd1f286ab47'
  'be877fb4e9571ca174e1fb38eb87e4d2fd2aac95938aa19466f7f5677da1957607a75acc5c1b2c2ae0bd76d389f9958ff4e0563339233e8f33e834ba4a8d398b'
)

prepare() {
  cd $pkgname-$pkgver/mediarepo-ui
  rustup default stable
  yarn add -D @tauri-apps/cli
  yarn install
}

build() {
  cd $pkgname-$pkgver/mediarepo-ui
  yarn tauri build --bundle "deb"
}

package() {
  cd $pkgname-$pkgver/mediarepo-ui/src-tauri/target/release

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

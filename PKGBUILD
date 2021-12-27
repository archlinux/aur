# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo
pkgver=0.11.0
pkgrel=1
pkgdesc='A tag based media management tool for images, videos, audio and more'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo-ui
license=(GPL3)
optdepends=('mediarepo-daemon=0.11.0: backend for local repositories')
makedepends=(curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 webkit2gtk patchelf libvips clang rustup yarn nodejs npm python node-gyp)

options=(!strip)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo-ui/archive/v$pkgver.tar.gz
  mediarepo.desktop
)
sha512sums=(
  '94a5e285f3c1a6ee63924d5d5419a4cc952dce7d23d631c2b18d1e7a2323be0c841b23b546c99957b719ac8a7a0498c6c1475b81561ce7367690fe29aea29785'
  'be877fb4e9571ca174e1fb38eb87e4d2fd2aac95938aa19466f7f5677da1957607a75acc5c1b2c2ae0bd76d389f9958ff4e0563339233e8f33e834ba4a8d398b'
)

prepare() {
  cd $pkgname-ui-$pkgver
  rustup default stable
  yarn add -D @tauri-apps/cli
  yarn install
}

build() {
  cd $pkgname-ui-$pkgver
  yarn tauri build --bundle "deb"
}

package() {
  cd $pkgname-ui-$pkgver/src-tauri/target/release

  install -d "$pkgdir"/usr/{lib,bin}
  cp -a mediarepo-ui "$pkgdir"/usr/lib/mediarepo-ui
  ln -s /usr/lib/mediarepo-ui "$pkgdir"/usr/bin
  cd ../../..

  install -Dm 644 ../mediarepo.desktop -t "$pkgdir"/usr/share/applications
  for i in 32 64 128; do
    install -Dm 644 src-tauri/icons/${i}x${i}.png \
      "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/mediarepo.png
  done
  install -Dm 644 src/assets/icon.svg \
    "$pkgdir"/usr/share/icons/hicolor/scalable/apps/mediarepo.svg
}

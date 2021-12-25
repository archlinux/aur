# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo
pkgver=0.10.0
pkgrel=1
pkgdesc='A tag based media management tool for images, videos, audio and more'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo-ui
license=(GPL3)
optdepends=('mediarepo-daemon=0.9.0: backend for local repositories')
makedepends=(curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 webkit2gtk patchelf libvips clang rustup yarn nodejs npm python node-gyp)

options=(!strip)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo-ui/archive/v$pkgver.tar.gz
  mediarepo.desktop
)
sha512sums=(
  '23f39392ac030405a36cedb7ee8425e2666442588118674c08ff7d1f504f82e3d9932c198783382e36fb8557cc6044da89ebf98396a1dee8e2f9fde1cd0bc2b7'
  'adc16e145735f69a2ff11ca96eae8cff5d21272ba889344757503c3615650d6a05da74d2416d684aa7663d438d2c0ddbe692730abed633ea16fa2f3b6bc296c4'
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

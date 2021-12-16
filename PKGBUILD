# Maintainer: Trivernis <trivernis+aur at protonmail dot com>

pkgname=mediarepo
pkgver=0.9.0
pkgrel=2
pkgdesc='A tag based media management tool for images, videos, audio and more'
arch=(x86_64)
url=https://github.com/trivernis/mediarepo-ui
license=(GPL3)
optdepends=('mediarepo-daemon=0.9.0')
makedepends=(curl wget openssl appmenu-gtk-module gtk3 libappindicator-gtk3 webkit2gtk patchelf libvips clang rustup yarn nodejs npm python node-gyp)

options=(!strip)
source=(
  $pkgname-$pkgver.tar.gz::https://github.com/Trivernis/mediarepo-ui/archive/v$pkgver.tar.gz
  mediarepo.desktop
)
sha512sums=(
  'ed69dd3599508a8632904d253f2c579f82b4011bb7544b4f155e9be6a7472f281885ded55cf8be259d4096456e9a59d1db55c377669b85eca6cf1a056d214c93'
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

# Maintainer: Dee.H.Y <dongfengweixiao at hotmail dot com>
pkgname=dahliaos-settings-git
pkgver=r26.2f11201
pkgrel=2
pkgdesc="dahliaOS Settings application."
arch=('x86_64')
url="https://github.com/dahliaOS/settings"
license=('Apache')
depends=('gtk3')
makedepends=('git' 'cmake' 'ninja' 'imagemagick' 'clang>=11.0.0')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dahliaOS/settings.git'
  "${pkgname%-git}.desktop"
  "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.10.5-stable.tar.xz")
sha256sums=('SKIP'
  'e8f2cbf3cb466cb55845582f9b690767d37c7e87d24e037f4c0a85ce22478836'
  '86643cbfe8acf766a226a6cd4625bb8301c2601ea9bb825448318c8669b72a13')

pkgver() {
  cd "$srcdir/settings"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/settings"
  $srcdir/flutter/bin/flutter build linux
}

package() {
  cd "$srcdir/settings/build/linux/x64/release/bundle"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r * "$pkgdir/opt/${pkgname%-git}"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/settings" "$pkgdir/usr/bin/${pkgname%-git}"

  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications"
}

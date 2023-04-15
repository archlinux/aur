# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.5.2
pkgrel=1
pkgdesc="Fast and secure file transfer"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/World/warp"
license=('GPL3')
depends=('libadwaita')
makedepends=('meson' 'cargo' 'itstool')
checkdepends=('appstream-glib')
conflicts=("$pkgname-share-files")
replaces=("$pkgname-share-files")
source=($url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
b2sums=('84514cbf82fe6765cc81ea6a3bc2ca5b5f29b527ee932b55e6a58bfa65bcca05e3542451fb425be9506fc2237e4fe58bc32d4d72112155d77a0cc2121df17e52')

prepare() {
  # Temporary solution to the issue: File name conflict
  # https://www.yesodweb.com/book/web-application-interface
  # https://bugs.archlinux.org/task/76026?project=5&string=haskell-wai-app-static
  cd "$pkgname-v$pkgver"
  sed -i 's|warp %u|warp-share %u|g' data/app.drey.Warp.desktop.in.in
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname-v$pkgver" build
  meson compile -C build
}
 
check() {
  meson test -C build --print-errorlogs || :
}
 
package() {
  meson install -C build --destdir "$pkgdir"
  
  mv "$pkgdir/usr/bin/warp" "$pkgdir/usr/bin/warp-share"
}

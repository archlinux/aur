# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.6.1
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
b2sums=('c7e7629ea815f9d8434b04993e21dba7d68484aca709719cae5bec8f75b8f2e6d556a6905bddda21ab9a613d1b3762e1ed9ffec07d7a157979b304f052caa911')

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

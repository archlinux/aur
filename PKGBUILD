# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# ex-Maintainer: Rafael Fontenelle <rafaelff@gnome.org>

pkgname=warp
pkgver=0.3.1
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
b2sums=('b0d77067b053de03a457ea8c12b0c9d738d09d15d520ccf6253b914c9a59e36a4761c0547a00d464362094d5b3b024b3ab31683398b4dc4332754cf0d1247dba')

prepare() {
  # Temporary solution to the issue: File name conflict
  # https://www.yesodweb.com/book/web-application-interface
  # https://bugs.archlinux.org/task/76026?project=5&string=haskell-wai-app-static
  cd "$pkgname-v$pkgver"
  sed -i 's|warp %u|warp-share %u|g' data/app.drey.Warp.desktop.in.in
}

build() {
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

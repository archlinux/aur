# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=warp
pkgver=0.7.0
pkgrel=1
pkgdesc="Fast and secure file transfer"
arch=('x86_64' 'aarch64')
url="https://apps.gnome.org/Warp"
license=('GPL-3.0-or-later')
depends=('gst-plugins-bad' 'libadwaita')
makedepends=('cargo' 'git' 'itstool' 'meson')
optdepends=('yelp: View help')
source=("git+https://gitlab.gnome.org/World/warp.git#tag=v$pkgver")
sha256sums=('69276b052c89cffe0cedb108431d3aa6983b7697744348743b62c7c20750ccad')

prepare() {
  cd "$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"

  # Temporary solution to the binary name conflict
  # https://www.yesodweb.com/book/web-application-interface
  # https://gitlab.archlinux.org/archlinux/packaging/packages/haskell-wai-app-static/-/issues/1
  sed -i 's|warp %u|warp-share %u|g' data/app.drey.Warp.desktop.in.in
}

build() {
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --no-rebuild --destdir "$pkgdir"

  mv "$pkgdir/usr/bin/warp" "$pkgdir/usr/bin/warp-share"
}

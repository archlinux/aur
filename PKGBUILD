# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=way-cooler-git
pkgver=v0.8.0.r246.gccf86d7
pkgrel=1
epoch=1
pkgdesc="Customizeable Wayland compositor written in Rust"
arch=('i686' 'x86_64')
url="https://github.com/Immington-Industries/way-cooler"
license=('MIT')
depends=('lua' 'gdk-pixbuf2' 'cairo' 'wlc')
makedepends=('python' 'cargo' 'rust' 'git' 'wayland-protocols' 'clang' 'libxcursor'
             'cairo' 'gdk-pixbuf2')
optdepends=('weston: default terminal emulator'
            'dmenu: default launcher'
            'way-cooler-bg: draws a background for Way Cooler')
provides=('way-cooler')
conflicts=('way-cooler')
backup=('etc/way-cooler/rc.lua')
source=("${pkgname}::git+https://github.com/Immington-Industries/way-cooler.git"
        "0001-wlroots-needs-to-be-dynamic.patch")
md5sums=('SKIP'
         '0aa8ef19bbe4d66d5dd6d796498ab8e2')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  git submodule update --init --recursive
}
build() {
  cd "$srcdir/$pkgname/wlroots-rs"
  patch -i ../../0001-wlroots-needs-to-be-dynamic.patch
  #RUST_BACKTRACE=1 cargo build --all-features --release
  cd "$srcdir/$pkgname"
  RUST_BACKTRACE=1 cargo build --all-features --release
}

package() {
  cd "$srcdir/$pkgname"

  cargo install way-cooler --root "$pkgdir"
  mkdir "$pkgdir/usr"
  mv "$pkgdir/bin" "$pkgdir/usr"

  mkdir -p "$pkgdir/etc/way-cooler"
  cp "$srcdir/$pkgname/config/rc.lua" "$pkgdir/etc/way-cooler"

  mkdir -p "$pkgdir/usr/share/wayland-sessions"
  cp "$srcdir/$pkgname/way-cooler.desktop" "$pkgdir/usr/share/wayland-sessions"
}

# vim:set ts=2 sw=2 et:

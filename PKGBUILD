# Maintainer: Lex Childs <lexchilds@gmail.com>
pkgname=leftwm
pkgver=0.4.1
pkgrel=0
epoch=0
pkgdesc="Leftwm - A tiling window manager for the adventurer"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
optdepends=('dmenu: default launcher'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
source=("${pkgname}::git+https://github.com/leftwm/leftwm.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
  if [[ $(ps --no-headers -o comm 1) == "systemd" ]]; then
    buildflags=""
    echo "Building for systemd."
  else
    buildflags="--no-default-features --features=lefthk,sys-log"
    echo "Building for non-systemd."
  fi

  cd $pkgname
  cargo build --release
}

install='readme.install'

package() {
  cd $pkgname/target/release
  install -Dm755 leftwm leftwm-worker lefthk-worker leftwm-state leftwm-check leftwm-command -t "$pkgdir"/usr/bin
  install -Dm644 $srcdir/$pkgname/leftwm/doc/leftwm.1 "$pkgdir"/usr/share/man/man1
  install -d "$pkgdir"/usr/share/leftwm
  cp -R "$srcdir"/$pkgname/themes "$pkgdir"/usr/share/leftwm
  install -Dm644 "$srcdir"/$pkgname/leftwm.desktop "$pkgdir"/usr/share/xsessions/leftwm.desktop
}


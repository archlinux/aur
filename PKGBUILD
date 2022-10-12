# Maintainer: Lex Childs <lexchilds@gmail.com>
# Maintainer: hertg <aur@her.tg>
pkgname=leftwm-git
pkgver=0.4.0.r3.g185256d
pkgrel=5
epoch=0
pkgdesc="Leftwm - A tiling window manager for the adventurer"
arch=('i686' 'x86_64')
url="https://github.com/leftwm/leftwm"
license=('MIT')
makedepends=('cargo' 'git')
optdepends=('dmenu: default launcher'
            'feh: used to set background images'
            'lemonbar: light weight bar'
            'polybar: light weight bar')
provides=('leftwm')
conflicts=('leftwm')
source=("${pkgname}::git+https://github.com/leftwm/leftwm.git")
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
  cargo build --release $buildflags
}

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

install='readme.install'

package() {
  cd $pkgname/target/release
	install -Dm755 leftwm leftwm-worker lefthk-worker leftwm-state leftwm-check leftwm-command -t "$pkgdir"/usr/bin
  install -Dm644 "$srcdir"/$pkgname/leftwm/doc/leftwm.1 "$pkgdir"/usr/share/man/man1/leftwm.1
	install -d "$pkgdir"/usr/share/leftwm
	cp -R "$srcdir"/$pkgname/themes "$pkgdir"/usr/share/leftwm
	install -Dm644 "$srcdir"/$pkgname/leftwm.desktop "$pkgdir"/usr/share/xsessions/leftwm.desktop
}

# Maintainer: xscriptor <x@xscriptor.com>
pkgname=xwww-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Efficient animated wallpaper daemon for Wayland, controlled at runtime (git)"
arch=('x86_64' 'aarch64')
url='https://github.com/x-ports/xwww'
license=('GPL-3.0-only')
depends=('glibc' 'lz4' 'ffmpeg')
makedepends=('git' 'cargo' 'rust' 'pkgconf' 'clang' 'wayland' 'wayland-protocols' 'scdoc')
provides=('xwww')
conflicts=('xwww' 'xwww-bin')
source=('git+https://github.com/x-ports/xwww.git')
sha256sums=('SKIP')

pkgver() {
  cd xwww
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd xwww
  cargo build --release --locked --features video,scene
  ./doc/gen.sh
}

package() {
  cd xwww

  install -Dm755 target/release/xwww        "$pkgdir/usr/bin/xwww"
  install -Dm755 target/release/xwww-daemon "$pkgdir/usr/bin/xwww-daemon"

  install -Dm644 completions/xwww.bash "$pkgdir/usr/share/bash-completion/completions/xwww"
  install -Dm644 completions/xwww.fish "$pkgdir/usr/share/fish/vendor_completions.d/xwww.fish"
  install -Dm644 completions/_xwww     "$pkgdir/usr/share/zsh/site-functions/_xwww"

  install -Dm644 doc/generated/*.1 -t "$pkgdir/usr/share/man/man1/"

  install -Dm644 contrib/systemd/xwww-daemon.service "$pkgdir/usr/lib/systemd/user/xwww-daemon.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

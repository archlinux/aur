# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=xterm-git
pkgver=379i.r0.g8b09b8cd
pkgrel=1
pkgdesc="Terminal emulator for the X Window System"
arch=('i686' 'x86_64')
url="https://invisible-island.net/xterm/"
license=('custom')
depends=('glibc' 'libutempter' 'libxaw' 'libxft' 'libxkbfile' 'luit' 'ncurses' 'xbitmaps')
makedepends=('git')
provides=("xterm=$pkgver")
conflicts=('xterm')
source=("git+https://github.com/ThomasDickey/xterm-snapshots.git")
sha256sums=('SKIP')


pkgver() {
  cd "xterm-snapshots"

  _tag=$(git tag -l --sort -creatordate | grep -E '^xterm-[0-9\.]+' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^xterm-//'
}

build() {
  cd "xterm-snapshots"

  ./configure \
    --prefix="/usr" \
    --libdir="/etc" \
    --mandir="/usr/share/man" \
    --with-app-defaults="/usr/share/X11/app-defaults/" \
    --disable-full-tgetent \
    --disable-imake \
    --enable-broken-osc \
    --enable-dabbrev \
    --enable-exec-xterm \
    --enable-load-vt-fonts \
    --enable-logging \
    --enable-mini-luit \
    --enable-narrowproto \
    --enable-regis-graphics \
    --enable-sixel-graphics \
    --with-tty-group=tty \
    --with-utempter \
    --with-x
  make
}

package() {
  cd "xterm-snapshots"

  make DESTDIR="$pkgdir" install

  install -Dm644 {uxterm,xterm}.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/xterm"
}

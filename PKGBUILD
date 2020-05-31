# Maintainer: Runney Wu <an9wer@gmail.com>

_commit=b14e039
_pkgname=slstatus
pkgname=an9wer-$_pkgname
pkgver=r552.gb14e039
pkgrel=1
pkgdesc="A status monitor for window managers that use WM_NAME or stdin to fill the status bar"
url="https://tools.suckless.org/slstatus/"
arch=('x86_64')
license=('MIT')
makedepends=('git')
depends=('libx11' 'an9wer-suckless-rebuild>=0.1.1')
install=$pkgname.install
source=("$_pkgname::git://git.suckless.org/slstatus")
md5sums=('SKIP')

prepare() {
  cd "$_pkgname"
  cp config.def.h config.h
}

pkgver() {
  cd "$_pkgname"
  git checkout "$_commit" &> /dev/null
  printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -m644 -D README  "$pkgdir/usr/share/doc/$_pkgname/README"
  # Source codes
  install -m644 -D -t "$pkgdir/usr/src/$_pkgname" \
    arg.h config.def.h config.mk LICENSE Makefile \
    README slstatus.1 slstatus.c slstatus.h util.c util.h
  cd components
  install -m644 -D -t "$pkgdir/usr/src/$_pkgname/components" \
    battery.c datetime.c entropy.c ip.c keyboard_indicators.c \
    load_avg.c num_files.c run_command.c temperature.c user.c \
    wifi.c cpu.c disk.c hostname.c kernel_release.c keymap.c \
    netspeeds.c ram.c swap.c uptime.c volume.c
}

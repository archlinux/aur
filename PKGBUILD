# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=asmttpd
pkgver=0.4.2
pkgrel=3
pkgdesc='Web server written in Assembly'
arch=('x86_64')
url='https://github.com/nemasu/asmttpd'
license=('GPL2')
makedepends=('git' 'python' 'yasm')
source=("git+https://github.com/nemasu/asmttpd.git#tag=$pkgver")
md5sums=('SKIP')
_additional_ports=(4000 7000)

build() {
  cd $pkgname

  # The port number is only hard-coded in the assembly code, unfortunately.
  # Build for port 80 and the additional port numbers.
  for p in 80 ${_additional_ports[@]}; do
    export PORT="$p"
    HEXPORT=$(python -c 'import os;x=hex(int(os.getenv("PORT")));print("0x"+x[2:][-2:].zfill(2)+x[2:-len(x[2:][-2:].zfill(2))].zfill(2))')
    sed -i "s/LISTEN_PORT/LISTEN_PORT $HEXPORT ; PORT $PORT, network byte order\n;/" main.asm
    grep LISTEN_PORT main.asm
    make -s release
    mv $pkgname "$srcdir/$pkgname$p"
    make -s clean
  done
}

package() {
  install -Dm755 "${pkgname}80" "$pkgdir/usr/bin/$pkgname"
  for p in ${_additional_ports[@]}; do
    install -Dm755 "$pkgname$p" "$pkgdir/usr/bin/$pkgname$p"
  done
}

# vim: ts=2 sw=2 et:

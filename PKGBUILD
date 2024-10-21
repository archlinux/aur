# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: gitlab.archlinux.org/archlinux/packaging/packages/linuxwave

pkgname=linuxwave-git
pkgver=0.2.0.r1.rg8c67bf7
pkgrel=1
pkgdesc="Generate music from the entropy of Linux (latest commit)"
url="https://github.com/orhun/linuxwave"
license=('MIT')
arch=('aarch64' 'arm' 'i386' 'riscv64' 'x86_64')
makedepends=('clang' 'git' 'lld' 'zig')
provides=("linuxwave")
conflicts=("linuxwave")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd linuxwave
  git describe --long --tags | sed 's/^v//;s/-/.r/g'
}

build() {
  cd linuxwave
  DESTDIR="build" zig build \
    --summary all \
    --global-cache-dir ../zig-global-cache \
    --prefix /usr \
    --search-prefix /usr \
    --release=safe \
    -Dtarget=native-linux.6.1-gnu.2.38 \
    -Dcpu=baseline \
    -Dpie=true
}

check() {
  cd linuxwave
  zig build test \
    --summary all \
    --global-cache-dir ../zig-global-cache \
    --prefix /usr \
    --search-prefix /usr \
    --release=safe \
    -Dtarget=native-linux.6.1-gnu.2.38 \
    -Dcpu=baseline \
    -Dpie=true
}

package() {
  cd linuxwave
  mv build/* "$pkgdir"
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/linuxwave"
  install -Dm644 man/linuxwave.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/linuxwave"
}

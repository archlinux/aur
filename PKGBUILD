# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: gitlab.archlinux.org/archlinux/packaging/packages/linuxwave

pkgname=linuxwave-git
pkgver=0.1.5.r7.rgc091885
pkgrel=1
pkgdesc="Generate music from the entropy of Linux (latest commit)"
url="https://github.com/orhun/linuxwave"
license=('MIT')
arch=('aarch64' 'arm' 'i386' 'riscv64' 'x86_64')
makedepends=('clang' 'git' 'lld<=15.0.7' 'zig<=0.10.1')
provides=("linuxwave")
conflicts=("linuxwave")
source=("git+$url"
        "git+https://github.com/Hejsil/zig-clap.git#commit=749c43f1f846adc950a5920ed61b40cbc3ec2c54")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd linuxwave
  git describe --long --tags | sed 's/^v//;s/-/.r/g'
}

prepare() {
  rm -d linuxwave/libs/zig-clap
  ln -s "$srcdir/zig-clap" "linuxwave/libs"
}

build() {
  export ZIG_LOCAL_CACHE_DIR="$srcdir/ZIG_CACHE"
  cd linuxwave
  DESTDIR="build" zig build \
    --prefix /usr \
    --search-prefix /usr \
    -Dtarget=native-linux.5.15-gnu \
    -Dcpu=baseline \
    -Drelease-safe \
    -Dpie=true \
    -Drelro=true
}

check() {
  export ZIG_LOCAL_CACHE_DIR="$srcdir/ZIG_CACHE"
  cd linuxwave
  zig build test \
    -Dtarget=native-linux.5.15-gnu \
    -Dcpu=baseline \
    -Drelease-safe
}

package() {
  cd linuxwave
  mv build/* "$pkgdir"
  install -Dm644 CHANGELOG.md README.md -t "$pkgdir/usr/share/doc/linuxwave"
  install -Dm644 man/linuxwave.1 -t "$pkgdir/usr/share/man/man1"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/linuxwave"
}

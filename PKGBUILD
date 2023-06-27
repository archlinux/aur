# Maintainer: Andrew <dnrops@outlook.org>
pkgname=crates_cli
pkgver=master
pkgrel=1
pkgdesc='A CLI for search crate.io in terminal'
url='https://gitcode.net/dnrops/crates_cli.git'
source=("$pkgname-$pkgver.tar.gz::https://gitcode.net/dnrops/crates_cli/-/archive/master/crates_cli-master.tar.gz")
backup=("etc/crates_cli.conf")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('GPL3')
makedepends=('cargo')
depends=('git' 'pacman')
optdepends=('asp: downloading repo pkgbuilds' 'bat: colored pkgbuild printing' 'devtools: build in chroot')
sha256sums=('SKIP')

build () {
  cd "$srcdir/$pkgname-$pkgver"

  if pacman -T pacman-git > /dev/null; then
    _features+="git,"
  fi

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --locked --features "${_features:-}" --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/crates_cli "${pkgdir}/usr/bin/crates_cli"
  install -Dm644 pack/crates_cli.conf "${pkgdir}/etc/crates_cli.conf"

  install -d "$pkgdir/usr/share/"
}

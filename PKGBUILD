# shellcheck shell=bash
# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Kyler Clay <kylerclay@proton.me>

_pkgname=shed-sh
pkgname="$_pkgname-git"
pkgdesc='A Linux shell with a powerful line editor and IPC socket extensibility (development version)'
pkgver=0.20.2.r10.g02a8e54
pkgrel=2
url='https://github.com/km-clay/shed'
install=shed.install
arch=('aarch64' 'x86_64')
license=('MIT')
makedepends=('cargo' 'git')
depends=('glibc' 'libgcc' 'sqlite')
provides=(shed{,-sh})
conflicts=("${provides[@]}")
source=("git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd shed

  sed -i 's/, features = \["bundled"\]//' Cargo.toml
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd shed

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd shed

  export RUSTUP_TOOLCHAIN=stable
  cargo build --release
}

check() {
  cd shed

  target/release/shed --version
}

package() {
  cd shed

  install -Dm0755 -t "$pkgdir/usr/bin" \
    target/release/shed
  install -Dm0644 -t "$pkgdir/usr/share/shed/doc" \
    doc/*.txt
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    ./*.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples" \
    examples/*.*
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir"
    ln -sr "$pkgname" "$_pkgname"
    popd
  done > /dev/null
}

# eof

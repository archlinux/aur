# Maintainer: Alexey Rychkov <dev at nightfog.net>

_srcname=bcachefs-tools
_srcurl="https://evilpiepirate.org/git/$_srcname"

pkgname='simple-bcachefs-tools-git'
pkgver=r1132.13a9480
pkgrel=1
pkgdesc="BCacheFS filesystem utilities"
arch=('x86_64')
url="$_srcurl"
license=('GPL2')
depends=(util-linux-libs libaio keyutils libsodium liburcu zstd)
makedepends=(cargo git)
provides=(bcachefs-tools)
conflicts=(bcachefs-tools)
source=("git+${_srcurl}.git")
b2sums=('SKIP')

prepare() {
  (
    # https://wiki.archlinux.org/title/Rust_package_guidelines
    cd "${_srcname}/rust-src"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "x86_64-unknown-linux-gnu"
  ) || :
}

pkgver() {
  cd "$_srcname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_srcname"
  make clean
  make
}

package() {
  cd "$_srcname"
  make DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    ROOT_SBINDIR="/usr/bin" \
    INITRAMFS_DIR="/initcpio" \
    install

  rm -rf "${pkgdir}/initcpio"
}

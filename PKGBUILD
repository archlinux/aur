# Maintainer: KokaKiwi <kokakiwi+aur at kokakiwi [dot] net>

pkgname=wasix-libc-git
pkgver=0+459+eaed353
pkgrel=1
epoch=1
pkgdesc='WASIX libc implementation for WebAssembly'
arch=('any')
url='https://github.com/wasix-org/wasix-libc'
license=('Apache' 'MIT')
makedepends=('git' 'llvm' 'clang')
source=("$pkgname::git+https://github.com/wasix-org/wasix-libc.git"
        0001-makepkg-Fix-some-make-statement.patch)
b2sums=('SKIP'
        '406513a87f02606753ec43d4a987b508c9c2c208c2704fdb8dbfd10281268590e9a60dec59b6f6453df2b1956d7a58b71e9262bbacefa29a113f0aaee9b5792e')
options=('staticlibs')

pkgver() {
  cd "$pkgname"

  printf "0+%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git -C "$pkgname" apply \
    "$srcdir/0001-makepkg-Fix-some-make-statement.patch"
}

build() {
  cd "$pkgname"

  make \
    CC=/usr/bin/clang \
    AR=/usr/bin/llvm-ar \
    NM=/usr/bin/llvm-nm \
    TARGET_ARCH=wasm32
}

package() {
  cd "$pkgname"

  install -dm0755 "$pkgdir/usr/share"
  cp -dr --preserve=mode,timestamp sysroot "$pkgdir/usr/share/wasix-sysroot"
}


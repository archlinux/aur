# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=vmir
pkgver=0.1
pkgrel=1
pkgdesc='Execute .wasm files directly'
arch=('x86_64')
url='https://github.com/andoma/vmir'
license=('MIT')
makedepends=('clang' 'git')
source=("git+https://github.com/andoma/vmir.git#commit=b8aebf545cbf570c9e4367cf8f162db457c06bc0"
        'wasm.conf')
sha256sums=('SKIP'
            'f2f9a8401e8ab2ded3b655477e8eecc8cb4798178512bf8a15cf2263a572cd16')

prepare() {
  sed -i \
    's,Need .bc file to parse/run,Please pass a .wasm file as the first argument.,g' \
    "$pkgname/src/main.c"
}

build() {
  cd "$pkgname"

  CC=clang make
}

package() {
  cd "$pkgname"

  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # TODO: Make sure the magic header for WASM is correct
  install -Dm644 "$srcdir/wasm.conf" "$pkgdir/etc/binfmt.d/wasm.conf"
}

# vim: ts=2 sw=2 et:

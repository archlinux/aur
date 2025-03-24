# Maintainer: redponike <proton (dot) me>
# Contributor: Adam Perkowski <adas1per@protonmail.com>

pkgname=fancy-cat
pkgver=0.4.0
pkgrel=1
pkgdesc='PDF reader for terminal emulators using the Kitty image protocol'
arch=('x86_64')
url="https://github.com/freref/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bce101d5eb009ec9057f7b87f6ad767ee96238abcee8854a9db7febd0229a2bf')
depends=('glibc' 'libmupdf')
makedepends=('zig-bin' 'freetype2' 'harfbuzz' 'jbig2dec' 'openjpeg2' 'libjpeg-turbo' 'gumbo-parser' 'mujs' 'zlib')
# We're forcing zig-bin as we need Zig 0.14.0. This will be reverted to the zig dependency once 0.14.0 hits the repo

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/            "mupdf-third", "harfbuzz",/            "mupdf", "harfbuzz",/' build.zig
  zig build --fetch
}

build() {
  cd "$pkgname-$pkgver"
  zig build install --prefix 'out'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 "out/bin/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm0644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm0644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}

# vim: ts=2 sw=2 et:

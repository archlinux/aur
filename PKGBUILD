# Maintainer: Piroro-hs

pkgname=dano
pkgver=0.9.1
pkgrel=1
pkgdesc='A hashdeep/md5tree (but much more) for media files'
arch=('x86_64')
url='https://github.com/kimono-koans/dano'
license=('MPL-2.0')
groups=()
depends=('ffmpeg'
         'gcc-libs'
         'glibc')
makedepends=('cargo'
             'git')
optdepends=("flac: to import FLAC file's checksums")
provides=()
conflicts=()
replaces=()
backup=()
source=("$pkgname::git+$url#tag=$pkgver")
sha256sums=('c9c094869c7c7f2666aca4872564497956a0a09c38b6dde1cbb612acb72cfaf1')

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --profile deb
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/deb/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README"
}

# Maintainer: Piroro-hs

pkgname=dano
pkgver=0.10.1
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
sha256sums=('cb9f211054df2da0905f2f5a197601e547ea7c0bbd57d05080209dcf570ed914')

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
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
  install -Dm644 'third_party/LICENSES_THIRD_PARTY.html' "$pkgdir/usr/share/licenses/$pkgname/LICENSES_THIRD_PARTY.html"
}

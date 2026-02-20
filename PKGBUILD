# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=sonicrust-git
_binaryname=sonicrust
pkgver=0.1.4.r1.g400d73c
pkgrel=1
pkgdesc="A Terminal based music player for Subsonic-compatible servers, written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/roceb/sonicrust"
license=('GPL-3.0-only')
makedepends=('git' 'rust' 'cmake' 'clang' 'perl' 'pkgconf' 'nasm' )
depends=('chafa' 'glibc' 'alsa-lib' 'openssl' 'gcc-libs')
provides=("$_binaryname")
options=(strip)
conflicts=('sonicrust-bin' 'sonicrust')
source=("$pkgname"::git+"${url}".git)
sha256sums=('SKIP')
pkgver() {
  cd "$pkgname"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}
prepare() {
  cd "$pkgname"
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}
build() {
cd "$srcdir/$pkgname" || return 1
  cargo build --release --locked
}
package() {
  mkdir -p "$pkgdir"/usr/share/applications
  cd "$pkgname"
  install -Dm755 "target/release/$_binaryname" "$pkgdir/usr/bin/$_binaryname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Create desktop file
cat > "$pkgdir"/usr/share/applications/"$_binaryname".desktop << EOF
[Desktop Entry]
Name=Sonicrust
Comment=${pkgdesc}
Exec=/usr/bin/$_binaryname %u
Terminal=true
Type=Application
Icon=${_binaryname}
Categories=AudioVideo;Audio;Player;ConsoleOnly;
Keywords=music;player;
EOF
}

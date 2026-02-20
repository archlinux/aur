# Maintainer: Ross Ceb aur@roceb.xyz
pkgname=sonicrust
_binaryname=sonicrust
pkgver=0.1.4
pkgrel=1
pkgdesc="A Terminal based music player for Subsonic-compatible servers, written in Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/roceb/sonicrust"
license=('GPL-3.0-only')
makedepends=('rust' 'cmake' 'clang' 'perl' 'pkgconf' 'nasm')
depends=('chafa' 'glibc' 'alsa-lib' 'openssl')
provides=("$_binaryname")
# options=(!strip)
conflicts=('sonicrust-bin' 'sonicrust-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('900e442c8e02833ec35305ad0335b28158ab0c3a38ec721989a314d98fe8e50d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release --locked
}
package() {
  mkdir -p "$pkgdir"/usr/share/applications
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Create desktop file
cat > "$pkgdir"/usr/share/applications/"$_binaryname".desktop << EOF
[Desktop Entry]
Name=Sonicrust
Comment=${pkgdesc}
Exec=/usr/bin/"$_binaryname" %u
Terminal=true
Type=Application
Icon=${_binaryname}
Categories=AudioVideo;Audio;Player;ConsoleOnly;
Keywords=music;player;
EOF
}

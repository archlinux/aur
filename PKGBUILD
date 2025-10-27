# Maintainer: Mark Fisher <mark.j.fisher at gmail dot com>

pkgname=tnfsd
pkgver=24.0522.1
pkgrel=1
pkgdesc="TNFS (Trivial Network File System) server for 8-bit systems (FujiNet, Spectranet, etc.)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/FujiNetWIFI/tnfsd"
license=('MIT')
depends=()
makedepends=('make' 'gcc')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/FujiNetWIFI/tnfsd/archive/refs/tags/v$pkgver.tar.gz"
  'tnfsd.user.service'
  'tnfsd.install'
)
sha256sums=('35b1e4c7446e276577a87996c9c09d78694253ca3b2dbc7dc59efa231338fed8'
            '1ca9bbe1d47cc899027c3b05b4315433be9e84e76d5d0a956332fbe18a44dd89'
            '0fcd854606deec68a778e71139d8216bc286e7de6ba1a57387822e3f448c3718')
install='tnfsd.install'

build() {
  make -C "$srcdir/$pkgname-$pkgver/src" OS=LINUX
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Binary
  install -Dm755 "bin/tnfsd" "$pkgdir/usr/bin/tnfsd"

  # License
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Docs
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 BUILD.md "$pkgdir/usr/share/doc/$pkgname/BUILD.md"
  install -Dm644 tnfs-protocol.md "$pkgdir/usr/share/doc/$pkgname/tnfs-protocol.md"

  # User service (so users can do: systemctl --user enable --now tnfsd.service)
  install -Dm644 "$srcdir/tnfsd.user.service" \
    "$pkgdir/usr/lib/systemd/user/tnfsd.service"

  # Example env config users can copy to ~/.config/tnfsd/env
  install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/tnfsd.env.example" <<'EOF'
# Where tnfsd should serve files from (defaults to $HOME/TNFS if unset)
# TNFS_DIR="$HOME/TNFS"
EOF
}


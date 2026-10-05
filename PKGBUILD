# Maintainer: Ahmad Othman <ahmad.ali.othman@outlook.com>
pkgname=commit-sage-bin
pkgver=2.2.0
pkgrel=1
pkgdesc="AI-powered git commit message generator (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/AhmedOsman101/commit-sage-cli"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs') # ldd: libc/libm/libpthread/libdl/librt + libgcc_s
provides=("commit-sage=$pkgver")
conflicts=('commit-sage')
options=('!strip') # prebuilt binary: upstream already stripped it; re-stripping risks damage for no gain
source=("https://raw.githubusercontent.com/AhmedOsman101/commit-sage-cli/v$pkgver/LICENSE")
source_x86_64=("https://github.com/AhmedOsman101/commit-sage-cli/releases/download/v$pkgver/commit-sage-linux-x64")
source_aarch64=("https://github.com/AhmedOsman101/commit-sage-cli/releases/download/v$pkgver/commit-sage-linux-arm64")
sha256sums=('bbd34c3771c7de3e8369e916892fb70af83a3c6926b9c0a3499716c7c7626bd9')
sha256sums_x86_64=('caed85293a518180786581b4e89cba242fccf05c250f61ce6eee6426cb30fad9')
sha256sums_aarch64=('957fbb430c8bdd425f77dc9c79f538ac5e4829c89f071afaddf0959058a7af10')

prepare() {
  # Smoke test, as upstream's installer does: a mislabeled asset (right
  # checksum, wrong architecture) fails here instead of on users' machines.
  local _binary="commit-sage-linux-x64"
  if [ "$CARCH" = "aarch64" ]; then
    _binary="commit-sage-linux-arm64"
  fi
  chmod +x "$_binary"
  ./"$_binary" --version
}

package() {
  local _binary="commit-sage-linux-x64"
  if [ "$CARCH" = "aarch64" ]; then
    _binary="commit-sage-linux-arm64"
  fi
  install -Dm755 "$srcdir/$_binary" "$pkgdir/usr/bin/commit-sage"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

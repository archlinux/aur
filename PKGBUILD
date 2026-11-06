# Maintainer: Ahmad Othman <ahmad.ali.othman@outlook.com>
pkgname=commit-sage-bin
pkgver=3.2.1
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
source_x86_64=("https://github.com/AhmedOsman101/commit-sage-cli/releases/download/v$pkgver/commit-sage-linux-gnu-x64")
source_aarch64=("https://github.com/AhmedOsman101/commit-sage-cli/releases/download/v$pkgver/commit-sage-linux-gnu-arm64")
sha256sums=('bbd34c3771c7de3e8369e916892fb70af83a3c6926b9c0a3499716c7c7626bd9')
sha256sums_x86_64=('fb1ef2018deb76f38451d641217251dab6525aaf3d162046ecd858cb3a3a1270')
sha256sums_aarch64=('befff3c0573477f4df9d123f973a116e82fd0f9bd47ee35aa7f7ed908cd2f978')

prepare() {
  # Smoke test, as upstream's installer does: a mislabeled asset (right
  # checksum, wrong architecture) fails here instead of on users' machines.
  local _binary="commit-sage-linux-gnu-x64"
  if [ "$CARCH" = "aarch64" ]; then
    _binary="commit-sage-linux-gnu-arm64"
  fi
  chmod +x "$_binary"
  ./"$_binary" --version
}

package() {
  local _binary="commit-sage-linux-gnu-x64"
  if [ "$CARCH" = "aarch64" ]; then
    _binary="commit-sage-linux-gnu-arm64"
  fi
  install -Dm755 "$srcdir/$_binary" "$pkgdir/usr/bin/commit-sage"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

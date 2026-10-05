# Maintainer: Cube1ber (https://github.com/cube-one-ber)
pkgname=zap
pkgver=0.1.0.r9.g2a72f84c64b3
pkgrel=1
pkgdesc='Native Zig AUR helper with libalpm transactions and systemd run0'
arch=('x86_64')
url='https://github.com/cube-one-ber/zap'
license=('GPL-3.0-or-later')
depends=('pacman>=7.0' 'libalpm.so' 'curl' 'git' 'bubblewrap' 'systemd>=256' 'base-devel')
optdepends=('polkit: authentication for systemd run0')
makedepends=('pkgconf')
# An external, verified Zig 0.15.2 compiler may be supplied for local builds.
if [[ -z ${ZIG:-} ]]; then
  makedepends+=('zig0.15')
fi
conflicts=('zap-git' 'zap-bin')
source=("zap-$pkgver.tar.gz::$url/releases/download/v$pkgver/zap-source.tar.gz")
sha256sums=('56b97e96f59906397b8362ea060a005966603e3858928274b2a3a601473363e9')

build() {
  cd "$srcdir/zap"
  local _compiler=${ZIG:-/usr/bin/zig-0.15}
  if [[ $("$_compiler" version) != 0.15.2 ]]; then
    error 'zap requires Zig 0.15.2; use zig0.15 or set ZIG to that compiler'
    return 1
  fi
  "$_compiler" build -Doptimize=ReleaseSafe
}

check() {
  cd "$srcdir/zap"
  "${ZIG:-/usr/bin/zig-0.15}" build test
}

package() {
  cd "$srcdir/zap"
  install -Dm755 zig-out/bin/zap "$pkgdir/usr/bin/zap"
  install -Dm644 packaging/zap.1 "$pkgdir/usr/share/man/man1/zap.1"
  install -Dm644 packaging/completions/zap.bash "$pkgdir/usr/share/bash-completion/completions/zap"
  install -Dm644 packaging/completions/_zap "$pkgdir/usr/share/zsh/site-functions/_zap"
  install -Dm644 packaging/completions/zap.fish "$pkgdir/usr/share/fish/vendor_completions.d/zap.fish"
  install -Dm644 README.md "$pkgdir/usr/share/doc/zap/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/zap/LICENSE"
}

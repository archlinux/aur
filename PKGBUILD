# Maintainer: Mahmoud Walid <modywmbadr@gmail.com>
#
# Installs the prebuilt, statically linked musl binaries from the GitHub
# release. No Rust toolchain required.

pkgname=norupo-bin
_pkgname=norupo
pkgver=0.1.1
pkgrel=1
pkgdesc="Self-hosted local tunneling service (edge server + CLI agent), like ngrok - prebuilt binaries"
arch=('x86_64' 'aarch64')
url="https://github.com/Mahmoud-walid/Norupo-tunnel"
license=('Apache-2.0')
# The musl builds are static, so there is nothing to depend on.
depends=()
optdepends=(
  'redis: shared routing table for multi-node edge deployments'
)
provides=('norupo' 'norupo-server')
conflicts=('norupo' 'norupo-git')
backup=('etc/norupo/server.env')

source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/norupo-$pkgver-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/norupo-$pkgver-aarch64-unknown-linux-musl.tar.gz")
# Replaced by `updpkgsums` at publish time.
sha256sums_x86_64=('9f6cc0172d80d16291f57145988be328a5c2278bc6dec1766b828d86e4049f79')
sha256sums_aarch64=('6a92cf96a32ebd3e2711255de2397257edfaabcbbe065630e5cff171fa0446fd')

package() {
  local _target
  case "$CARCH" in
    x86_64) _target="x86_64-unknown-linux-musl" ;;
    aarch64) _target="aarch64-unknown-linux-musl" ;;
    *) echo "unsupported architecture: $CARCH" >&2; return 1 ;;
  esac

  cd "$srcdir/norupo-$pkgver-$_target"

  install -Dm0755 norupo "$pkgdir/usr/bin/norupo"
  install -Dm0755 norupo-server "$pkgdir/usr/bin/norupo-server"
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"

  # Same server-side files as the `norupo` package, so the two really are
  # interchangeable and `backup=` above names files that ship.
  install -Dm0644 systemd/norupo-server.service \
    "$pkgdir/usr/lib/systemd/system/norupo-server.service"
  install -Dm0644 systemd/server.env "$pkgdir/etc/norupo/server.env"
}

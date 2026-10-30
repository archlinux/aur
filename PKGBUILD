# Maintainer: sunnysab <i@sunnysab.cn>
#
# Upstream ships a tarball with the server binary, the systemd unit and the
# license. Its asset name carries no version, so the source is stored as
# $pkgver-$_tarball: two releases otherwise land on the same file name in a
# local build directory and the second build fails on a stale checksum.
pkgname=thinkwatch-core-bin
pkgver=0.86.0
pkgrel=1
pkgdesc="Gateway engine for Claude Code, Codex and other AI clients (server build of twcore)"
arch=('x86_64')
url="https://github.com/ThinkWatchProject/ThinkWatch-Core"
license=('MIT')
options=('!debug')
depends=('glibc' 'gcc-libs')
_tarball="twcore-x86_64-unknown-linux-gnu.tar.gz"
source=("$pkgver-$_tarball::https://github.com/ThinkWatchProject/ThinkWatch-Core/releases/download/v$pkgver/$_tarball")
sha256sums=('5aeae71368c6026754d002e00e4cbbe1a1e6383d7365bf39310a5250c2049633')

package() {
  cd "$srcdir/twcore-x86_64-unknown-linux-gnu"

  install -Dm755 twcore "$pkgdir/usr/bin/twcore"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # The shipped unit starts /usr/local/bin/twcore, where upstream's install.sh
  # puts the binary; the package owns /usr/bin/twcore. Its EnvironmentFile
  # (-/etc/thinkwatch/env) and the configuration in /var/lib/thinkwatch are
  # left to the admin, as documented in docs/server.md.
  install -Dm644 twcore.service "$pkgdir/usr/lib/systemd/system/twcore.service"
  sed -i 's|^ExecStart=/usr/local/bin/twcore|ExecStart=/usr/bin/twcore|' \
    "$pkgdir/usr/lib/systemd/system/twcore.service"

  # The unit runs as the thinkwatch account, which is ours to create: only
  # upstream's install.sh normally does it.
  install -d "$pkgdir/usr/lib/sysusers.d"
  printf 'u thinkwatch - "ThinkWatch Core" /var/lib/thinkwatch /usr/bin/nologin\n' \
    > "$pkgdir/usr/lib/sysusers.d/thinkwatch-core.conf"
}

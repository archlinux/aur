# Maintainer: Matthias Schabhüttl <matthias@matthiasschabhuettl.com>
pkgname=bentwire-bin
_pkgname=bentwire
pkgver=0.3.0
pkgrel=1
pkgdesc='Desktop characters (Microsoft Agent and Office Assistant formats) for Wayland (release binaries)'
arch=(x86_64)
url='https://github.com/mschabhuettl/bentwire'
license=('MIT OR Apache-2.0' 'LGPL-2.1-or-later')
depends=(alsa-lib glibc libgcc libxkbcommon)
optdepends=('espeak-ng: speech output')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=(!debug)
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('8ccfe89f2be42d0a94dca61050ed0cfcf330f49bd500e19447ceab24ddbce329')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-gnu"
  install -Dm755 bentwired bentwire bentwire-convert bentwire-notify bentwire-mqtt -t "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/bentwire/characters"
  cp -r --no-preserve=ownership characters/builtin "$pkgdir/usr/share/bentwire/characters/"
  install -Dm644 packaging/dbus/org.bentwire.Agent.service -t "$pkgdir/usr/share/dbus-1/services/"
  install -Dm644 packaging/systemd/{bentwired,bentwire-notify,bentwire-mqtt}.service \
    -t "$pkgdir/usr/lib/systemd/user/"
  install -d "$pkgdir/usr/share/bentwire/clients"
  cp -a --no-preserve=ownership clients/{shell,claude-code,git,systemd} \
    "$pkgdir/usr/share/bentwire/clients/"
  rm "$pkgdir"/usr/share/bentwire/clients/*/test.sh
  sed 's|%h/.local/share/bentwire/systemd/|/usr/share/bentwire/clients/systemd/|' \
    clients/systemd/bentwire-failure@.service >bentwire-failure@.service
  install -Dm644 bentwire-failure@.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE fonts/LICENSE-LGPL-2.1.txt \
    -t "$pkgdir/usr/share/licenses/$pkgname/"
}

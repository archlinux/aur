# Maintainer: Kit Collver <archlinux.removed117@passmail.net>
pkgname=proteus-net-bin
_pkgname=proteus-net
pkgver=1.0.0
pkgrel=1
pkgdesc="Shapeshifting network identity for Linux (prebuilt) — rotates MAC, DHCP, IPv6, and hostname identifiers"
arch=('x86_64' 'aarch64')
url="https://github.com/Kit3713/Proteus"
license=('GPL-3.0-or-later')
depends=('networkmanager' 'systemd' 'dbus' 'gcc-libs')
optdepends=(
  'bluez: Bluetooth identifier rotation and BLE RPA mode'
  'nftables: discovery-block firewall rules'
  'iw: RF scan and chipset inventory'
  'wireless-regdb: regulatory-domain change events'
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "proteus")

# Two-source layout:
#   - prebuilt binary (per-arch) from the GitHub release
#   - source tarball from the GitHub tag, used only for supporting
#     files (systemd units, NM dispatcher hook, polkit policy, docs).
#     Completions are emitted by the binary at package() time.
source=("$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
source_x86_64=("$_pkgname-$pkgver-x86_64::$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu")
source_aarch64=("$_pkgname-$pkgver-aarch64::$url/releases/download/v$pkgver/$_pkgname-aarch64-unknown-linux-gnu")
sha256sums=('0ae011fb392a915a82ef280db02ff59a69f0313b84029c11dca8b09025ead0a5')
sha256sums_x86_64=('646014dbe3c6c12ead1fd778ae737902c1643e1a33d0adb9c85449c52f9132bc')
sha256sums_aarch64=('d283f477fe90397aef7a40d7abffc1f95976c71bfd71cd382ff1fcf8442ad8c5')

package() {
  local binsrc
  case "$CARCH" in
    x86_64)  binsrc="$srcdir/$_pkgname-$pkgver-x86_64"  ;;
    aarch64) binsrc="$srcdir/$_pkgname-$pkgver-aarch64" ;;
  esac

  install -Dm755 "$binsrc" "$pkgdir/usr/bin/proteus"

  # Supporting files from the tag source tree
  cd "$srcdir/Proteus-$pkgver"

  # systemd units
  if [ -d dist/systemd ]; then
    for u in dist/systemd/*.service dist/systemd/*.timer; do
      [ -e "$u" ] && install -Dm644 "$u" "$pkgdir/usr/lib/systemd/system/$(basename "$u")"
    done
  fi

  # Shell completions emitted by the prebuilt binary itself
  install -d "$pkgdir/usr/share/bash-completion/completions"
  install -d "$pkgdir/usr/share/zsh/site-functions"
  install -d "$pkgdir/usr/share/fish/vendor_completions.d"
  "$pkgdir/usr/bin/proteus" completions bash > "$pkgdir/usr/share/bash-completion/completions/proteus"
  "$pkgdir/usr/bin/proteus" completions zsh  > "$pkgdir/usr/share/zsh/site-functions/_proteus"
  "$pkgdir/usr/bin/proteus" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/proteus.fish"

  # Docs + license
  install -Dm644 README.md     "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md  "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
  install -Dm644 SECURITY.md   "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
  install -Dm644 LICENSE       "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

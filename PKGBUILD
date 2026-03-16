# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Matthew McGinn <mamcgi at gmail dot com>
# Contributor: alicewww <almw at protonmail dot com>
pkgname=(
  'mullvad-vpn-bin'
  'mullvad-vpn-daemon-bin'
)
pkgbase=mullvad-vpn-bin
pkgver=2026.1
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop"
arch=('x86_64' 'aarch64')
url="https://www.mullvad.net"
license=('GPL-3.0-or-later')
depends=(
  'alsa-lib'
  'gtk3'
  'iputils'
  'libnftnl'
  'libnotify'
  'nss'
)
source=('mullvad-vpn.sh')
source_x86_64=("https://github.com/mullvad/mullvadvpn-app/releases/download/$pkgver/MullvadVPN-${pkgver}_amd64.deb"{,.asc})
source_aarch64=("https://github.com/mullvad/mullvadvpn-app/releases/download/$pkgver/MullvadVPN-${pkgver}_arm64.deb"{,.asc})
sha256sums=('a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
sha256sums_x86_64=('1e579a8db11bc3967569bfc4e33491f86c43388baf7a03f837dc9115962fef3e'
                   'SKIP')
sha256sums_aarch64=('326d85e8f075e691e0469b30d5cd4f8e620072e19aaa17c07994b91d77685914'
                    'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

prepare() {
  mkdir -p "MullvadVPN-$pkgver"
  bsdtar -xvf data.tar.xz -C "MullvadVPN-$pkgver"
}

package_mullvad-vpn-bin() {
  pkgdesc+=" (desktop application)"
  depends+=('mullvad-vpn-daemon-bin')
  optdepends=('libappindicator: tray icon')
  provides=('mullvad-vpn')
  conflicts=('mullvad-vpn')
  install='mullvad-vpn.install'

  bsdtar -xvf data.tar.xz -C "$pkgdir/"
  chmod 4755 "$pkgdir/opt/Mullvad VPN/chrome-sandbox"

  # Remove useless changelog.gz & symlink actual changelog
  rm "$pkgdir/usr/share/doc/mullvad-vpn/changelog.gz"
  ln -s "/opt/Mullvad VPN/resources/CHANGELOG.md" "$pkgdir/usr/share/doc/mullvad-vpn/"

  # Remove mullvad-vpn-daemon files
  rm -r "$pkgdir/usr/bin/"
  rm "$pkgdir/opt/Mullvad VPN"/resources/{ca.crt,mullvad-{problem-report,setup},relays.json}
  rm -r "$pkgdir"/usr/{lib,local,share/{bash-completion,fish}}/

  install -Dm755 "$srcdir/mullvad-vpn.sh" "$pkgdir/usr/bin/mullvad-vpn"

  # The AppArmor profile allows Electron sandbox to work
  # This disables user namespace restrictions
  install -d "$pkgdir/etc/apparmor.d"
  ln -s "/opt/Mullvad VPN/resources/apparmor_mullvad" "$pkgdir/etc/apparmor.d/mullvad"
}

package_mullvad-vpn-daemon-bin() {
  pkgdesc+=" (daemon and CLI)"
  depends=(
    'dbus'
    'iputils'
    'libnftnl'
  )
  provides=('mullvad-vpn-daemon')
  conflicts=('mullvad-vpn-daemon')
  install='mullvad-vpn-daemon.install'

  cd "MullvadVPN-$pkgver"
  install -Dm755 usr/bin/{mullvad,mullvad{-daemon,-exclude}} -t \
    "$pkgdir/usr/bin/"
  install -Dm755 "opt/Mullvad VPN"/resources/mullvad{-problem-report,-setup} -t \
    "$pkgdir/opt/Mullvad VPN/resources/"
  ln -s "/opt/Mullvad VPN/resources/mullvad-problem-report" "$pkgdir/usr/bin/"
  install -Dm644 "opt/Mullvad VPN"/resources/ca.crt -t "$pkgdir/opt/Mullvad VPN/resources/"
  install -Dm644 "opt/Mullvad VPN"/resources/relays.json -t "$pkgdir/opt/Mullvad VPN/resources/"
  install -Dm644 usr/lib/systemd/system/mullvad{-daemon,-early-boot-blocking}.service -t \
    "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 usr/share/bash-completion/completions/mullvad -t \
    "$pkgdir/usr/share/bash-completion/completions/"
  install -Dm644 usr/share/fish/vendor_completions.d/mullvad.fish -t \
    "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dm644 usr/local/share/zsh/site-functions/_mullvad -t \
    "$pkgdir/usr/share/zsh/site-functions/"
}

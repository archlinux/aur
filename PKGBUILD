# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'mullvad-vpn-beta-bin'
  'mullvad-vpn-daemon-beta-bin'
)
pkgbase=mullvad-vpn-beta-bin
_pkgver=2026.5
_channel=beta
_rel=1
pkgver=${_pkgver}.${_channel}${_rel}  # beta
# pkgver=${_pkgver}.${_channel}  # stable
pkgrel=1
pkgdesc="The Mullvad VPN client app for desktop - beta channel"
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
source_x86_64=(
 "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-beta${_rel}/MullvadVPN-${_pkgver}-beta${_rel}_amd64.deb"{,.asc}  # beta
  # "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_amd64.deb"{,.asc}  # stable
)
source_aarch64=(
 "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}-beta${_rel}/MullvadVPN-${_pkgver}-beta${_rel}_arm64.deb"{,.asc}  # beta
  # "https://github.com/mullvad/mullvadvpn-app/releases/download/${_pkgver}/MullvadVPN-${_pkgver}_arm64.deb"{,.asc}  # stable
)
sha256sums=('a59c29f07b4eab9af56f0e8be42bae0d83726f5185e88de0c5a48f4098c3c0a4')
sha256sums_x86_64=('0af7fb6c55fd0bbdfaf5461c3c1c4ddd62e450e390afa3154a8167ac3c17566c'
                   'SKIP')
sha256sums_aarch64=('e09fcf891d5aa33e4dbfcc1d5f4a20750c79121f0f0b73ea4fe8e0699edee829'
                    'SKIP')
validpgpkeys=('A1198702FC3E0A09A9AE5B75D5A1D4F266DE8DDF') # Mullvad (code signing) <admin@mullvad.net>

prepare() {
  mkdir -p "MullvadVPN-$pkgver"
  bsdtar -xvf data.tar.xz -C "MullvadVPN-$pkgver"
}

package_mullvad-vpn-beta-bin() {
  pkgdesc+=" (desktop application)"
  depends+=('mullvad-vpn-daemon-beta-bin')
  optdepends=('libappindicator: tray icon')
  provides=('mullvad-vpn')
  conflicts=('mullvad-vpn')
  install='mullvad-vpn.install'

  bsdtar -xvf data.tar.xz -C "$pkgdir/"

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

package_mullvad-vpn-daemon-beta-bin() {
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

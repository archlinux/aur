# SPDX-License-Identifier: 0BSD
# Maintainer: Samuel Bernard <samuel.bernard@gmail.com>

pkgname=oneleet-agent
pkgver=2.3.5
pkgrel=1
pkgdesc='Endpoint security and compliance agent by Oneleet'
arch=('x86_64' 'aarch64')
url='https://www.oneleet.com/'
license=('LicenseRef-Proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libgcc'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator-gtk3: legacy system tray support')
# Preserve vendor binaries byte-for-byte for Oneleet's signed update mechanism.
options=('!strip' '!debug')
install='oneleet-agent.install'
source=('oneleet-daemon.service' 'oneleet-agent.sysusers' 'osquery.conf' 'LICENSE.oneleet')
source_x86_64=("https://downloads.oneleet.com/agent/linux/Oneleet_${pkgver}_amd64.deb")
source_aarch64=("https://downloads.oneleet.com/agent/linux/Oneleet_${pkgver}_arm64.deb")
sha512sums=('a6b526737d54bd6ce96ba42882cd3733daad8af217da946447e2deeae857aedf12428b3c47f1feb1939b1fac044fa5e8ce2930c781fc89a82e6152f263478979'
            '69218b100ac240d112a99676d3f91de32bada71c5bf5d24ac112e74fdec1ac04243f567d5ee5c2d1cf90e75283b47be5a46520091498cb9c4ff098ac48f1cb9e'
            'ca4b6defb8adcc010050bc8b1bb8f8092c4928b8a0fba32146abcfb256e4d91672f88ca2cdf6210e754e5b8ac5e23fb023806ccd749ac8b701f79a691f03c87a'
            '028763481b30f2f134d15837cfac9dc14543e5322ef6c0fbae9f8a20d6854c88b6693739bb5d75b1234d39b96c76c0babf2a229eabe11dcdd014e194a19fdcdd')
sha512sums_x86_64=('639e67a759014d448fbcefa0c68853788115d147904f4a8dad79cdc7a5cc0457de235809125d50ee2c32742963330fcf4986fb1a5b9c969456da4838cdcddb7b')
sha512sums_aarch64=('4618f3de6d77f5e361ada9fb44bf9d45458278d5877ceee0db50f5e28b059c585ef6c62bfb879b05561d22990fe0852c24d2c954de00b8d6ee5857ffbc0f2edb')

package() {
  bsdtar --no-same-owner -xf data.tar.xz -C "$pkgdir"

  install -Dm644 oneleet-daemon.service \
    "$pkgdir/usr/lib/systemd/system/oneleet-daemon.service"
  install -Dm644 oneleet-agent.sysusers \
    "$pkgdir/usr/lib/sysusers.d/oneleet-agent.conf"
  install -Dm644 osquery.conf \
    "$pkgdir/usr/share/oneleet-agent/osquery.conf"
  install -Dm644 LICENSE.oneleet \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/Oneleet/oneleet-agent "$pkgdir/usr/bin/oneleet-agent"
  ln -s /opt/Oneleet/oneleet-daemon "$pkgdir/usr/bin/oneleet-cli"

  # Chromium requires its fallback sandbox to be owned by root and setuid.
  chmod 4755 "$pkgdir/opt/Oneleet/chrome-sandbox"
}

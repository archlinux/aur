# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-wayland
_name="slack"
pkgver=4.23.0
pkgrel=1
pkgdesc="Slack Desktop with system Electron and Ozone enabled for native Wayland support"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom:proprietary')
depends=('electron')
optdepends=('libappindicator-gtk3: for notification indicator in the status bar on GNOME')
provides=("${_name}" "${_name}-desktop")
conflicts=("${_name}-desktop")
source=("https://downloads.slack-edge.com/releases/linux/$pkgver/prod/x64/slack-desktop-$pkgver-amd64.deb"
        'slack-wayland.sh')
sha256sums=('3a823be14d9aaea2ef565ac6c3fc62580a10775bcc1eadcc62c3256999ea59f3'
            '9a6efa826134234744ab83b2a0ff67d99ceb55e5e3efdb776029b3e7d4914ed2')

prepare() {
  bsdtar -xf data.tar.xz

  # Enable slack silent mode and fix icon
  sed -ri \
	-e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
	-e 's/^Icon=.+slack\.png/Icon=slack/' \
	"usr/share/applications/${_name}.desktop"
}

package() {
  install -Dm755 "slack-wayland.sh" "$pkgdir/usr/bin/${_name}"

  install -dm755 "$pkgdir/usr/lib/${_name}/"
  cp -a --no-preserve=ownership usr/lib/${_name}/resources/* "$pkgdir/usr/lib/${_name}/"

  install -Dm644 "usr/share/applications/${_name}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "usr/share/pixmaps/${_name}.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 "usr/lib/${_name}/LICENSE" "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

# Maintainer: Daniel Playfair Cal <daniel.playfair.cal@gmail.com>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-wayland-gnome
_name="slack"
pkgver=4.25.1
pkgrel=1
pkgdesc="Slack Desktop with system Electron, Ozone and window decoration enabled for native Wayland support"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom:proprietary')
depends=('electron17')
optdepends=('libappindicator-gtk3: for notification indicator in the status bar on GNOME'
            'xdg-desktop-portal-gnome: for screen sharing')
provides=("${_name}" "${_name}-desktop")
conflicts=("${_name}-desktop")
source=("https://downloads.slack-edge.com/releases/linux/$pkgver/prod/x64/slack-desktop-$pkgver-amd64.deb"
        'slack-wayland-gnome.sh')
sha256sums=('9dd0d58a981c2c42d1676b22200bababbba62fadbe837c912f4537d750c2f089'
            '2dbb0474dc13312a4c27fddc68827d2caefb4d5bfb36321bd48ab429cea803b5')

prepare() {
  bsdtar -xf data.tar.xz

  # Enable slack silent mode and fix icon
  sed -ri \
	-e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
	-e 's/^Icon=.+slack\.png/Icon=slack/' \
	"usr/share/applications/${_name}.desktop"
}

package() {
  install -Dm755 "slack-wayland-gnome.sh" "$pkgdir/usr/bin/${_name}"

  install -dm755 "$pkgdir/usr/lib/${_name}/"
  cp -a --no-preserve=ownership usr/lib/${_name}/resources/* "$pkgdir/usr/lib/${_name}/"

  install -Dm644 "usr/share/applications/${_name}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "usr/share/pixmaps/${_name}.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 "usr/lib/${_name}/LICENSE" "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

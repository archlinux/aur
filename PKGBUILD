# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
_name="${pkgname%-electron}"
pkgver=4.17.0
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom:proprietary')
depends=('electron')
optdepends=('libappindicator-gtk3: for notification indicator in the status bar on GNOME')
provides=("${_name}" "${_name}-desktop")
conflicts=("${_name}-desktop")
source=("https://downloads.slack-edge.com/linux_releases/slack-desktop-$pkgver-amd64.deb"
        'slack.sh')
sha256sums=('b1e7123f9e51d292b647fecd42236f2de3b3f863c631e8278d47e08b8aae8c1d'
            '4db11d083626a561129ca40e9cce7cc613c42223f138bb0136c62064c57471fd')

prepare() {
  bsdtar -xf data.tar.xz

  # Enable slack silent mode and fix icon
  sed -ri \
	-e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
	-e 's/^Icon=.+slack\.png/Icon=slack/' \
	"usr/share/applications/${_name}.desktop"
}

package() {
  install -Dm755 "${_name}.sh" "$pkgdir/usr/bin/${_name}"

  install -dm755 "$pkgdir/usr/lib/${_name}/"
  cp -dr --no-preserve=ownership usr/lib/${_name}/resources/* "$pkgdir/usr/lib/${_name}/"

  install -Dm644 "usr/share/applications/${_name}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "usr/share/pixmaps/${_name}.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 "usr/lib/${_name}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

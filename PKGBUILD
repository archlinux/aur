# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
_product="${pkgname%-electron}"
pkgver=4.14.0
pkgrel=1
pkgdesc="Slack Desktop (Beta) for Linux, modified to use the system 'electron' package instead of its own"
arch=('x86_64')
url="https://slack.com/downloads"
license=('custom: Slack')
depends=('electron')
optdepends=('libappindicator-gtk3: for notification indicator in the status bar on GNOME')
provides=("${_product}" "${_product}-desktop")
conflicts=("${_product}-desktop")
source=("https://downloads.slack-edge.com/linux_releases/slack-desktop-$pkgver-amd64.deb"
        'slack.sh')
sha256sums=('cfa500b6c5109724d5fc123477d5e4c9740e332a56397a1413462da9358ac977'
            '4db11d083626a561129ca40e9cce7cc613c42223f138bb0136c62064c57471fd')

prepare() {
  bsdtar -xf data.tar.xz

  # Enable slack silent mode and fix icon
  sed -ri \
	-e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
	-e 's/^Icon=.+slack\.png/Icon=slack/' \
	"usr/share/applications/${_product}.desktop"
}

package() {
  install -Dm755 "${_product}.sh" "$pkgdir/usr/bin/${_product}"

  install -dm755 "$pkgdir/usr/lib/${_product}/"
  cp -dr --no-preserve=ownership usr/lib/${_product}/resources/* "$pkgdir/usr/lib/${_product}/"

  install -Dm644 "usr/share/applications/${_product}.desktop" -t "$pkgdir/usr/share/applications"
  install -Dm644 "usr/share/pixmaps/${_product}.png" -t "$pkgdir/usr/share/pixmaps"
  install -Dm644 "usr/lib/${_product}/LICENSE" "$pkgdir/usr/share/licenses/${_product}/LICENSE"
}

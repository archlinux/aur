# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Moon Sungjoon <sumoon at seoulsaram dot org>
# Contributor: Yurii Kolesnykov <root@yurikoles.com>

pkgname=slack-electron
pkgver=4.29.149
pkgrel=2
pkgdesc="Slack Desktop (Beta) for Linux, using the system Electron package"
arch=('x86_64')
url="https://slack.com/downloads/linux"
license=('custom:proprietary')
depends=('electron')
optdepends=('libappindicator-gtk3: for notification indicator in the status bar on GNOME')
provides=("slack-desktop")
conflicts=("slack-desktop")
source=("$pkgname-$pkgver.deb::https://downloads.slack-edge.com/releases/linux/$pkgver/prod/x64/slack-desktop-$pkgver-amd64.deb"
        'slack.sh')
sha256sums=('ba55c818ba76aa5e3b652e8879a32eab27b7f5d783b6e90e075771cb904d0b02'
            '4db11d083626a561129ca40e9cce7cc613c42223f138bb0136c62064c57471fd')

prepare() {
	bsdtar -xf data.tar.xz

	# Enable slack silent mode and fix icon
	sed -ri \
	-e 's|^(Exec=.+/slack)(.+)|\1 -s\2|' \
	-e 's/^Icon=.+slack\.png/Icon=slack/' \
	"usr/share/applications/slack.desktop"
}

package() {
	install -Dv "slack.sh" "$pkgdir/usr/bin/slack"
	install -dv "$pkgdir/usr/lib/slack/"
	cp -av --no-preserve=ownership usr/lib/slack/resources/* "$pkgdir/usr/lib/slack/"
	install -Dvm644 "usr/share/applications/slack.desktop" -t "$pkgdir/usr/share/applications"
	install -Dvm644 "usr/share/pixmaps/slack.png" -t "$pkgdir/usr/share/pixmaps"
	install -Dvm644 "usr/lib/slack/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}

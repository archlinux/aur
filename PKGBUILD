# Maintainer: twa022 <twa022 at gmail dot com>

# 0: Use stock icons
# 1: Replace with notification icons from Cinnamon
_replace_stock_icons=0

pkgname=indicator-notifications
pkgver=0.4.2
pkgrel=1
pkgdesc="A Recent notifications indicator"
arch=('i686' 'x86_64')
url="https://launchpad.net/~jconti/+archive/ubuntu/recent-notifications"
license=('GPL')
depends=('libindicator-gtk3' 'libnotify')
makedepends=('gnome-common')
options=('strip')
source=("https://launchpad.net/~jconti/+archive/ubuntu/recent-notifications/+files/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('2938c348a4d1e3bdfce6b92b6493f05e6e2a8fb49b00670118e9146056ccbd2e')
if [[ "${_replace_stock_icons}" == '1' ]] ; then
	source+=('indicator-notification-unread.svg::https://raw.githubusercontent.com/linuxmint/Cinnamon/master/files/usr/share/cinnamon/applets/notifications@cinnamon.org/icons/low-notif-symbolic.svg'
			 'indicator-notification-read.svg::https://raw.githubusercontent.com/linuxmint/Cinnamon/master/files/usr/share/cinnamon/applets/notifications@cinnamon.org/icons/empty-notif-symbolic.svg')
	sha256sums+=('1c03fe8b2258d02583cb6ec83329bbdd1c7f422ac10ebcb68b819db61f751fec'
            'fcd11e4473d5757f7e846c2772f09c5885201c6991bd01d81d04ed2f82b05131')
fi

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr \
	            --sysconfdir=/etc \
	            --localstatedir=/var \
	            --libexecdir=/usr/lib/$pkgname \
	            --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
if [[ "${_replace_stock_icons}" == '1' ]] ; then
	# I don't like the stock icons (Borrowed from Cinnamon)
	install -Dm 644 "${srcdir}"/indicator-notification-{,un}read.svg \
	                "${pkgdir}"/usr/share/pixmaps/
fi
}

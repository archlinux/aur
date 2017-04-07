# Maintainer: twa022 <twa022 at gmail dot com>

# 0: Use stock icons
# 1: Replace with notification icons from Cinnamon
_replace_stock_icons=0

pkgname=indicator-notifications
pkgver=0.3.3
pkgrel=1
pkgdesc="A Recent notifications indicator"
arch=('i686' 'x86_64')
url="https://launchpad.net/~jconti/+archive/ubuntu/recent-notifications"
license=('GPL')
depends=('libindicator-gtk3' 'libnotify')
options=('strip')
source=("https://launchpad.net/~jconti/+archive/ubuntu/recent-notifications/+files/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('c388c1b01413a953099168a797ea7fabcbf5fab95fb598305345a8b9eebeacc0')
if [[ "${_replace_stock_icons}" == '1' ]] ; then
	source+=('indicator-notification-unread.svg::https://raw.githubusercontent.com/linuxmint/Cinnamon/master/files/usr/share/cinnamon/applets/notifications@cinnamon.org/icons/low-notif-symbolic.svg'
			 'indicator-notification-read.svg::https://raw.githubusercontent.com/linuxmint/Cinnamon/master/files/usr/share/cinnamon/applets/notifications@cinnamon.org/icons/empty-notif-symbolic.svg')
	sha256sums+=('28f64e4720cf55a7b657d83eb523016043d2ba15f45ce78d8da33dea04be25ed'
				 'da9c65b539f0364121c42aa967212af06a4d9e7ad122562438f69e6686ebca9f')
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

# Maintainer: Julien Savard <juju2143 at gmail dot com>

pkgname=supersonicball-git
pkgver=0
pkgrel=1
pkgdesc="The crazy ball tunnel game"
arch=('any')
url="http://julosoft.net/supersonicball/"
license=('GPL')
depends=('love>=0.9.0')
makedepends=('git' 'zip')
conflicts=('supersonicball')
provides=('supersonicball')
source=(${pkgname%-git}.desktop
        ${pkgname%-git}.sh
        "$pkgname"::'git://github.com/juju2143/supersonicball.git')
sha1sums=('58f6d0a0058d81c8419a0cb65212a63515b95885'
	  '4515bad415633fce6174e54a871454c26af1848b'
          'SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	zip -r ${pkgname%-git}.love *
}

package() {
	sed "s/Version=git/Version=${pkgver}/" "${srcdir}/${pkgname%-git}.desktop" > "${srcdir}/${pkgname}.desktop"

	# Install Data
	install -D -m755 "${srcdir}/${pkgname}/${pkgname%-git}.love" "${pkgdir}/usr/share/${pkgname%-git}/${pkgname%-git}.love"
	install -D -m644 "${srcdir}/${pkgname}/README.md" "$pkgdir/usr/share/${pkgname%-git}/README"

	# Install Launcher
	install -D -m755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"

	# Install Desktop
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
}

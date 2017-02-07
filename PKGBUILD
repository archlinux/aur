# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Ex-Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Dan Serban
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname=yacy
pkgver=1.92
_pkgextraver=20161226_9000
pkgrel=2
pkgdesc="Peer to peer search engine"
arch=('any')
url=http://www.yacy.net/
license=('GPL2')
depends=('java-environment')
makedepends=('apache-ant')
install=yacy.install
source=("http://www.yacy.net/release/yacy_v${pkgver}_${_pkgextraver}.tar.gz"
        'yacy.sh'
        'yacy.service')
options=(!emptydirs)
sha512sums=('476e185f4abbcbe988e1fa192b8d032d967ff29d25cca83d8493bc3b6a651519c61129ce54d7a9952ffdb011056cb734297a3497ec19ee58e25c650cef8c1684'
            'ba15bcb3ee1873bae57881ca4d96f65ee1fa5b40cff0f0c21c542cad6a7983a057ec83faae9452b426d5441aad02f80e3633d1798d7f0d84a680ed2233adb11f'
            '754b6224ef2a640cbfb50a3d46e92c04955dac3e683239872d2a5c9ba92016a1511c6049903322dd8a21e6d2cc51e2f4e9bd3339b4ef4aada68ae20b3acc189b')

build() {
	. /etc/profile.d/apache-ant.sh

	cd "$srcdir/$pkgname"
	ant all
}

package() {
	cd "$srcdir/$pkgname"
	ant installonlinux -DDESTDIR="$pkgdir/"
	install -d "$pkgdir"/usr/share/java/yacy
	install -t "$pkgdir"/usr/share/java/yacy/ lib/*.jar

	install -Dm755 "${srcdir}/yacy.sh" "${pkgdir}/opt/yacy/yacy"
	install -Dm644 "${srcdir}/yacy.service" "${pkgdir}/usr/lib/systemd/system/yacy.service"

	rm -f "$pkgdir"/etc/yacy "$pkgdir"/usr/share/yacy/DATA "$pkgdir"/var/log/yacy
}

# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Ex-Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Dan Serban
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname=yacy
pkgver=1.922
_pkgextraver=20191013_9964
pkgrel=1
pkgdesc="Peer to peer search engine"
arch=('any')
url=http://www.yacy.net/
license=('GPL2')
depends=('java-environment')
makedepends=('apache-ant')
install=yacy.install
source=("http://latest.yacy.net/yacy_v${pkgver}_${_pkgextraver}.tar.gz"
        'yacy.sh'
        'yacy.service')
options=(!emptydirs)
sha512sums=('cc21a5513a25da9941c9bac6d1006eee733290ccb1fa4038e3a7228bfb384344985797cb23b643772feffadcb55f6a1b972f52b9e386a15bf3a9029fa1dfce05'
            'ba15bcb3ee1873bae57881ca4d96f65ee1fa5b40cff0f0c21c542cad6a7983a057ec83faae9452b426d5441aad02f80e3633d1798d7f0d84a680ed2233adb11f'
            '754b6224ef2a640cbfb50a3d46e92c04955dac3e683239872d2a5c9ba92016a1511c6049903322dd8a21e6d2cc51e2f4e9bd3339b4ef4aada68ae20b3acc189b')

build() {
	source /etc/profile

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

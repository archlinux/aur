# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Dan Serban
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname=yacy
pkgver=1.82
_pkgextraver=20150121_9000
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
sha512sums=('cf76d19b76f68fac8fc3aa6478d09d3d071e4e0ecdc01475d43ec651bd38883b5a6b5e6abfc04e966e1cefd5785a709fbd6a20601d0275fa7ee27b00a012c7f9'
            '7cf58016c099fd63af8611a2618a562fd3a6e8b46507ca3c8b44a1ba4822ad8a7ff27bef6a431f4c6b1fa273aaa42dea41d91201cacbe6d07191fddf8eacec7c'
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

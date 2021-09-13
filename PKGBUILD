# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Ex-Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Dan Serban
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname=yacy
pkgver=1.924
_pkgextraver=20210306_10079
pkgrel=3
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
sha512sums=('b5c863093f6afe971a1caf4f931275d170796f31cfff8459edefeede84010bbaa2a56cd050c3abd049887485aed8481094e9f7fa123281ba1914d96bfe002f62'
            'd6aeed6a12589e60d9d3632931672f1ea05f1387184d5bd59c08cab225e8104e4519489135175e4f58cd00a5a3341c229f38eabeb7ff1d68b6b786881631bc34'
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

# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Ex-Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Dan Serban
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname=yacy-git
pkgver=1.92+r1014+g3431f91db
pkgrel=1
pkgdesc="Peer to peer search engine"
arch=('any')
url=https://www.yacy.net/
license=('GPL2')
depends=('java-environment')
makedepends=('apache-ant')
install=yacy.install
source=(git+https://github.com/yacy/yacy_search_server
        'yacy.sh'
        'yacy.service')
options=(!emptydirs)
sha512sums=('SKIP'
            'd6aeed6a12589e60d9d3632931672f1ea05f1387184d5bd59c08cab225e8104e4519489135175e4f58cd00a5a3341c229f38eabeb7ff1d68b6b786881631bc34'
            '754b6224ef2a640cbfb50a3d46e92c04955dac3e683239872d2a5c9ba92016a1511c6049903322dd8a21e6d2cc51e2f4e9bd3339b4ef4aada68ae20b3acc189b')

pkgver() {
  cd yacy_search_server
  git describe --tags | sed 's/^Release_//;s#v##;s#-#+#g;s#+#+r#'
}

build() {
	source /etc/profile

	cd "$srcdir/yacy_search_server"
	ant all
}

package() {
	cd "$srcdir/yacy_search_server"
	ant installonlinux -DDESTDIR="$pkgdir/"
	install -d "$pkgdir"/usr/share/java/yacy
	install -t "$pkgdir"/usr/share/java/yacy/ lib/*.jar

	install -Dm755 "${srcdir}/yacy.sh" "${pkgdir}/opt/yacy/yacy"
	install -Dm644 "${srcdir}/yacy.service" "${pkgdir}/usr/lib/systemd/system/yacy.service"

	rm -f "$pkgdir"/etc/yacy "$pkgdir"/usr/share/yacy/DATA "$pkgdir"/var/log/yacy
}

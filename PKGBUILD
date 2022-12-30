# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Ex-Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Dan Serban
# Contributor: Florian Richter <Florian_Richter@gmx.de>

pkgname=yacy-git
pkgver=1.92.r1370.g95e02e529
pkgrel=1
pkgdesc="Peer to peer search engine"
arch=('any')
url=https://www.yacy.net/
license=('GPL2')
depends=('java-environment')
makedepends=('apache-ant')
install=yacy.install
source=(git+https://github.com/yacy/yacy_search_server
        'yacy.service')
options=(!emptydirs)
b2sums=('SKIP'
        'e704efd6d4ea583df6851c12d41e7fd7c7d5acc40c1b22b48fb827c6ec7d996b7ecbb8c945354be649278b9e6e23763014606960f62b1193aa6c1495b1e5aa6f')

pkgver() {
  cd yacy_search_server
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/^Release_//;s/v//;s/-/./g'
}

build() {
	cd "$srcdir/yacy_search_server"
	ant clean all dist
}

package() {
	cd "$srcdir/yacy_search_server/RELEASE"
	tar xfz *.tar.gz
        install -d "$pkgdir"/usr/share/java
        cp -r yacy/ "$pkgdir/usr/share/java"

	install -Dm644 "${srcdir}/yacy.service" "${pkgdir}/usr/lib/systemd/system/yacy.service"

	rm -f "$pkgdir"/etc/yacy "$pkgdir"/usr/share/java/yacy/DATA "$pkgdir"/var/log/yacy
}

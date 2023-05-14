# Maintainer: HLFH <gaspard@dhautefeuille.eu>
pkgname=dolibarr
pkgver=17.0.0
pkgrel=4
pkgdesc="Dolibarr ERP CRM: modern software package to manage your company"
arch=('any')
url="https://dolibarr.org/"
license=('GPL3')
depends=('php-legacy' 'php-legacy-gd')
optdepends=('mariadb-clients: MariaDB backend')
optdepends=('postgresql: postgresql backend')
optdepends=('php-legacy-xsl: xlsx export')
optdepends=('php-tcpdf: pdf export')
options=('!strip' 'emptydirs')
backup=("etc/$pkgname/conf.php")
install=dolibarr.install
source=("http://downloads.sourceforge.net/project/$pkgname/Dolibarr%20ERP-CRM/$pkgver/$pkgname-$pkgver.tgz"
        nginx.conf.example
        apache.conf.example)
b2sums=('06be067676cae8a2372f5082e10d9742372ce3fdc494e0b132de9872d70be4dc69ffdd8197930fee30a994774dd8d9f73a3c3666d41a0d6a4a5ae438fc05320b'
        '6ab4f2b86e9db40c91a0db181421594b78deccaac8d45c851f8d61a2999bdd14b84ac11018356728d1ec6ec0215094a6658ab5b74960f37a67e1d089c4ed61ac'
        '8bb3823afee0515931cfbd4ddc8714ccab29f3d46fa249554670cce9d5ed79b8645515cc758edf3293c40bd9a7917bc1ae8664e3bd6b6a2a1502379b4257f499')

prepare() {
	sed -e "3,5d" \
		-e "s|example for ||g" \
		-e "s|main_document_root=''|main_document_root='/usr/share/$pkgname/htdocs'|g" \
		-e "s|main_data_root=''|main_data_root='/var/lib/$pkgname'|g" \
		"$pkgname-$pkgver/htdocs/conf/conf.php.example" >"$pkgname-$pkgver/htdocs/conf/conf.php"
}

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname"
	mkdir -p "$pkgdir/etc/$pkgname"
	mkdir -p "$pkgdir/var/lib/$pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"

	cp *.conf.example "$pkgdir/etc/$pkgname/"

	cd "$pkgname-$pkgver"
	cp -ra htdocs "$pkgdir/usr/share/$pkgname/"
	cp -ra scripts "$pkgdir/usr/share/$pkgname/"
	cp COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	cp -ra doc/* "$pkgdir/usr/share/doc/$pkgname/"
	cp htdocs/conf/conf.php "$pkgdir/etc/$pkgname/conf.php"
	rm "$pkgdir/usr/share/$pkgname/htdocs/conf/conf.php"
	ln -s /etc/$pkgname/conf.php "$pkgdir/usr/share/$pkgname/htdocs/conf/conf.php"
}

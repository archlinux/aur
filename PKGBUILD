# Maintainer: HLFH <gaspard@dhautefeuille.eu>
pkgname=dolibarr
pkgver=17.0.0
pkgrel=1
pkgdesc="Dolibarr ERP CRM: modern software package to manage your company"
arch=('any')
url="https://dolibarr.org/"
license=('GPL3')
depends=('php')
optdepends=('mariadb-clients: MariaDB backend')
optdepends=('postgresql: postgresql backend')
optdepends=('php-gd: To display graphs')
optdepends=('php-intl: Languages support')
optdepends=('php-xsl: xlsx export')
optdepends=('php-tcpdf: pdf export')
options=('!strip' 'emptydirs')
backup=("etc/$pkgname/conf.php")
install=dolibarr.install
source=("http://downloads.sourceforge.net/project/$pkgname/Dolibarr%20ERP-CRM/$pkgver/$pkgname-$pkgver.tgz"
        nginx.conf.example
        apache.conf.example)
b2sums=('06be067676cae8a2372f5082e10d9742372ce3fdc494e0b132de9872d70be4dc69ffdd8197930fee30a994774dd8d9f73a3c3666d41a0d6a4a5ae438fc05320b'
        'a9735e32fb447b99f688b6121e7abe39133a2cda3de58dba32201b3688b1f8ce90ebbf676bafe2f877b5203ff61bb468657a6b8685829edb9a46d192d82edacc'
        '243dcd12c4f02974d6775972e32c2fbe9648ed0844a1ab5253ba9954e76d29401f08a465116db7b2a56d4f7f78223690b382588b34341c608174188a8950278f')

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

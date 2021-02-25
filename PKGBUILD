# Maintainer: Charles Brunet <charles AT cbrunet DOT net>
# Contributor: Okki <okki666@free.fr>
pkgname=dolibarr
pkgver=13.0.1
pkgrel=1
pkgdesc="ERP/CRM for small and medium companies"
arch=('any')
url="http://www.dolibarr.org/"
license=('GPL3')
depends=('php')
optdepends=('mariadb-clients: MariaDB backend')
optdepends=('postgresql: postgresql backend')
optdepends=('php-gd: To display graphs')
optdepends=('php-intl: Languages support')
optdepends=('php-xsl: xlsx export')
optdepends=('php-tcpdf: pdf export')
options=('!strip' 'emptydirs')
backup=("etc/webapps/$pkgname/conf.php")
install=dolibarr.install
source=("http://downloads.sourceforge.net/project/$pkgname/Dolibarr%20ERP-CRM/$pkgver/$pkgname-$pkgver.tgz"
        nginx.conf.example
        apache.conf.example)
md5sums=('50735c0a916d1ebec924a4e23408b928'
         '4b36b8318edad5fe10fd9ef5ade92ed3'
         'd468572a7aa663d958c302b3e15147f1')

prepare() {
	sed -e "3,5d" \
		-e "s|example for ||g" \
		-e "s|main_document_root=''|main_document_root='/usr/share/webapps/$pkgname/htdocs'|g" \
		-e "s|main_data_root=''|main_data_root='/var/lib/$pkgname'|g" \
		"$pkgname-$pkgver/htdocs/conf/conf.php.example" >"$pkgname-$pkgver/htdocs/conf/conf.php"
}

package() {
	mkdir -p "$pkgdir/usr/share/webapps/$pkgname"
	mkdir -p "$pkgdir/etc/webapps/$pkgname"
	mkdir -p "$pkgdir/var/lib/$pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$pkgdir/usr/share/doc/$pkgname"

	cp *.conf.example "$pkgdir/etc/webapps/$pkgname/"

	cd "$pkgname-$pkgver"
	cp -ra htdocs "$pkgdir/usr/share/webapps/$pkgname/"
	cp -ra scripts "$pkgdir/usr/share/webapps/$pkgname/"
	cp COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	cp -ra doc/* "$pkgdir/usr/share/doc/$pkgname/"
	cp htdocs/conf/conf.php "$pkgdir/etc/webapps/$pkgname/conf.php"
	rm "$pkgdir/usr/share/webapps/$pkgname/htdocs/conf/conf.php"
	ln -s /etc/webapps/$pkgname/conf.php "$pkgdir/usr/share/webapps/$pkgname/htdocs/conf/conf.php"
}

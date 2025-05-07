# Maintainer: adrienb39 <adrienb39@yahoo.com>
pkgname=gestimag
_pkgname=gestimag
pkgver=0.0.1
pkgrel=4
pkgdesc="Gestimag ERP CRM: modern software package to manage your company"
arch=('any')
url="http://adrien.digitaledeluxe.fr/gestimag/"
license=('GPL-3.0-or-later')
makedepends=('git')
depends=('apache' 'mariadb' 'php' 'php-gd')
optdepends=('mariadb-clients: MariaDB backend')
optdepends=('postgresql: postgresql backend')
optdepends=('php-xsl: xlsx export')
optdepends=('php-tcpdf: pdf export')
options=('!strip' 'emptydirs')
backup=("etc/$_pkgname/conf.php")
install=gestimag.install
source=(git+https://github.com/adrienb39/$_pkgname#branch=main
        gestimag.conf
        nginx.conf.example
        apache.conf.example)
b2sums=('SKIP')
pkgver() {
  cd $_pkgname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

prepare() {
	sed -e "3,5d" \
		-e "s|example for ||g" \
		-e "s|main_document_root=''|main_document_root='/usr/share/$_pkgname/htdocs'|g" \
		-e "s|main_data_root=''|main_data_root='/var/lib/$_pkgname'|g" \
		"$_pkgname/htdocs/conf/conf.php.example" >"$_pkgname/htdocs/conf/conf.php"
}

package() {
	mkdir -p "$pkgdir/usr/share/$_pkgname"
	mkdir -p "$pkgdir/etc/$_pkgname/contrib"
	mkdir -p "$pkgdir/var/lib/$_pkgname"
	mkdir -p "$pkgdir/usr/share/licenses/$_pkgname"
	mkdir -p "$pkgdir/usr/share/doc/$_pkgname"
        mkdir -p "$pkgdir/etc/systemd/system/php-fpm.service.d"

        cp *.conf.example "$pkgdir/etc/$_pkgname/contrib/"
        cp gestimag.conf "$pkgdir/etc/systemd/system/php-fpm.service.d/"

	cd "$_pkgname"
	cp -ra htdocs "$pkgdir/usr/share/$_pkgname/"
	cp -ra scripts "$pkgdir/usr/share/$_pkgname/"
	cp COPYING "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	cp -ra doc/* "$pkgdir/usr/share/doc/$_pkgname/"
	cp htdocs/conf/conf.php "$pkgdir/etc/$_pkgname/conf.php"
	rm "$pkgdir/usr/share/$_pkgname/htdocs/conf/conf.php"
	ln -s /etc/$_pkgname/conf.php "$pkgdir/usr/share/$_pkgname/htdocs/conf/conf.php"
}

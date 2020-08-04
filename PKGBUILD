
pkgname=leed
pkgver=1.9.0
pkgrel=1
pkgdesc="A minimalist RSS/ATOM aggregator which offers fast RSS consultation and non-intrusive features"
arch=(any)
url="https://github.com/LeedRSS/Leed"
license=("AGPL-3.0")
optdepends=('php-apache: to use the Apache web server')
depends=("php" "mariadb")
makedepends=("unzip")
backup=("etc/webapps/leed/apache.conf")
install=leed.install
options=(emptydirs)

source=("$pkgname-$pkgver.zip::https://github.com/LeedRSS/Leed/archive/v$pkgver.zip"
	'apache.conf'
	'leed.perm.sh')
md5sums=('8c55b2df4de403c84b86f8e5adfea87e'
         'f980af079368ad99447c7722e1cd376a'
         '43376a391f39e9fd177cec991ab45706')


pkgver() {
    curl -Is https://github.com/LeedRSS/Leed/releases/latest | awk -F'/' '/^location/ {print $NF}' | sed 's/v//' | sed 's/[^[:print:]]//'
}



package() {
    ### install leed
    mkdir -p "${pkgdir}/usr/share/webapps/"
    cp -ar Leed-$pkgver "${pkgdir}/usr/share/webapps/leed"

    ### default perm
    find "${pkgdir}/usr/share/webapps/leed/" -type f -exec chmod 0640 {} \;
    find "${pkgdir}/usr/share/webapps/leed/" -type d -exec chmod 0750 {} \;
    install -D -m755 "${srcdir}/leed.perm.sh" "${pkgdir}/usr/bin/set-leed-perm"

    ### apache conf (optionnal)
    mkdir -p "${pkgdir}/etc/webapps/leed"    
    install -m644 "${srcdir}/apache.conf" "${pkgdir}/etc/webapps/leed/apache.conf"

}

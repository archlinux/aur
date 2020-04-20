
pkgname=leed
pkgver=1.8.4
pkgrel=1
pkgdesc="Leed (short for Light Feed) is a minimalist RSS/ATOM aggregator which offers fast RSS consultation and non-intrusive features."
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
md5sums=('e94088506f8e4fea6d9512e6e2bf718b'
         'f980af079368ad99447c7722e1cd376a'
         '24cc8fa2aa47807bccb1c64d2f6b7198')


pkgver() {
    curl -Is https://github.com/LeedRSS/Leed/releases/latest | awk -F'/' '/^location/ {print $NF}' | sed 's/v//' | sed 's/[^[:print:]]//'
}



package() {
    ### install leed
    mkdir -p "${pkgdir}/usr/share/webapps/leed"
    cp -a Leed-$pkgver "${pkgdir}/usr/share/webapps/leed/."

    ### default perm
    find "${pkgdir}/usr/share/webapps/leed/" -type f -print0 | xargs -0 chmod 0640
    find "${pkgdir}/usr/share/webapps/leed/" -type d -print0 | xargs -0 chmod 0750
    install -D -m755 "${srcdir}/leed.perm.sh" "${pkgdir}/usr/bin/set-leed-perm"

    ### apache conf (optionnal)
    mkdir -p "${pkgdir}/etc/webapps/leed"    
    install -m644 "${srcdir}/apache.conf" "${pkgdir}/etc/webapps/leed/apache.conf"

}

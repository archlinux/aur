# Maintainer: danieltetraquark
# Contributor: mawcomw  <mawcomw@gmail.com>

pkgname=limesurvey
_pkgver="7.10.0"
_pkgdate="261109"
_foldername=${pkgname}
pkgver=$_pkgver+$_pkgdate
pkgrel=1
pkgdesc="The most popular FOSS online survey tool on the web."
options=(!strip)
depends=('php')
license=('GPL2')
arch=('any')
url="https://www.limesurvey.org"
source=(
https://download.limesurvey.org/latest-master/limesurvey${pkgver}.zip
)
sha256sums=('05b72d1d424a7a6b8ac5ae86f240e14aabe121c3c4e83295d4e64a928786f9db')

optdepends=('apache: a supported application server'
	    'nginx: a supported application server'
	    'mariadb: MariaDB database support'
	    'mysql: MySQL database support'
	    'postgresql: PostgreSQL database support'
            'php-imap: email bounce tracking system'
#            'php-iconv: for some encodings when handling excel files'
            'php-gd: for CAPTCHAs and graphs'
            'php-sodium: for data encryption')
#            'php-ldap: import survey participants using ldap')

backup=('etc/webapps/limesurvey/config.php')

package() {
    _instdir="$pkgdir"/usr/share/webapps
    mkdir -p "$_instdir" "$pkgdir"/etc/webapps/limesurvey


    #install license
    install -Dm644 "${srcdir}/${_foldername}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cd "$_instdir"
    cp -ra "$srcdir"/${_foldername}/ ./limesurvey

    ln -s /etc/webapps/limesurvey/config.php "$pkgdir"/usr/share/webapps/limesurvey/application/config/config.php

    chown -R http:http "$_instdir"/limesurvey/application/config
    chown -R http:http "$_instdir"/limesurvey/upload
    chown -R http:http "$_instdir"/limesurvey/tmp

    chown -R http:http "$pkgdir"/etc/webapps/limesurvey

#    chown -R http:http "$_instdir"/limesurvey/

# TODO: apache, nginx example config

    echo "configure your webserver and phpbackend. Files are at /usr/share/webapps/limesurvey. In the browser, go to /index.php?r=installer."
}

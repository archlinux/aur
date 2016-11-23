
pkgname=piwigo
pkgver=2.8.3
pkgrel=1
pkgdesc="Piwigo is a photo gallery software for the web that comes with powerful features to publish and manage your collection of pictures."
arch=(any)
url="http://piwigo.org/"
license=("GPL")
depends=("php" "php-gd" "mariadb")
makedepends=("wget" "unzip")
backup=("etc/webapps/piwigo/apache.conf")
install=piwigo.install
options=(emptydirs)

source=('http::http://piwigo.org/download/dlcounter.php?code=latest'
	'apache.conf'
	'piwigo.perm.sh')
md5sums=('da7d4fd93bca8dd2fdd7ca6782ed2a86'
         '5d1da01ee31fa1ad7a2b7e11766ec1f7'
         'a855fa62a5ae3595f3361ae42c3cdf2f')


pkgver() {
    curl -Is https://github.com/Piwigo/Piwigo/releases/latest | awk -F'/' '/^Location/ {print $NF}' |  sed 's/[^[:print:]]//'
}



package() {
    ### install piwigo
    mkdir -p "${pkgdir}/usr/share/webapps"
    cp -a piwigo "${pkgdir}/usr/share/webapps/."

    ### default perm
    find "${pkgdir}/usr/share/webapps/piwigo/" -type f -print0 | xargs -0 chmod 0640
    find "${pkgdir}/usr/share/webapps/piwigo/" -type d -print0 | xargs -0 chmod 0750
    install -D -m755 "${srcdir}/piwigo.perm.sh" "${pkgdir}/usr/bin/set-piwigo-perm"

    ### apache conf (optionnal)
    mkdir -p "${pkgdir}/etc/webapps/piwigo"    
    install -m644 "${srcdir}/apache.conf" "${pkgdir}/etc/webapps/piwigo/apache.conf"

}

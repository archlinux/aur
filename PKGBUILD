# Maintainer: Foppe HEMMINGA <foppe@hemminga.net>
# Contributer: Julien Girardin <jugirardin@gmail.com>

pkgname=piwigo
pkgver=2.8.2
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

source=('apache.conf'
	'piwigo.perm.sh')
md5sums=('SKIP' 'SKIP')

prepare() {
    # I don't find a way to overide DLAGENTS from makepkg.conf to use wget and option to set the filename according to http header, so I get the package here ... Ugly  ...
    
    /usr/bin/wget -N --content-disposition http://piwigo.org/download/dlcounter.php?code=latest	
}

pkgver() {
    ls piwigo-*.zip |sed -e s/piwigo-// |sed -e s/.zip//
}

build() {
    rm -rf piwigo
    /usr/bin/unzip piwigo-$pkgver.zip
}

package() {
    ### install piwigo
    mkdir -p "${pkgdir}/usr/share/webapps"
    cp -a piwigo "${pkgdir}/usr/share/webapps/."

    ### default perm
    install -D -m755 "${srcdir}/piwigo.perm.sh" "${pkgdir}/usr/bin/set-piwigo-perm"

    ### apache conf (optionnal)
    mkdir -p "${pkgdir}/etc/webapps/piwigo"    
    install -m644 "${srcdir}/apache.conf" "${pkgdir}/etc/webapps/piwigo/apache.conf"

}

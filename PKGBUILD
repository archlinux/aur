# Contributor: Max Devaine <maxdevaine@gmail.com>

pkgname=flexibee
pkgver=2018.2.7.3
pkgbasever=2018.2
pkgrel=1
pkgdesc="Accounting economic system for person and business. Server and client in one package."
arch=('i686' 'x86_64')
url="http://www.flexibee.eu"
license=('custom')
depends=('glibc' 'java-environment')
install=flexibee.install
source=("http://download.flexibee.eu/download/$pkgbasever/$pkgver/flexibee-$pkgver.tar.gz"
        "flexibee")


sha256sums=('6f332f90fac4c27df6b7ef521f50f8569c8fc24a28949dc38cb0cbefd01ea158'
            '0aaf79ac30bfc5af5e9aba6d1b1189a76019551d3183621bcb9f2bdbe7ea39e3')

prepare() {
    cd ${srcdir}/flexibee-$pkgver
    
    #replace postgresql port
    sed -i 's/<entry key="port">5435/<entry key="port">5432/' etc/flexibee/flexibee-server.xml

    #replace flexibee user
    sed -i 's/FLEXIBEE_USER="winstrom"/FLEXIBEE_USER="flexibee"/' etc/default/flexibee

    #replace flexibee user
    sed -i 's/FLEXIBEE_USER="winstrom"/FLEXIBEE_USER="flexibee"/' usr/sbin/flexibee-server
    
    rm -rf etc/init.d
}

package() {

    cd ${srcdir}/flexibee-$pkgver

    # Prepare destination directory
    install -d -m 755 "${pkgdir}/usr/share/fonts/TTF"
    install -d -m 755 "${pkgdir}/usr/bin"
    install -d -m 755 "${pkgdir}/etc/flexibee"
    install -d -m 755 "${pkgdir}/etc/logrotate.d"
    install -d -m 755 "${pkgdir}/etc/default"
    install -d -m 755 "${pkgdir}/etc/rc.d"
    install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"

    # Install rc script
    install -m 755 ${startdir}/flexibee "${pkgdir}/etc/rc.d/"

    # Install fonts and license
    install -m 644 ./usr/share/fonts/truetype/*.ttf "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 ./usr/share/doc/flexibee/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 ./usr/share/doc/flexibee/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}"

    #config file
    install -m 644 ./etc/flexibee/* "${pkgdir}/etc/flexibee/"
    install -m 644 ./etc/default/* "${pkgdir}/etc/default/"
    install -m 644 ./etc/logrotate.d/* "${pkgdir}/etc/logrotate.d/"


    #binary
    rm -rf ./usr/share/fonts
    rm -rf ./usr/share/app-install
    
    for f in $(find ./usr/share -type d) 
    do
		install -d -m 755 ${pkgdir}/${f}
    done
    
    for f in $(find ./usr/share -type f) 
    do
		if [ -x ${f} ]
		then
			install -m 755 ${f} "${pkgdir}/${f}"
		else
			install -m 644 ${f} "${pkgdir}/${f}"
		fi
    done   
    
	install -m 755 ./usr/bin/flexibee "${pkgdir}/usr/bin/"
	install -m 744 ./usr/sbin/flexibee-server "${pkgdir}/usr/bin/"

}


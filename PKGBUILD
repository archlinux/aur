# Contributor: M0Rf30

pkgname=capanalysis
pkgver=1.1.3
pkgrel=1
arch=(i686 x86_64)
pkgdesc="PCAP files from another point of view"
url="http://www.capanalysis.net/"
license=('GPL')
_arch='amd64'
[[ "${CARCH}" = i686 ]] && _arch='i386'
depends=('glibc' 'libpcap' 'libpqxx' 'sqlite' 'openssl098' 'zlib' 'wireshark-cli' 'apache' 'php-apache' 'php-sqlite' 'php-pgsql' 'postgresql')

source=(http://www.capanalysis.net/pkg/${pkgname}_${pkgver}-trial_${_arch}.deb
	capanalysis.service
	capana.conf)
install=capanalysis.install
md5sums=('5964cb23c2442013c8fae4ae0f5f9390'
	 '9c33942e477795f97539cc7e57e404cf'
	 '9c8e3ca78f5dd0b8616b6c8b1e5e4e1e')
[[ "${CARCH}" = i686 ]] && md5sums[0]='a8ec6f3c02118ee8597683c73a14eaa0'

package() {
    cd $srcdir/
    tar xvf data.tar.gz
    mv {etc,opt,usr} $pkgdir
    mkdir -p $pkgdir/etc/httpd/conf/extra
    cp capana.conf $pkgdir/etc/httpd/conf/extra/httpd-capana.conf
    rm -r $pkgdir/etc/{apache2,init.d}
    rm -r $pkgdir/usr/share/applications
    install -Dm644 capanalysis.service "${pkgdir}"/usr/lib/systemd/system/capanalysis.service
    sed -i 's/sudo service capanalysis start/sudo systemctl start capanalysis.service/g' $pkgdir/opt/capanalysis/www/capinstall/app/pages/default/default.php
    sed -i 's/sudo service postgresql restart/sudo systemctl start postgresql.service/g' $pkgdir/opt/capanalysis/www/capinstall/app/pages/default/default.php

    ln -s -r /usr/lib/libpcap.so $pkgdir/usr/lib/libpcap.so.0.8
}


# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Bazon <bazonbloch@arcor.de>

pkgname=activinspire
pkgver=2.14.67304
pkgrel=2
pkgdesc="Presentation Software to use with Promethean Hardware products."
arch=('i686' 'x86_64')
url="https://support.prometheanworld.com/product/activinspire"
license=('unknown')
depends_i686=('qt4' 'gst-plugins-base' 'libjpeg6' 'jre7-openjdk' 'openssl-1.0' 'libpulse' 'recordmydesktop')
depends_x86_64=('qt4' 'lib32-gst-plugins-base' 'bin32-jre' 'lib32-libjpeg' 'lib32-libjpeg6' 'lib32-libxmu' 'lib32-alsa-lib' 'lib32-openssl-1.0' 'lib32-libpulse' 'recordmydesktop')

optdepends=('activdriver: promethean hardware support'
            'activtools: hardware calibration'
	    'activrelay: promethean driver with classflow')

if [ "${CARCH}" = "i686" ]
then
	_arch="i386"
else
	_arch="amd64"
fi

_u="http://activsoftware.co.uk/linux/repos/ubuntu/pool/non-oss/a/"
source_i686=(${_u}activinspire/activinspire_${pkgver}-1."$_arch"_"$_arch".deb)
source_x86_64=(${_u}activinspire/activinspire_${pkgver}-1."$_arch"_"$_arch".deb)

md5sums_i686=('e8d8790bab3e74de868e80fedaf95029')
md5sums_x86_64=('24d75df7df8b6328fb65a36b8730f407')

prepare() {
	bsdtar -xf activinspire_${pkgver}-1.${_arch}_${_arch}.deb
}

package() {
        # extract the archive
        bsdtar -xf data.tar.gz -C "$pkgdir"

        # move out of the local directory to match arch standards
        mv "$pkgdir"/usr/local/bin "$pkgdir"/usr/
        rmdir "$pkgdir"/usr/local

        # the starting script contains a lot of stuff specific to ubuntu, we don't need that and make a shorter one
        mv "$pkgdir"/usr/bin/inspire "$pkgdir"/usr/bin/inspire-for-ubuntu
        echo "#! /bin/bash" > "$pkgdir"/usr/bin/inspire
        # in order to make java work, we need an export for 64bit versions:
        if [ "$CARCH" = "x86_64" ]; then
            echo "export JAVA_HOME=/usr/lib32/jvm/java32-8-jre/jre/" >> "$pkgdir"/usr/bin/inspire
        fi
        echo "cd /usr/bin/activsoftware" >> "$pkgdir"/usr/bin/inspire
        echo "./Inspire \$1" >> "$pkgdir"/usr/bin/inspire
        chmod 755 "$pkgdir"/usr/bin/inspire
        
        # delete the no-compiz-shortcut. if you want it, delete the following line
        rm "$pkgdir"/usr/share/applications/activsoftware-nc.desktop 

        # modify the other one to match the new path and add a better hires icon
        install -Dm644 "$pkgdir/usr/bin/activsoftware/inspire.ico" "$pkgdir/usr/share/icons/hicolor/512x512/apps/inspire.ico"
        sed -i 's/48x48\/apps\/asstudio.png/512x512\/apps\/inspire.ico/' "$pkgdir"/usr/share/applications/activsoftware.desktop
        sed -i 's/usr\/local\/bin/usr\/bin/' "$pkgdir"/usr/share/applications/activsoftware.desktop
        rm -r "$pkgdir/DEB"
}

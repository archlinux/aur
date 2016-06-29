# Maintainer: Bazon <bazonbloch@arcor.de>
# Contributor: Jose Riha <jose1711 gmail com>
pkgname=activinspire
pkgver=2.4.66096
pkgrel=1
pkgdesc="Presentation Software to use with Promethean Hardware products."
arch=('i686' 'x86_64')
url="http://activsoftware.co.uk/linux/repos/ubuntu/dists/precise/Release"
license=('unknown')
if [ "$CARCH" = "i686" ]; then
  _arch='i386'
  _md5sum='84c938dc4c06e47223d00575f42c563e'
  depends=('qt4' 'gstreamer0.10-good-plugins' 'libjpeg6' 'jre7-openjdk' 'openssl098' 'libpulse')
else
  _arch='amd64'
  _md5sum='41bc8381221eadeb72ec6f1eaf6d2e70'
  depends=('qt4' 'gstreamer0.10-good-plugins' 'bin32-jre' 'lib32-libjpeg' 'lib32-libxmu' 'lib32-gstreamer0.10-base' 'lib32-alsa-lib' 'lib32-openssl098' 'lib32-libpulse' 'lib32-libjpeg6-turbo')
fi
optdepends=('activdriver: promethean hardware support'
            'activtools: hardware calibration')
source=(http://activsoftware.co.uk/linux/repos/ubuntu/pool/non-oss/a/activinspire/activinspire_$pkgver-1."$_arch"_"$_arch".deb)
md5sums=( $_md5sum ) 
package() {
        # extract the archive
        bsdtar -xf data.tar.gz -C "$pkgdir"

        # move out of the local directory to match arch standards
        mv "$pkgdir"/usr/local/bin "$pkgdir"/usr/
        rmdir "$pkgdir"/usr/local

        # the included libphonon_gstreamer.so makes inspire crash on64bit, so take a link to a working one instead
        if [ "$CARCH" = "x86_64" ]; then
            rm "$pkgdir"/usr/bin/activsoftware/phonon_backend/libphonon_gstreamer.so
            ln -s /usr/lib/libphonon.so "$pkgdir"/usr/bin/activsoftware/phonon_backend/libphonon_gstreamer.so
        fi

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
}

# Maintainer: ambra <echo mail@a1m2b3r4a5s6p7a8c9e.com|sed 's/[0-9]//g'>

pkgname=geotrans-bin
pkgver=3.9
pkgrel=1
pkgdesc="NGA and DOD approved coordinate converter and datum translator"
arch=('x86_64')
url="https://earth-info.nga.mil/GandG/update/index.php?action=home"
license=('unknown')
depends=('java-runtime')
source=("$pkgname-$pkgver.tar.gz::https://earth-info.nga.mil/php/download.php?file=wgs-linuser"
geotrans_logo.png
GeoTrans.desktop)
sha256sums=('11ff795a4b6b78c4dd8b6e66b1f688eacfd12386db416c3f1aa68aa4301cba7c'
'9197dce710362d9dadafcc85d12b2b5cbb84878e2498f283194d9a425ca33cfa'
'14c9ffcfdd01e5b81eaee666140bb2879714160a475de12f7934b997e9ab2e87')

package() {

    mkdir "${pkgdir}/opt"
    cp -R "geotrans${pkgver}" "${pkgdir}/opt/${pkgname}"

    install -Dm644 geotrans_logo.png $pkgdir/usr/share/icons/hicolor/32x32/apps/geotrans_logo.png

    install -Dm644 GeoTrans.desktop $pkgdir/usr/share/applications/GeoTrans.desktop

    mkdir -p $pkgdir/usr/bin
    ln -s /opt/$pkgname/GEOTRANS3/linux_64/runGeotrans.sh $pkgdir/usr/bin/geotrans

    chmod u+w $pkgdir/opt/$pkgname/GEOTRANS3/linux_64/runGeotrans.sh
    cat > $pkgdir/opt/$pkgname/GEOTRANS3/linux_64/runGeotrans.sh <<EOF
#!/bin/sh

DIR=/opt/$pkgname/GEOTRANS3/linux_64

export LD_LIBRARY_PATH="\${DIR}:\${DIR}/../../CCS/linux_64"
export MSPCCS_DATA="\${DIR}/../../data"
export JAVA_HOME="/usr/lib/jvm/default"
export LANG="en_US"

\${JAVA_HOME}/bin/java -Xss1024k -jar \${DIR}/MSPCCS.jar >& /dev/null
EOF

}

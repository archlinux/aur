# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Co-Maintainer: Ilya Chelyadin  <ilya77105@gmail.com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2020
_pkgver=2020
pkgrel=1
pkgdesc="Autodesk Maya 3D modelling software suite"
arch=('x86_64')
url="http://www.autodesk.com/products/maya/overview"
license=('custom: unlimited')
depends=('libpng15' 'tcsh' 'libxp' 'openssl' 'libjpeg6-turbo' 'libtiff' 'gamin' 'fuse2' #changed to libpng15, added fuse2
         'audiofile' 'e2fsprogs' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi'
         'xorg-fonts-misc' 'openssl-1.0')
install="maya.install"
options=(!strip)
source=('http://edutrial.autodesk.com/NetSWDLD/2020/MAYA/BB8314BA-8DE1-45E4-B827-79F63158212E/ESD/Autodesk_Maya_2020_ML_Linux_64bit.tgz'
        'maya.desktop')
sha512sums=('3a41b59cbed83edc0344d69ac0a0391ea7152ae8e7c4af9f0ea472d3de8d66538d2acaaef909fcb36ef1d2b5f5b9d3986899f1dbae928e395dff36337656c2d8'
            '30611e2271c306a1ba534534d1a0e976c9f83f13c6400a164cdd06bddf8f5c1f6b4e758edfc22072588c0b34de0579f498af58ef771be2e64035336786a5f667')

            
prepare() {
    cd "$srcdir"
    
    rm -Rf ../maya-setup
    mkdir -p ../maya-setup
    mv * ../maya-setup
}

package() {
    cd "$pkgdir"
    
    # Extract RPMs
    for i in ../../maya-setup/Packages/*.rpm; do
        msg2 "Extracting ${i}"
        bsdtar -xf $i
    done
    
    mkdir "$pkgdir"/usr/tmp/
    chmod 777 "$pkgdir"/usr/tmp/
    
#    mkdir -p "$pkgdir"/usr/lib/
#    chmod 755 "$pkgdir"/usr/lib/
#    cp "$pkgdir"/opt/Autodesk/Adlm/R12/lib64/libadlmPIT.so.12  "$pkgdir"/usr/lib/libadlmPIT.so.12
#    cp "$pkgdir"/opt/Autodesk/Adlm/R12/lib64/libadlmutil.so.12 "$pkgdir"/usr/lib/libadlmutil.so.12
    
    ln -s /usr/lib/libssl.so.1.0.0 "$pkgdir"/usr/autodesk/maya2020/lib/libssl.so.10
    ln -s /usr/lib/libcrypto.so.1.0.0 "$pkgdir"/usr/autodesk/maya2020/lib/libcrypto.so.10
    ln -s /usr/lib/libjpeg.so.62 "$pkgdir"/usr/autodesk/maya2020/lib/libjpeg.so.62
    ln -s /usr/lib/libtiff.so "$pkgdir"/usr/autodesk/maya2020/lib/libtiff.so.3
    
    mkdir -p "$pkgdir"/usr/bin/
    chmod 755 "$pkgdir"/usr/bin/
    ln -s /usr/autodesk/maya2020/bin/maya2020 "$pkgdir"/usr/bin/maya2020
    
    mkdir -p "$pkgdir"/usr/share/applications/
    mkdir -p "$pkgdir"/var/opt/Autodesk/
    
    chmod 755 "$pkgdir"/usr/share/applications/
    install -Dm644 ../../maya-setup/maya.desktop "$pkgdir"/usr/share/applications/maya.desktop

    ln -sf /opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/AdskLicensingService "$pkgdir"/usr/bin/AdskLicensingService
    ln -sf /tmp "$pkgdir"/usr/tmp #Maya uses /usr/tmp instead of normal /tmp, installing symlink
    mkdir -p "$pkgdir"/usr/lib/systemd/system/
    cp -f "$pkgdir"/opt/Autodesk/AdskLicensing/9.2.1.2399/AdskLicensingService/adsklicensing.el7.service "$pkgdir"/usr/lib/systemd/system/adsklicensing.service
    chmod 644 "$pkgdir"/usr/lib/systemd/system/adsklicensing.service
    
    
#     mkdir -p "$pkgdir"/opt/maya-setup/
#     chmod 755 "$pkgdir"/opt/maya-setup/
#     cp ../../maya-setup/Setup "$pkgdir"/opt/maya-setup/
#     cp ../../maya-setup/setup.xml "$pkgdir"/opt/maya-setup/

}

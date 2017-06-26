# Maintainer ~ kyle[dot]devir[at]mykolab[dot]com
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=maya
pkgver=2017_UPDATE_4
_pkgver=2017_Update4
pkgrel=1
pkgdesc="Autodesk Maya 3D modelling software suite"
arch=('x86_64')
url="http://www.autodesk.com/products/maya/overview"
license=('custom: unlimited')
depends=('libpng12' 'tcsh' 'libxp' 'openssl' 'libjpeg6-turbo' 'libtiff' 'gamin'
         'audiofile' 'e2fsprogs' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi'
         'xorg-fonts-misc' 'openssl-1.0')
install="maya.install"
options=(!strip)
source=("http://up.autodesk.com/2017/MAYA/Autodesk_Maya_${_pkgver}_EN_Linux_64bit.tgz"
        'maya.desktop')
sha512sums=('2a61fd644b904b0d50d6376d45e6c9e1fdcfe2c2a24ef3ca4eccebaba34e4c026b60640d4a31678d64076d5b3a57eec788e138edba896926d6ba20e295f0e819'
            '1050ff7d4ff5e0686cab8c7977b83fd8c911f88afa8a93b7cb7d4a095f1a441d9f3732be9a59406856904a406ffe07c4633f92b7c91b052f8d4cd1422f5e7f3f')

prepare() {
    cd "$srcdir"
    
    rm -Rf ../maya-setup
    mkdir -p ../maya-setup
    mv * ../maya-setup
}

package() {
    cd "$pkgdir"
    
    # Extract RPMs
    for i in ../../maya-setup/*.rpm; do
        msg2 "Extracting ${i}"
        bsdtar -xf $i
    done
    
    mkdir "$pkgdir"/usr/tmp/
    chmod 777 "$pkgdir"/usr/tmp/
    
#    mkdir -p "$pkgdir"/usr/lib/
#    chmod 755 "$pkgdir"/usr/lib/
#    cp "$pkgdir"/opt/Autodesk/Adlm/R12/lib64/libadlmPIT.so.12  "$pkgdir"/usr/lib/libadlmPIT.so.12
#    cp "$pkgdir"/opt/Autodesk/Adlm/R12/lib64/libadlmutil.so.12 "$pkgdir"/usr/lib/libadlmutil.so.12
    
    ln -s /usr/lib/libssl.so.1.0.0 "$pkgdir"/usr/autodesk/maya2017/lib/libssl.so.10
    ln -s /usr/lib/libcrypto.so.1.0.0 "$pkgdir"/usr/autodesk/maya2017/lib/libcrypto.so.10
    ln -s /usr/lib/libjpeg.so.62 "$pkgdir"/usr/autodesk/maya2017/lib/libjpeg.so.62
    ln -s /usr/lib/libtiff.so "$pkgdir"/usr/autodesk/maya2017/lib/libtiff.so.3
    
    mkdir -p "$pkgdir"/usr/bin/
    chmod 755 "$pkgdir"/usr/bin/
    ln -s /usr/autodesk/maya2017/bin/maya2017 "$pkgdir"/usr/bin/maya2017
    
    mkdir -p "$pkgdir"/usr/share/applications/
    chmod 755 "$pkgdir"/usr/share/applications/
    install -Dm644 ../../maya-setup/maya.desktop "$pkgdir"/usr/share/applications/maya.desktop

    mkdir -p "$pkgdir"/opt/maya-setup/
    chmod 755 "$pkgdir"/opt/maya-setup/
    cp ../../maya-setup/setup{,.xml} "$pkgdir"/opt/maya-setup/
}

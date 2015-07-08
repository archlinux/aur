# Maintainer:  Hao Zhang <theivorytower [at] gmail [dot] com>

pkgname=systemmodeler
pkgver=4.1.0
pkgrel=1
pkgdesc="An easy-to-use, next-generation modeling and simulation environment for cyber-physical systems."
arch=('i686' 'x86_64')
url="https://www.wolfram.com/system-modeler/"
license=('proprietary')
source=("file://SystemModeler_${pkgver}_LINUX.sh")
md5sums=('482cec00186d7ea40dd4ade3170bda70')
install='systemmodeler.install'
options=('!strip')

PKGEXT=".pkg.tar"

build() {
    chmod +x ${srcdir}/SystemModeler_${pkgver}_LINUX.sh
}

package() {
    ${srcdir}/SystemModeler_${pkgver}_LINUX.sh -- -execdir=${pkgdir}/usr/bin -targetdir=${pkgdir}/opt/SystemModeler -auto
    
    echo "Fixing symbolic symlinks"
    cd $pkgdir/usr/bin
    rm *
    ln -s /opt/SystemModeler/bin/ModelCenter systemmodeler
    ln -s /opt/SystemModeler/bin/ModelCenter SystemModeler

    echo "Copying menu and mimetype information..."
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/desktop-directories
    mkdir -p ${pkgdir}/usr/share/mime/packages

    cd ${pkgdir}/opt/SystemModeler/SystemFiles/Installation

    sed -i 's/^[ \t]*//' wolfram-wsm4.desktop
    sed -i "s@$pkgdir@@" wolfram-wsm4.desktop
    
    cp wolfram-wsm4.desktop ${pkgdir}/usr/share/applications/
    cp wolfram-wsm.directory ${pkgdir}/usr/share/desktop-directories/
    cp *.xml ${pkgdir}/usr/share/mime/packages/

    echo "Copying icons..."
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/{32x32,64x64,128x128,256x256}/{apps,mimetypes}
    for i in "32" "64" "128" "256"; do
        cp SystemModeler_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-systemmodeler.png

        cp dotmo_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.mo.png
        cp dotsme_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.sme.png

        cp dotmo_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/gnome-mime-application-vnd.wolfram.mo.png
        cp dotsme_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/gnome-mime-application-vnd.wolfram.sme.png
    done

    for i in "32" "64" "128"; do
        cp dotsma_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.sma.png        
        cp dotsma_${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/gnome-mime-application-vnd.wolfram.sma.png        
    done

    echo "Fixing file permissions..."
    chmod go-w -R ${pkgdir}/*

    echo "Done."
}

# vim:set ts=2 sw=2 et:


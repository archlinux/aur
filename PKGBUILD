# Maintainer: basigur

pkgname=joxi
pkgver=3.0.15
pkgrel=2
pkgdesc="Free tool for screen capture"
arch=('x86_64')
url="http://joxi.net"
license=('custom')
depends=('qt5-svg' 'qt5-multimedia' 'qt5-x11extras' 'qt5-wayland' 'openssl-1.0' 'qt5-location' 'rtmpdump')
source=("${pkgname}-${pkgver}.run::http://dl.joxi.ru/linux/${pkgname}.run")
options=(!strip)
sha512sums=('2f6a18b84ca862f6612ecd612cf81ba934b11680ae0fcfd8184cfb8f0d61a11420ec69073e8b39ab06d2971e489e1f4c0c2b6e0720cc2a181021ed99a6770a06')


prepare() {
    sh "${pkgname}-${pkgver}".run --noexec --target build

    cd build

    rm -f install.sh

    find . -type f -exec chmod 644 {} +
    find . -type d -exec chmod 755 {} +
    
    sed -i 's!$HOME!/opt!' joxi.sh
    sed -i 's! $HOME! /opt!' joxi.sh
    sed -i 's!Comment=!Comment=Joxi - Screenshots quickly and easily!' joxi.desktop
    echo "Comment[ru]=Joxi - Скриншоты быстро и легко" >> joxi.desktop
    echo "Categories=Application;Network;" >> joxi.desktop
    echo "MimeType=application/x-designer;" >> joxi.desktop
    echo "GenericName=Joxi - Screenshot tool" >> joxi.desktop
    echo "GenericName[ru]=Joxi - Создание скриншотов" >> joxi.desktop
    echo "Exec=joxi" >> joxi.desktop
    echo "Icon=joxi" >> joxi.desktop
}


package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}"/usr/share/{pixmaps,applications}

    cp -R -P build/* "${pkgdir}"/opt/${pkgname}/

    ln -s ../../../opt/joxi/joxi.desktop "${pkgdir}"/usr/share/applications/"${pkgname}".desktop
    ln -s ../../../opt/joxi/icon.png "${pkgdir}"/usr/share/pixmaps/"${pkgname}".png
    ln -s ../../opt/joxi/joxi.sh "${pkgdir}/usr/bin/${pkgname}"

    chmod 755 "${pkgdir}/opt/${pkgname}/joxi.sh"
    chmod 755 "${pkgdir}/opt/${pkgname}/joxi"
}

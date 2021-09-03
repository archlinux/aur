#maintainer: sukanka<su975853527[AT]gmail.com>
pkgname=wemeet-bin
_pkgname=wemeet
provides=('wemeet' 'tencent-meeting')
pkgver=2.8.0.0
pkgrel=2
pkgdesc="Tencent Video Conferencing, tencent meeting 腾讯会议"
arch=('x86_64')
license=('unkown')
url="https://source.meeting.qq.com/download-center.html"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://updatecdn.meeting.qq.com/ad878a99-76c4-4058-ae83-22ee948cce98/TencentMeeting_0300000000_${pkgver}_${arch}.publish.deb")
options=(!strip)
depends=('qt5-x11extras' 'hicolor-icon-theme' 'flac' 'libbsd' 'openssl' 'libxrandr' 'qt5-webkit')
sha512sums=('53a7c89f9018f923e847e70e71b4b97d1e6925bf060b9cc9af858b6d08574027d4ffa08c8359856d4b107cec186f3e538cf2b30774bf63f3ab23ba5a187b5851')


package() {
    tar xpf data.tar.xz -C ${pkgdir}
    cd ${pkgdir}/usr/share/applications
    sed -i '3c Exec=wemeet %u ' ${_pkgname}app.desktop 
    
    cd ${pkgdir}/opt/${_pkgname}
    
    for res in {16,32,64,128,256}
    do
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps;
        mv icons/hicolor/${res}x${res}/mimetypes/${_pkgname}app.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}app.png;
    done
    
    sed -i '4c Prefix = /usr/lib/qt' bin/qt.conf
    
    mkdir -p ${pkgdir}/usr/bin
    echo '''#!/bin/sh
export PATH=$PATH:/opt/wemeet/bin
export LD_LIBRARY_PATH=LD_LIBRARY_PATH:/opt/wemeet/lib
export QT_PLUGIN_PATH="/usr/lib/qt/plugins"
exec wemeetapp $*
''' > ${pkgdir}/usr/bin/${_pkgname}
    chmod a+x ${pkgdir}/usr/bin/${_pkgname}
    
    rm -rf plugins icons lib/libQt*
    
    
}


# Maintainer: sukanka<su975853527[AT]gmail.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=wemeet-bin
_pkgname=wemeet
provides=('wemeet' 'tencent-meeting')
pkgver=3.8.0.2
pkgrel=5
pkgdesc="Tencent Video Conferencing, tencent meeting 腾讯会议"
arch=('x86_64')
license=('unknown')
url="https://source.meeting.qq.com/download-center.html"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://updatecdn.meeting.qq.com/MTZlNjg4ZjctOTAwMS00NDg2LWE3ZjMtMjNhZjBmODk3ZTIz/TencentMeeting_0300000000_${pkgver}_${arch}_default.publish.deb"
"${_pkgname}".sh
)
depends=('qt5-x11extras'    'libxrandr'  'libxinerama' 'qt5-webengine'
# 'qt5-tools' 'qt5-location' 'qt5-svg' 'qt5-declarative' 'qt5-wayland' 'qt5-webview' 
## they are shipped with wemeet, but reported by namcap, they are not needed.
'pulseaudio')
# 无 'pulseaudio' 无法连接到系统音频 
optdepends=('bubblewrap: Fix abnormal text color in dark mode.')
makedepends=('patchelf')
sha512sums=('974bc6c4a3ab80333c957f4b4c3e11a7a6b67f24501a1090b537aba47341302123b236c98433f796c9fb077bb306fa66bb19048092351b10f1ea254f68d4c39a'
            '4d12759df4cbc9f341c0c04a4329097a341cf87390bbd409e3f313c593ce6a2bb1811e829136f8bcf39c27643a7df30198670bb84ed62031ee3f369a43ce2e80')

prepare(){
    tar xpf data.tar.xz -C ${srcdir}
    
    cd ${srcdir}/usr/share/applications
    sed -i 's|^Exec=.*|Exec=wemeet %u|g;s|^Icon=.*|Icon=wemeet|g' ${_pkgname}app.desktop 
    sed -i '$i Comment=Tencent Meeting Linux Client\nComment[zh_CN]=腾讯会议Linux客户端\nKeywords=wemeet;tencent;meeting;' \
        "${srcdir}/usr/share/applications/wemeetapp.desktop"
    
    cd ${srcdir}/opt/${_pkgname}
    
    for res in {16,32,64,128,256}
    do
        mkdir -p ${srcdir}/usr/share/icons/hicolor/${res}x${res}/apps;
        mv icons/hicolor/${res}x${res}/mimetypes/${_pkgname}app.png \
            ${srcdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}app.png;
    done
    
    rm bin/qt.conf
    patchelf --set-rpath /usr/lib/${_pkgname} bin/wemeetapp
}

package() {
    cd ${srcdir}
    cp -r usr ${pkgdir}
    cd ${srcdir}/opt/${_pkgname}
    
    install -Dm755 "${srcdir}/${_pkgname}".sh     ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.svg -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
    
    install -Dm755 lib/{libwemeet*,libxcast.so,libxnn*,libui*,libdesktop_common.so,libImSDK.so,libxcast_codec.so} \
        -t ${pkgdir}/usr/lib/${_pkgname}
        
    for lib in ${pkgdir}/usr/lib/${_pkgname}/*
    do
        patchelf --set-rpath '$ORIGIN' $lib
    done;
    
    mkdir -p ${pkgdir}/opt/${_pkgname}
    cp -rf  bin   ${pkgdir}/opt/${_pkgname}
    cp -rf  bin/raw/xcast.conf ${pkgdir}/opt/${_pkgname}/bin
    
    rm -rf ${pkgdir}/opt/${_pkgname}/bin/Qt*
}


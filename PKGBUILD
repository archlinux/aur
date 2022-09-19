# Maintainer: sukanka<su975853527[AT]gmail.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=wemeet-bin
_pkgname=wemeet
provides=('wemeet' 'tencent-meeting')
pkgver=3.10.0.401
_md5=249fc9a44733d846162296934bbf52fa
pkgrel=1
pkgdesc="Tencent Video Conferencing, tencent meeting 腾讯会议"
arch=('x86_64')
license=('unknown')
url="https://source.meeting.qq.com/download-center.html"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://updatecdn.meeting.qq.com/cos/${_md5}/TencentMeeting_0300000000_${pkgver}_x86_64_default.publish.deb"
"${_pkgname}".sh
)
optdepends=('bubblewrap: Fix abnormal text color in dark mode.')
makedepends=('patchelf')
sha512sums=('b754d130a81eb539c34e7fa0156c66e33fe97f9c643335516aad38c88766e0b38ffcb9c6696f90f3e2f1f1993bf90a3fc42a97c7e72221c333f9ed88d6b790db'
            'e67d6b8fdd9bd055ba8c2177aca884d803a2473fcfe9faf9b23e5bfd4152115814be066709db1e1dbf62917a36aa99693c5ebd8f23f2858950a3f3b98d6b8136')

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
    depends=('qt5-x11extras'    'libxrandr'  'libxinerama' 'qt5-webengine'
    # 'qt5-tools' 'qt5-location' 'qt5-svg' 'qt5-declarative' 'qt5-wayland' 'qt5-webview'
    ## they are shipped with wemeet, but reported by namcap, they are not needed.
    'pulseaudio')
    # 无 'pulseaudio' 无法连接到系统音频

    cd ${srcdir}
    cp -r usr ${pkgdir}
    cd ${srcdir}/opt/${_pkgname}

    install -Dm755 "${srcdir}/${_pkgname}".sh     ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.svg -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps/

    install -Dm755 lib/lib{ImSDK,desktop_common,nxui*,qt_*,ui*,wemeet*,xcast,xcast_codec,xnn*}.so \
        -t ${pkgdir}/usr/lib/${_pkgname}

    for lib in ${pkgdir}/usr/lib/${_pkgname}/*
    do
        patchelf --set-rpath '$ORIGIN' $lib
    done;

    mkdir -p ${pkgdir}/opt/${_pkgname}
    cp -rf  bin   ${pkgdir}/opt/${_pkgname}
    cp -rf  bin/raw/xcast.conf ${pkgdir}/opt/${_pkgname}/bin
    for dir in ${pkgdir}/opt/${_pkgname}/bin/modules/*
    do
        patchelf --set-rpath '$ORIGIN:/usr/lib/wemeet' $dir/*.so
    done;

    rm -rf ${pkgdir}/opt/${_pkgname}/bin/Qt*
}

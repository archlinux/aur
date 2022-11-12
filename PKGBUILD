# Maintainer: sukanka<su975853527[AT]gmail.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=wemeet-bin
_pkgname=wemeet
provides=('wemeet' 'tencent-meeting')
pkgver=3.11.0.402
_x86_md5=9b74d4127a16a011db8cb6300fa5fbc9
_arm_md5=ce5d25cc8e8aae8ddd19295bc3b00d5e
pkgrel=2
pkgdesc="Tencent Video Conferencing, tencent meeting 腾讯会议"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://source.meeting.qq.com/download-center.html"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://updatecdn.meeting.qq.com/cos/${_x86_md5}/TencentMeeting_0300000000_${pkgver}_x86_64_default.publish.deb"
)
source_aarch64=("${_pkgname}-${pkgver}-aarch64.deb::https://updatecdn.meeting.qq.com/cos/${_arm_md5}/TencentMeeting_0300000000_${pkgver}_arm64_default.publish.deb")
source=("${_pkgname}".sh)
optdepends=('bubblewrap: Fix abnormal text color in dark mode.')
makedepends=('patchelf')
sha512sums=('e67d6b8fdd9bd055ba8c2177aca884d803a2473fcfe9faf9b23e5bfd4152115814be066709db1e1dbf62917a36aa99693c5ebd8f23f2858950a3f3b98d6b8136')
sha512sums_x86_64=('6b4a5a5499fd8a92dbf86ae04990434b3a7ff2ade7d768dbe70dd3f60e347c599281e1aed211673a3a7986f5cb7a014abefec0c859e087c291286467bf8fbe73')
sha512sums_aarch64=('534657987d8030c0798731d72fade34c40a5863f4dcd289423eb0509115e290ad5507616c19d86e76c25ae5ea82272fe167ef45599f0ad1433531ff72f74ce78')

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

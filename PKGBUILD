# Maintainer: sukanka<su975853527[AT]gmail.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=wemeet-bin
_pkgname=wemeet
provides=('wemeet' 'tencent-meeting')
pkgver=3.12.0.400
_pkgver_arm=3.11.0.402 # 两个版本有时候不一样
_x86_md5=e078bf97365540d9f0ff063f93372a9c
_arm_md5=ce5d25cc8e8aae8ddd19295bc3b00d5e
pkgrel=2
pkgdesc="Tencent Video Conferencing, tencent meeting 腾讯会议"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://source.meeting.qq.com/download-center.html"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://updatecdn.meeting.qq.com/cos/${_x86_md5}/TencentMeeting_0300000000_${pkgver}_x86_64_default.publish.deb"
)
source_aarch64=("${_pkgname}-${_pkgver_arm}-aarch64.deb::https://updatecdn.meeting.qq.com/cos/${_arm_md5}/TencentMeeting_0300000000_${_pkgver_arm}_arm64_default.publish.deb")
source=("${_pkgname}".sh)
optdepends=('bubblewrap: Fix abnormal text color in dark mode.')
makedepends=('patchelf')
sha512sums=('a227a48bc86be9f8425507ae93cdb698effd1d008d58dacc38a96ff14c2301aec4296e46614850784e0de44a342ec471d3a11bd0e103d39395fff332918cb550')
sha512sums_x86_64=('af52afe5a95cfe9abcae91d927d5f165126edb9efa14315957803eaffb30a60a9121cc63b398f7162c8956bfbcf5a1793a2561cd19f245e3eaf07a5b55662831')
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

    if [ $(uname -m) = 'x86_64' ]; then
        # arm 落后一个版本，没有这个
        install -Dm755 lib/libservice*.so  -t ${pkgdir}/usr/lib/${_pkgname}
    fi

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

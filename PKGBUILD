# Maintainer: sukanka<su975853527[AT]gmail.com>
# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=wemeet-bin
_pkgname=wemeet
provides=('wemeet' 'tencent-meeting')
pkgver=3.12.0.400
_pkgver_arm=${pkgver} # 两个版本有时候不一样
_x86_md5=e078bf97365540d9f0ff063f93372a9c
_arm_md5=11814f6931a0a599f394d8845c223feb
pkgrel=5
pkgdesc="Tencent Video Conferencing, tencent meeting 腾讯会议"
arch=('x86_64' 'aarch64')
license=('unknown')
url="https://source.meeting.qq.com/download-center.html"
source_x86_64=("${_pkgname}-${pkgver}-x86_64.deb::https://updatecdn.meeting.qq.com/cos/${_x86_md5}/TencentMeeting_0300000000_${pkgver}_x86_64_default.publish.deb"
)
source_aarch64=("${_pkgname}-${_pkgver_arm}-aarch64.deb::https://updatecdn.meeting.qq.com/cos/${_arm_md5}/TencentMeeting_0300000000_${_pkgver_arm}_arm64_default.publish.deb")
source=("${_pkgname}".sh 'wrap.c')
optdepends=('bubblewrap: Fix abnormal text color in dark mode.')
makedepends=('patchelf')
sha512sums=('7463ca8d5f0dfa2832a99bee0a32bce0a94c79af9c0a98043cd6f866f5ad95b0957e7aa6f723a0f4a9c1a96d4fd5b50ab340653fe5097cdb0e65eff2681fe76e'
            '9f430ddc278a1393fc883bba27d991a012a3822bc7c19c8e3c71683cd334885e04818f2110061a5d9db9f2fec9065161afbb35274fe046cc470991002549e25d')
sha512sums_x86_64=('af52afe5a95cfe9abcae91d927d5f165126edb9efa14315957803eaffb30a60a9121cc63b398f7162c8956bfbcf5a1793a2561cd19f245e3eaf07a5b55662831')
sha512sums_aarch64=('02ddf2908597b2db490d599ca7c6dcc2fe77e1f7eec2aa914581c07c462c9517a3c73406111e4706c2474c85c037cb1e04642f9769492f9a3383ca11502ba1b8')

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

build(){
    cd ${srcdir}
    "${CC:-cc}" $CFLAGS -fPIC -shared -o libwemeetwrap.so wrap.c
}
package() {
    depends=('qt5-base' 'qt5-x11extras' 'libxinerama'
    'hicolor-icon-theme' 'pulseaudio') # 无 'pulseaudio' 无法连接到系统音频

    ## 下面的库官方包有，但是 namcap 认为不需要，也没发现有什么影响
    # 'libbsd' 'flac' 'libidn11' 'libvorbis' 'libwrap'
    # 'qt5-lottie' 'qt5-tools'  'qt5-networkauth' 'qt5-quickcontrols2'
    # 'qt5-remoteobjects' 'qt5-script' 'qt5-scxml' 'qt5-svg'
    # 'qt5-speech' 'qt5-wayland' 'qt5-websockets' 'qt5-webview' 'qt5-xmlpatterns'

    cd ${srcdir}
    cp -r usr ${pkgdir}
    cd ${srcdir}/opt/${_pkgname}

    install -Dm755 "${srcdir}/${_pkgname}".sh     ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.svg -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps/

    install -Dm755 lib/lib{bugly,crbase,desktop_common,ImSDK,nxui*,qt_*,service*,tms_*,ui*,wemeet*,xcast*,xnn*}.so \
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
    install -Dm755 ${srcdir}/libwemeetwrap.so -t ${pkgdir}/usr/lib/${_pkgname}

    rm -rf ${pkgdir}/opt/${_pkgname}/bin/Qt*
}

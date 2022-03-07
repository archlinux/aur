#maintainer: sukanka<su975853527[AT]gmail.com>
pkgname=wemeet-bin
_pkgname=wemeet
provides=('wemeet' 'tencent-meeting')
pkgver=2.8.0.3
pkgrel=1
pkgdesc="Tencent Video Conferencing, tencent meeting 腾讯会议"
arch=('x86_64')
license=('unknown')
url="https://source.meeting.qq.com/download-center.html"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://updatecdn.meeting.qq.com/cos/3cdd365cd90f221fb345ab73c4746e1f/TencentMeeting_0300000000_${pkgver}_${arch}_default.publish.deb"
"${_pkgname}".sh
)
depends=('qt5-x11extras' 'hicolor-icon-theme' 'libbsd'  'libxrandr' 'qt5-webkit' 'libxinerama' 'libpulse')
optdepends=('bubblewrap: Fix abnormal text color in dark mode.')
sha512sums=('5cd8bf0eddd56a4eb0983bf530b341d5078b852a9dd51b1d941659331fe13d2dd5738ca1c8799fe9d765e334175c29aad991c58dd2df9aef3ab192b88cbd0a47'
            'e3470c08229b367d6caf5348830b0e7c7fb8561cf36e73eec42eb0a185772c2985b8e66ccfda64456b4ff1badf5173a3851bb789124e18f8c6aa3bb651ee4db0')


package() {
    tar xpf data.tar.xz -C ${pkgdir}
    cd ${pkgdir}/usr/share/applications
    sed -i '4c Exec=wemeet %u ' ${_pkgname}app.desktop 
    sed -i '5c Icon=wemeet' ${_pkgname}app.desktop 
    sed -i '$i Comment=Tencent Meeting Linux Client\nComment[zh_CN]=腾讯会议Linux客户端\nKeywords=wemeet;tencent;meeting;' "${pkgdir}/usr/share/applications/wemeetapp.desktop"
    
    cd ${pkgdir}/opt/${_pkgname}
    
    for res in {16,32,64,128,256}
    do
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps;
        mv icons/hicolor/${res}x${res}/mimetypes/${_pkgname}app.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}app.png;
    done
    
    sed -i '4c Prefix = /usr/lib/qt' bin/qt.conf
    
    install -Dm755 "${srcdir}/${_pkgname}".sh     ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 ${_pkgname}.svg -t ${pkgdir}/usr/share/icons/hicolor/scalable/apps/
    
    mkdir -p ${pkgdir}/usr/lib/${_pkgname}
    mv lib/{libwemeet*,libxcast.so,libxnn*,libtquic.so} ${pkgdir}/usr/lib/${_pkgname}
    cp bin/raw/xcast.conf ${pkgdir}/opt/${_pkgname}/bin/
    
    rm -rf plugins icons lib/libQt* lib wemeetapp.sh "${_pkgname}".svg
    
    
}


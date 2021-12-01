#maintainer: sukanka<su975853527[AT]gmail.com>
pkgname=wemeet-bin
_pkgname=wemeet
provides=('wemeet' 'tencent-meeting')
pkgver=2.8.0.1
pkgrel=3
pkgdesc="Tencent Video Conferencing, tencent meeting 腾讯会议"
arch=('x86_64')
license=('unknown')
url="https://source.meeting.qq.com/download-center.html"
source=("${_pkgname}-${pkgver}-${arch}.deb::https://updatecdn.meeting.qq.com/cos/196cdf1a3336d5dca56142398818545f/TencentMeeting_0300000000_${pkgver}_${arch}.publish.deb"
"${_pkgname}".sh
)
depends=('qt5-x11extras' 'hicolor-icon-theme' 'libbsd'  'libxrandr' 'qt5-webkit' 'libxinerama' 'libpulse')
optdepends=('bubblewrap: Fix abnormal text color in dark mode.')
sha512sums=('37d3aec3de68fc79da744690d65f5ceef6d67d9bfba40f52b14429847ec72d9136e34fe87fbdd7d9dd14e91f543bf9b5fdbd4f50cfe25a3677b557daa4ed38ce'
            'e0ff38f1317922af37d916d42f77faea40385839a52455a8871e7e4d5b644b6fa92bf1d086e5e24a6d2b3f8985a30d339aa3dc046b5f13415985aa6dfbda238e')


package() {
    tar xpf data.tar.xz -C ${pkgdir}
    cd ${pkgdir}/usr/share/applications
    sed -i '3c Exec=wemeet %u ' ${_pkgname}app.desktop 
    sed -i 'N;2aName[zh_CN]=腾讯会议\nComment=Tencent Meeting Linux Client\nComment[zh_CN]=腾讯会议Linux客户端\nKeywords=wemeet;tencent;meeting;' "${pkgdir}/usr/share/applications/wemeetapp.desktop"
    
    cd ${pkgdir}/opt/${_pkgname}
    
    for res in {16,32,64,128,256}
    do
        mkdir -p ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps;
        mv icons/hicolor/${res}x${res}/mimetypes/${_pkgname}app.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${_pkgname}app.png;
    done
    
    sed -i '4c Prefix = /usr/lib/qt' bin/qt.conf
    
    install -Dm755 "${srcdir}/${_pkgname}".sh     ${pkgdir}/usr/bin/${_pkgname}
    
    mkdir -p ${pkgdir}/usr/lib/${_pkgname}
    mv lib/{libwemeet*,libxcast.so,libxnn*,libtquic.so} ${pkgdir}/usr/lib/${_pkgname}
    cp bin/raw/xcast.conf ${pkgdir}/opt/${_pkgname}/bin/
    
    rm -rf plugins icons lib/libQt* lib wemeetapp.sh
    
    
}


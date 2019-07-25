#Maintainer: Gharim Turen <gharim@turen.de>
pkgname=evesetup
pkgver=1539902
pkgrel=1
pkgdesc="An inofficial EVE Online Launcher Setup Tool."
arch=(x86_64)
url="https://forums.eveonline.com/t/eve-installing/71494"
license=('custom')

depends=('icu'
         'openssl'
         'openssl-1.0'
         'qt5-base'
         'qt5-declarative'
         'qt5-translations'
         'qt5-location'
         'qt5-webchannel'
         'qt5-webengine'
         'qt5-websockets'
         'wine'
         'winetricks')

optdepends=('libnotify')

conflicts=('evelauncher' 'evesetup_dev')

source=("evelauncher.desktop"
        "evelauncher.sh"
        "evelauncher.sh.in"
        "evelauncher.sh.real"
        "evesetup.shlib"
        "everegedit.desktop"
        "evewine"
        "evewinecfg.desktop"
        "evewinetricks.desktop"
        "evewinetricks"
        "evebackup.desktop"
        "evebackup"
        "qt.conf"
        "build_installer.sh"
        "setup.sh.in"
        "eve-icons.tar.gz"
        "eve-icons_large.tar.gz"
        "eve-transl5.11-de.tar.gz"
        "eve-transl5.11-en.tar.gz"
        "eve-transl5.11-fr.tar.gz"
        "eve-transl5.11-ja.tar.gz"
        "eve-transl5.11-ru.tar.gz"
        "eve-transl5.11-zh.tar.gz"
        "https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run"
        "https://binaries.eveonline.com/evelauncher-${pkgver}.tar.gz")

noextract=('eve-transl5.11-de.tar.gz'
           'eve-transl5.11-en.tar.gz'
           'eve-transl5.11-fr.tar.gz'
           'eve-transl5.11-ja.tar.gz'
           'eve-transl5.11-ru.tar.gz'
           'eve-transl5.11-zh.tar.gz'
           'https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run')

package() {
        install -d "${pkgdir}/opt/${pkgname}/bin"
        install -d "${pkgdir}/opt/${pkgname}/lib"
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/usr/share/applications"
        install -d "${pkgdir}/usr/share/icons"
        for cmd in evelauncher.sh everegedit evewine evewinecfg evewinetricks evebackup ;do
            if [ -f "${srcdir}/$cmd" ] ;then
                sed -i s,./evesetup.shlib,/opt/${pkgname}/lib/evesetup.shlib, "${srcdir}/$cmd"
                install "${srcdir}/$cmd" "${pkgdir}/opt/${pkgname}/bin"
            else
                ln -s evewine "${pkgdir}/opt/${pkgname}/bin/$cmd"
            fi
            ln -s "/opt/${pkgname}/bin/$cmd" "${pkgdir}/usr/bin/$cmd"
            if [ ! "$cmd" = "evewine" ] ;then
                oexec=$(grep Exec= ./${cmd%.*}.desktop)
                sed -i s,$oexec,Exec=/usr/bin/$cmd, ./${cmd%.*}.desktop
                cp "${srcdir}/${cmd%.*}.desktop" "${pkgdir}/usr/share/applications/"
            fi
        done
        sed -i s,ELVER=\"\",ELVER=\"${pkgver}\", "${pkgdir}/opt/${pkgname}/bin/evelauncher.sh"
        cp ${srcdir}/evesetup.shlib ${pkgdir}/opt/${pkgname}/lib
        cp -r ${srcdir}/icons ${pkgdir}/usr/share/
        rm -rf ${srcdir}/evelauncher/resources/ ${srcdir}/evelauncher/plugins/
        rm -f ${srcdir}/evelauncher/*Qt* ${srcdir}/evelauncher/libcrypto*
        rm -f ${srcdir}/evelauncher/libssl* ${srcdir}/evelauncher/libicu*
        rm -f ${srcdir}/evelauncher/libxcb*
        cp -f ${srcdir}/evelauncher.sh.real ${srcdir}/evelauncher/evelauncher.sh
        chmod 0755 ${srcdir}/evelauncher/*
        chmod 0644 ${srcdir}/evelauncher/*.qm ${srcdir}/evelauncher/errorpage/*
        cp -pf ${srcdir}/qt.conf ${srcdir}/evelauncher
        ln -sf evelauncher.sh ${srcdir}/evelauncher/LogLite.sh
        ln -sf libgpr.so.6.0.0 ${srcdir}/evelauncher/libgpr.so
        ln -sf libgpr.so.6.0.0 ${srcdir}/evelauncher/libgpr.so.6
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so.1
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so.6
        ln -sf libgrpc.so.6.0.0 ${srcdir}/evelauncher/libgrpc.so
        ln -sf libgrpc.so.6.0.0 ${srcdir}/evelauncher/libgrpc.so.6
        ln -sf libprotobuf.so.16.0.0 ${srcdir}/evelauncher/libprotobuf.so
        ln -sf libprotobuf.so.16.0.0 ${srcdir}/evelauncher/libprotobuf.so.16
        ln -sf libpng12.so.0.54.0 ${srcdir}/evelauncher/libpng12.so.0
        find ${srcdir}/evelauncher/ -type f -exec strip -s {} 2>/dev/null \;
        tar cJf ${pkgdir}/opt/${pkgname}/lib/evelauncher-${pkgver}.tar.xz evelauncher/
}

sha256sums=('ce85defa2698ea72e88221d72424fb953f86836494ecc0e4006f41ec89682af4'
            'b5febef1a55d27af357f88079c0c7a1799971bd570080d91034115230323ef68'
            'adb88d519b09f8593d4d1c30472d7d3d6e177bf303dbbc5d8c3360ddd57f4af2'
            '80fceef0e28c2291cd4ba3924410211edd188717be093ffc329d18697583bd21'
            'fb2b6aa2d47365cc88e7ecac6f01def985b008683bb0f9efd7873799e929c7d2'
            'a8e604e6481b9a386269b6252852ee57812fc932f44f767982c4dbac168bb03b'
            'cd840d3ad3a21517f30bb4979c97adaaccba2affdddaa5da2889f4fd2ba89578'
            '546aaf5669dc3d3f1b2fff1b9a493d8ba31c19940a04fa4b9eb080e7301df4bd'
            'c83beba543663b926d28d0eda98f1035cd73327da50f718a487763d300415a24'
            'f438c7002eaf8e1186a838ac2e803242b7a2c98a22cf49622eb4a64cf4b202ec'
            '04c102d6db1bb8d4159c41f32ec0aa95846c0fb519841a3c1428ab20c850e9cf'
            'cc9b7bd4778305b542bd67d043f408c0e30fe7ef82601e7ff2d8d216a71ee904'
            '2520a9b19f2827fa2634ea2acae3a6f61e73aada1af0eb2029e95709f0c8927d'
            'a62632f591d464565bf5d52ff70a60e3d1a36e6b4f89735228a65f0449a72fc3'
            '5b4d6ca26b58ce6e56099921ab7d2dbacfa7ecd49fbb8e47f8dcd05c99768ad5'
            '69b98d923c08c6fb035c0c6905ec5e9c73273b694f8f3497777d44597dbe63e3'
            '762db1df07dfcf526fe634b4b589a08e8affefb2f79f02cff2624c70e0820422'
            '47accd49b64d624c6a6dee42952f8627aaabdd315fad85ef037507745d393f1a'
            '1c3df28324c8498e34d2e789fd1f36577afa5a31bdbb278d752f7ef8c6ec5516'
            'bb63c2ea31d204f4d8eb270848674ad898ed45bbf0a9cea480611581f1149e4f'
            'f78996a8b01463891e97270b8f9d9fa5a61ccf0710e1163aff0c0c49ce3849c3'
            '7ae1c6324c4ad43ab3f18f5a3ceaa48b34ede5466b7a0b9351d018e8cef9bbd0'
            '1936061a14432ab2632ea3ff15d45350b59ac822985445f597a4a5db44a35ae6'
            'ca66a6113ce98152b85c8d847949f8c90ab9ba798e106bfc225d4ed3c2e2e3e2'
            '70d45773ca4b3eaf6174cbd0757fbfc2b0ce4ba74713355ec5a5eda18a9af746')

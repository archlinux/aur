#Maintainer: Gharim Turen <gharim@turen.de>
pkgname=evesetup
pkgver=1548102
pkgrel=12
pkgdesc="An inofficial EVE Online Launcher Setup Tool."
arch=(x86_64)
url="https://forums.eveonline.com/t/eve-installing/71494"
license=('custom')

depends=('p7zip' 'vulkan-icd-loader' 'wine')

optdepends=('libnotify' 'winetricks')

conflicts=('evelauncher' 'evesetup_dev' 'evesetup-beta')

source=("evelauncher.desktop"
        "evelauncher.sh"
        "evelauncher.sh.real"
        "evesetup.shlib"
        "everegedit.desktop"
        "evewine"
        "evewinecfg.desktop"
        "evewinetricks.desktop"
        "evewinetricks"
        "evebackup.desktop"
        "evebackup"
        "everestore.desktop"
        "evelauncher.kwinrule"
        "evelauncher.lua"
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
        "https://github.com/doitsujin/dxvk/releases/download/v1.7/dxvk-1.7.tar.gz"
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
        install -d "${pkgdir}/opt/${pkgname}/doc"
        install -d "${pkgdir}/opt/${pkgname}/lib"
        install -d "${pkgdir}/opt/${pkgname}/lib/dxvk"
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/usr/share/applications"
        install -d "${pkgdir}/usr/share/icons"
        sed -i s,ELVER=\"\",ELVER=\"${pkgver}\", "${srcdir}/evelauncher.sh"
        sed -i s,SETUPDIR=\"\",SETUPDIR=\"/opt/${pkgname}\", "${srcdir}/evelauncher.sh"
        sed -i s,./eve-transl,/opt/${pkgname}/lib/eve-transl, "${srcdir}/evelauncher.sh"
        for cmd in backup launcher.sh regedit restore wine winecfg winetricks ;do
            cmd=eve$cmd
            if [ -f "${srcdir}/$cmd" ] ;then
                sed -i s,./evesetup.shlib,/opt/${pkgname}/lib/evesetup.shlib, "${srcdir}/$cmd"
                install "${srcdir}/$cmd" "${pkgdir}/opt/${pkgname}/bin"
            else
                if [ "$cmd" = "everestore" ] ;then
                    ln -s evebackup "${pkgdir}/opt/${pkgname}/bin/$cmd"
                else
                    ln -s evewine "${pkgdir}/opt/${pkgname}/bin/$cmd"
                fi
            fi
            ln -s "/opt/${pkgname}/bin/$cmd" "${pkgdir}/usr/bin/$cmd"
            if [ ! "$cmd" = "evewine" ] ;then
                oexec=$(grep Exec= ./${cmd%.*}.desktop)
                sed -i s,$oexec,Exec=/usr/bin/$cmd, ./${cmd%.*}.desktop
                cp "${srcdir}/${cmd%.*}.desktop" "${pkgdir}/usr/share/applications/"
            fi
        done
        cp ${srcdir}/evesetup.shlib ${pkgdir}/opt/${pkgname}/lib
        cp ${srcdir}/eve-transl5.11* ${pkgdir}/opt/${pkgname}/lib
        cp ${srcdir}/evelauncher.lua ${pkgdir}/opt/${pkgname}/doc
        cp ${srcdir}/evelauncher.kwinrule ${pkgdir}/opt/${pkgname}/doc
        cp -r ${srcdir}/dxvk-1.7/x32 ${pkgdir}/opt/${pkgname}/lib/dxvk/
        cp -r ${srcdir}/dxvk-1.7/x64 ${pkgdir}/opt/${pkgname}/lib/dxvk/
        cp -r ${srcdir}/icons ${pkgdir}/usr/share/
        cp -f ${srcdir}/evelauncher.sh.real ${srcdir}/evelauncher/evelauncher.sh
        rm -f ${srcdir}/evelauncher/*.a ${srcdir}/evelauncher/*.la
        rm -f ${srcdir}/evelauncher/*.prl ${srcdir}/evelauncher/libxcb*
        chmod 0755 ${srcdir}/evelauncher/*
        chmod 0644 ${srcdir}/evelauncher/*.qm
        chmod 0644 ${srcdir}/evelauncher/qt.conf
        chmod 0644 ${srcdir}/evelauncher/errorpage/*
        ln -sf evelauncher.sh ${srcdir}/evelauncher/LogLite.sh
        ln -sf libicudata.so.55.1 ${srcdir}/evelauncher/libicudata.so
        ln -sf libicudata.so.55.1 ${srcdir}/evelauncher/libicudata.so.55
        ln -sf libicui18n.so.55.1 ${srcdir}/evelauncher/libicui18n.so
        ln -sf libicui18n.so.55.1 ${srcdir}/evelauncher/libicui18n.so.55
        ln -sf libicuuc.so.55.1 ${srcdir}/evelauncher/libicuuc.so
        ln -sf libicuuc.so.55.1 ${srcdir}/evelauncher/libicuuc.so.55
        ln -sf libgpr.so.6.0.0 ${srcdir}/evelauncher/libgpr.so
        ln -sf libgpr.so.6.0.0 ${srcdir}/evelauncher/libgpr.so.6
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so.1
        ln -sf libgrpc++.so.1.12.0 ${srcdir}/evelauncher/libgrpc++.so.6
        ln -sf libgrpc.so.6.0.0 ${srcdir}/evelauncher/libgrpc.so
        ln -sf libgrpc.so.6.0.0 ${srcdir}/evelauncher/libgrpc.so.6
        ln -sf libpng12.so.0.54.0 ${srcdir}/evelauncher/libpng12.so.0
        ln -sf libprotobuf.so.16.0.0 ${srcdir}/evelauncher/libprotobuf.so
        ln -sf libprotobuf.so.16.0.0 ${srcdir}/evelauncher/libprotobuf.so.16
        find ${srcdir}/evelauncher/ -type f -exec strip -s {} 2>/dev/null \;
        tar czf ${pkgdir}/opt/${pkgname}/lib/evelauncher-${pkgver}.tar.gz evelauncher/
}

sha256sums=('ce85defa2698ea72e88221d72424fb953f86836494ecc0e4006f41ec89682af4'
            'b1faa042a96746fe80ea5d85a0c26e80b29353394897774f45b9e48e0639a1d8'
            '80fceef0e28c2291cd4ba3924410211edd188717be093ffc329d18697583bd21'
            '1745e38174a91714ff3061608002a986f216360d8b04b86cdcae7c5457b740c2'
            'a8e604e6481b9a386269b6252852ee57812fc932f44f767982c4dbac168bb03b'
            '9079fd9ed7967479b7a78643d43537c04f9275303cd713651d2481bf4c658653'
            '546aaf5669dc3d3f1b2fff1b9a493d8ba31c19940a04fa4b9eb080e7301df4bd'
            'c83beba543663b926d28d0eda98f1035cd73327da50f718a487763d300415a24'
            '56929a0129540140ed7c85c04b83a163b4977bcc9d5555f760af871fc5ccbd17'
            '30b6440b842c19df64892cc560c274a7cc4f5de910a9f81e12dd0d76da561474'
            '3c4aedb6e3ea37cf041abb2ac15decb25d5a1852c1eac344943645fd954466cf'
            '261da84107168979d241c60cd7adbfee0f6675464675faaefd5f6140009d54d8'
            '528fc6627e8893db5d7092194e9f3320067f2f1f4593a206aee8a5207956e563'
            'd4610df883778f91e0ea5feba84720dfe814af0b9960677e3861809d70de24b2'
            '0a39c2fce60e2464440cdcaf8288d98d6c79eb6f489da6598a1f709837f98cd1'
            'f4a9e044d349e0363d5eeb1d308736c287bb1a0335476fab6f46d50a0a688429'
            '69b98d923c08c6fb035c0c6905ec5e9c73273b694f8f3497777d44597dbe63e3'
            '762db1df07dfcf526fe634b4b589a08e8affefb2f79f02cff2624c70e0820422'
            '47accd49b64d624c6a6dee42952f8627aaabdd315fad85ef037507745d393f1a'
            '1c3df28324c8498e34d2e789fd1f36577afa5a31bdbb278d752f7ef8c6ec5516'
            'bb63c2ea31d204f4d8eb270848674ad898ed45bbf0a9cea480611581f1149e4f'
            'f78996a8b01463891e97270b8f9d9fa5a61ccf0710e1163aff0c0c49ce3849c3'
            '7ae1c6324c4ad43ab3f18f5a3ceaa48b34ede5466b7a0b9351d018e8cef9bbd0'
            '1936061a14432ab2632ea3ff15d45350b59ac822985445f597a4a5db44a35ae6'
            'ca66a6113ce98152b85c8d847949f8c90ab9ba798e106bfc225d4ed3c2e2e3e2'
            '67d78239906c24bd50a5ecbc2fd792c1721e274a7a60dd22f74b21b08ca4c7a1'
            '6d49defd626b0643dce83fcd258f3bf3ece8f8e6cefbea37b3b61c8ae0752d85')

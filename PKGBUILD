#Maintainer: Gharim Turen <gharim@turen.de>
pkgname=evesetup
pkgver=1548102
pkgrel=7
pkgdesc="An inofficial EVE Online Launcher Setup Tool."
arch=(x86_64)
url="https://forums.eveonline.com/t/eve-installing/71494"
license=('custom')

depends=('icu'
         'openssl'
         'openssl-1.0'
         'p7zip'
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
        "everestore.desktop"
        "build_installer.sh"
        "build_small_installer.sh"
        "setup.sh.in"
        "setup_small.sh.in"
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
        sed -i s,ELVER=\"\",ELVER=\"${pkgver}\", "${srcdir}/evelauncher.sh"
        sed -i s,SETUPDIR=\"\",SETUPDIR=\"/opt/${pkgname}\", "${srcdir}/evelauncher.sh"
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
        cp -r ${srcdir}/icons ${pkgdir}/usr/share/
        rm -rf ${srcdir}/evelauncher/resources/ ${srcdir}/evelauncher/plugins/
        rm -f ${srcdir}/evelauncher/*[Qq]t* ${srcdir}/evelauncher/libcrypto*
        rm -f ${srcdir}/evelauncher/libicu* ${srcdir}/evelauncher/libssl*
        rm -f ${srcdir}/evelauncher/libpng* ${srcdir}/evelauncher/libxcb*
        cp -f ${srcdir}/evelauncher.sh.real ${srcdir}/evelauncher/evelauncher.sh
        chmod 0755 ${srcdir}/evelauncher/*
        chmod 0644 ${srcdir}/evelauncher/*.qm ${srcdir}/evelauncher/errorpage/*
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
        find ${srcdir}/evelauncher/ -type f -exec strip -s {} 2>/dev/null \;
        tar cJf ${pkgdir}/opt/${pkgname}/lib/evelauncher-${pkgver}.tar.xz evelauncher/
}

sha256sums=('ce85defa2698ea72e88221d72424fb953f86836494ecc0e4006f41ec89682af4'
            'e9c2145865e425a13fa38f433f2aec0574c44950442dffb900ae41085bfe7566'
            'b1faa042a96746fe80ea5d85a0c26e80b29353394897774f45b9e48e0639a1d8'
            '80fceef0e28c2291cd4ba3924410211edd188717be093ffc329d18697583bd21'
            'd60152349595e64fa625844fc783f84734845d630c8d29819b0b357d978cbc85'
            'a8e604e6481b9a386269b6252852ee57812fc932f44f767982c4dbac168bb03b'
            '9079fd9ed7967479b7a78643d43537c04f9275303cd713651d2481bf4c658653'
            '546aaf5669dc3d3f1b2fff1b9a493d8ba31c19940a04fa4b9eb080e7301df4bd'
            'c83beba543663b926d28d0eda98f1035cd73327da50f718a487763d300415a24'
            'f438c7002eaf8e1186a838ac2e803242b7a2c98a22cf49622eb4a64cf4b202ec'
            '30b6440b842c19df64892cc560c274a7cc4f5de910a9f81e12dd0d76da561474'
            '68133ae911d8b91374c09a7ce9f7617a260e43a669af00ed9299e1b8e7b2c9ec'
            '261da84107168979d241c60cd7adbfee0f6675464675faaefd5f6140009d54d8'
            'a8a3b84cbb6c7e79014b365d1c94b6c2095c7adaf83bc434c36bc3db088c50ca'
            'f142bf1734f2516cee99656d14af529bdf4161cc798ed3f27b7f1a4a6ec0eb36'
            '453f194a07a84ddf55f7514f4fceebbc1fc03894815c7ca257c3d205ba681426'
            'd8abd97506271bd8a68c8756e353ed1e02dcb9a998164531fabc97d53e1d2ae6'
            '69b98d923c08c6fb035c0c6905ec5e9c73273b694f8f3497777d44597dbe63e3'
            '762db1df07dfcf526fe634b4b589a08e8affefb2f79f02cff2624c70e0820422'
            '47accd49b64d624c6a6dee42952f8627aaabdd315fad85ef037507745d393f1a'
            '1c3df28324c8498e34d2e789fd1f36577afa5a31bdbb278d752f7ef8c6ec5516'
            'bb63c2ea31d204f4d8eb270848674ad898ed45bbf0a9cea480611581f1149e4f'
            'f78996a8b01463891e97270b8f9d9fa5a61ccf0710e1163aff0c0c49ce3849c3'
            '7ae1c6324c4ad43ab3f18f5a3ceaa48b34ede5466b7a0b9351d018e8cef9bbd0'
            '1936061a14432ab2632ea3ff15d45350b59ac822985445f597a4a5db44a35ae6'
            'ca66a6113ce98152b85c8d847949f8c90ab9ba798e106bfc225d4ed3c2e2e3e2'
            '6d49defd626b0643dce83fcd258f3bf3ece8f8e6cefbea37b3b61c8ae0752d85')

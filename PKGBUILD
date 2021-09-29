#Maintainer: Jernuh Zakalwe <jzakalwe1st@gmail.com>
pkgname=evesetup
pkgver=1747682
pkgrel=13
pkgdesc="An inofficial EVE Online Launcher Setup Tool."
changelog=$pkgname.changelog
arch=(x86_64)
url="https://forums.eveonline.com/t/299030"
license=('zlib')

depends=('lsof'
         'openssl'
         'openssl-1.0'
         'p7zip'
         'qt5-translations'
         'qt5-webengine'
         'qt5-websockets'
         'vulkan-icd-loader')

optdepends=('libnotify' 'wine' 'winetricks')

conflicts=('evelauncher' 'evesetup_dev' 'evesetup-beta')

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
        "evelauncher.kwinrule"
        "evelauncher.lua"
        "build_installer.sh"
        "build_lite_installer.sh"
        "setup.sh.in"
        "setup_lite.sh.in"
        "eve-icons.tar.gz"
        "eve-icons_large.tar.gz"
        "eve-transl5.12-de.tar.gz"
        "eve-transl5.12-en.tar.gz"
        "eve-transl5.12-fr.tar.gz"
        "eve-transl5.12-ko.tar.gz"
        "eve-transl5.12-ru.tar.gz"
        "eve-transl5.12-zh.tar.gz"
        "https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run"
        "https://github.com/doitsujin/dxvk/releases/download/v1.9.2/dxvk-1.9.2.tar.gz"
        "https://binaries.eveonline.com/evelauncher-${pkgver}.tar.gz")

noextract=('eve-transl5.12-de.tar.gz'
           'eve-transl5.12-en.tar.gz'
           'eve-transl5.12-fr.tar.gz'
           'eve-transl5.12-ko.tar.gz'
           'eve-transl5.12-ru.tar.gz'
           'eve-transl5.12-zh.tar.gz')

package() {
        install -d "${pkgdir}/opt/${pkgname}/bin"
        install -d "${pkgdir}/opt/${pkgname}/doc"
        install -d "${pkgdir}/opt/${pkgname}/lib"
        install -d "${pkgdir}/opt/${pkgname}/lib/dxvk"
        install -d "${pkgdir}/usr/bin"
        install -d "${pkgdir}/usr/share/applications"
        install -d "${pkgdir}/usr/share/icons"
        sed -i s,ELVER=\"\",ELVER=\"${pkgver}\", "${srcdir}/evelauncher.sh"
        sed -i 2\ s,[0-9].*\",${pkgver}\", "${srcdir}/evelauncher.lua"
        for cmd in backup launcher.sh regedit restore wine winecfg winetricks ;do
            cmd=eve$cmd
            if [ -f "${srcdir}/$cmd" ] ;then
                sed -i s,SETUPDIR=\"\",SETUPDIR=\"/opt/${pkgname}\", "${srcdir}/$cmd"
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
        cp ${srcdir}/evelauncher.lua ${pkgdir}/opt/${pkgname}/doc
        cp ${srcdir}/evelauncher.kwinrule ${pkgdir}/opt/${pkgname}/doc
        cp -r ${srcdir}/dxvk-1.9.2/x32 ${pkgdir}/opt/${pkgname}/lib/dxvk/
        cp -r ${srcdir}/dxvk-1.9.2/x64 ${pkgdir}/opt/${pkgname}/lib/dxvk/
        echo "1.9.2" >${pkgdir}/opt/${pkgname}/lib/dxvk/version
        cp -r ${srcdir}/icons ${pkgdir}/usr/share/
        rm -rf ${srcdir}/evelauncher/resources/ ${srcdir}/evelauncher/plugins/
        rm -f ${srcdir}/evelauncher/*[Qq]t* ${srcdir}/evelauncher/libicu*
        rm -f ${srcdir}/evelauncher/libcrypto* ${srcdir}/evelauncher/libssl*
        rm -f ${srcdir}/evelauncher/libpng* ${srcdir}/evelauncher/libxcb*
        rm -f ${srcdir}/evelauncher/roots.pem
        cp -f ${srcdir}/evelauncher.sh.real ${srcdir}/evelauncher/evelauncher.sh
        chmod 0755 ${srcdir}/evelauncher/*
        chmod 0644 ${srcdir}/evelauncher/*.qm
        chmod 0644 ${srcdir}/evelauncher/errorpage/*
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
        tar czf ${pkgdir}/opt/${pkgname}/lib/evelauncher-${pkgver}.tar.gz evelauncher/
}

sha256sums=('3faf7c07b571a80f05b46b44b832e1986bf45d2a84c2cba0fceda4d38a5a9259'
            '29b6f2cda542c8f3f3845fb3e1ff3e9ac2a645d389c1618bdac5fa69947a2b4b'
            '77b8a8d1cde800956dadf8abf35287c34b3c844c40dfa8f89ed01ca2cde345fb'
            '008ea3e1c1b8faaf61f0ddf9a53599058c7a97ebe6e719803d002f0eb6042602'
            '03e5eb09f931935cab02b3f30cfc9f9356f92558b3c1d691cbf60e1360a571c7'
            'ac6ead162ec27c3ab9481f1a7907dc906b1a1be121820a6aed2ad1d8312a72d6'
            '94679e947e7ecaa5f2b1da96b53d92e74aa45c19aab1f6d2fc7d28d3fea3ac1d'
            'c86790a014cb765577d269e98595c1e41f988fbb805a521e7a0083cf4b16b8ad'
            'e485a1ab084a7c59bd97064e5d616f621e2e40a0e95008ce0891cc06e06792f4'
            '68a0f72b795a062b118745ae29f377863111e893f6536cd1a6cc7e633f3a1b29'
            '30b6440b842c19df64892cc560c274a7cc4f5de910a9f81e12dd0d76da561474'
            'ebdeaa2a143b8d247d94b4a57a45065c299253c074f5d741870a78dd384c29f0'
            '261da84107168979d241c60cd7adbfee0f6675464675faaefd5f6140009d54d8'
            'd5822f8c1234c3b9a4c83994ae84d4d234ca7083a7a7e193ef749117155d68f7'
            'd4610df883778f91e0ea5feba84720dfe814af0b9960677e3861809d70de24b2'
            '675da37e1a26862914fb7900c974892ecdd8946c53ff96d322c204f5e410d14a'
            '0029ffaccda6e48d1b601ef7fc5f7cb7ce01b4064885caf314e97cfcadad2973'
            '7e68725e9bf9a659c2bff962e0964411192fc58dad35419105c6bb9ceebea704'
            '01a5193925c7dd18bd7c8c66375ca6c5039dee1ac5721141958b7fe9d8d6dbec'
            '69b98d923c08c6fb035c0c6905ec5e9c73273b694f8f3497777d44597dbe63e3'
            '762db1df07dfcf526fe634b4b589a08e8affefb2f79f02cff2624c70e0820422'
            '980d68abd6f4a662b69efd19145112e88f349044fa1ed5cb6d0a840a92cb42e4'
            '777ad02015e07a6f7698b2c373997f5152954592acee85e3b189a4a7270326b1'
            'ab005b213aec42b21d2e5ef2dcbff4b0a97ee7f7a1df5dc6401afa95271000d1'
            '03950f576befa34d95fe2839a752f15584a4001c3b02416bf22e9991f03b856b'
            '1a83a791b5a189823f71cdfb1e0c0e15139ff7f563bfb3eac70a5fa4ad9ebc22'
            '5ffd6578dfbb9bf1647fbae819e3ddae0722c2613779c122d86963123470359f'
            'ca66a6113ce98152b85c8d847949f8c90ab9ba798e106bfc225d4ed3c2e2e3e2'
            '24bcee655767f4731b8d3883dd93ba4edc7f1e87421e15fab19499d57236b8e9'
            '98ccf4b9932d7fb74896461f764c61921592a73089e3fcb4063fe7836c6a0bca')

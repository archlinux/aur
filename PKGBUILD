# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Rainmaker <rainmaker52@gmail.com>
# Contributor: gary9872	<garysBoXatgeemale.com>
# Contributor: khomutsky <bogdan@khomutsky.com>
# Contributor: M0Rf30

pkgbase=virtualbox-bin
pkgname=('virtualbox-bin' 'virtualbox-bin-guest-iso' 'virtualbox-bin-sdk')
pkgver=6.1.34
_build=150636
_rev=94273
pkgrel=2
pkgdesc='Powerful x86 virtualization for enterprise as well as home use (Oracle branded non-OSE)'
arch=('x86_64')
url='https://www.virtualbox.org/'
license=('GPL2')
makedepends=('python')
_rdeskver=1.8.4
source=("http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}-${_build}-Linux_amd64.run"
        "https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBoxSDK-${pkgver}-${_build}.zip"
        "VBoxAuth-r${_rev}.h"::"https://www.virtualbox.org/svn/vbox/trunk/include/VBox/VBoxAuth.h?p=${_rev}"
        "VBoxAuthPAM-r${_rev}.c"::"https://www.virtualbox.org/svn/vbox/trunk/src/VBox/HostServices/auth/pam/VBoxAuthPAM.c?p=${_rev}"
        "VBoxAuthSimple-r${_rev}.cpp"::"https://www.virtualbox.org/svn/vbox/trunk/src/VBox/HostServices/auth/simple/VBoxAuthSimple.cpp?p=${_rev}"
        'dkms.conf'
        'vboxreload'
        '60-vboxdrv.rules'
        'vboxweb.service'
        'virtualbox.sysusers'
        'LICENSE.sdk'
        '013-Makefile.patch'
        '020-linux518.patch')
noextract=("VirtualBoxSDK-${pkgver}-${_build}.zip")
sha256sums=('1e47ac7b0b71bc29aa6fe880f85f300fa7b2c921b01fda1de56144db13703a48'
            '79175b299955269635362730c6841141aaaa40d345080d986da2ef6d1e3dc2cb'
            'da610d799e06fc977c695d564b654be53bf3d0f6bd42dabeec687fd9d9af58dc'
            '69242fc39605786e8ccae38ee76bf771d1047cc237a4d661ebdfcc721e458957'
            '6b0c34c09c9184a511aff265d115c104db3af3ebe26121032717b053b2b6fd82'
            '63f1e9eabedec2170bd0589aaa2bf5025ff8f8ec1764cc4823cbe446e9ce1388'
            '4001b5927348fe669a541e80526d4f9ea91b883805f102f7d571edbb482a9b9d'
            '9c5238183019f9ebc7d92a8582cad232f471eab9d3278786225abc1a1c7bf66e'
            'e6e875ef186578b53106d7f6af48e426cdaf1b4e86834f01696b8ef1c685787f'
            '2101ebb58233bbfadf3aa74381f22f7e7e508559d2b46387114bc2d8e308554c'
            '09335d7d1075df02d29cec13119538134efdf43ea73a93b0f89d0d7d4b6625a1'
            '3c2089575e8c03b7517fe176e65168e15fb7aefe7e71224bf264d21812dbc635'
            'ee0e2fc32934c1b86f71a693c20d75f2a4d4ee27f17ef07b1eaa71aca7d1b08e')

prepare() {
    local _extractdir="${pkgname}-${pkgver}/VirtualBox-extracted"
    
    # extract files
    mkdir -p "$_extractdir"
    sh "VirtualBox-${pkgver}-${_build}-Linux_amd64.run" --noexec --nox11 --target "${pkgname}-${pkgver}"
    bsdtar -xf "${pkgname}-${pkgver}/VirtualBox.tar.bz2" -C "$_extractdir"
    bsdtar -xf "VirtualBoxSDK-${pkgver}-${_build}.zip" -C "${pkgname}-${pkgver}"
    bsdtar -xf "${_extractdir}/rdesktop-vrdp.tar.gz" -C "${pkgname}-${pkgver}" --include='*.1'
    
    # dkms configuration
    install -D -m644 dkms.conf -t "${_extractdir}/src/vboxhost"
    sed -i "s/^\(PACKAGE_VERSION\)=.*/\1=${pkgver}/" "${_extractdir}/src/vboxhost/dkms.conf"
    
    # fix dkms build
    patch -d "$_extractdir" -Np1 -i "${srcdir}/013-Makefile.patch"
    
    patch -d "$_extractdir" -Np1 -i "${srcdir}/020-linux518.patch"
}

build() {
    cd "${pkgname}-${pkgver}/sdk/installer"
    VBOX_INSTALL_PATH='/opt/VirtualBox' python vboxapisetup.py build
}

package_virtualbox-bin() {
    depends=('device-mapper' 'dkms' 'fontconfig' 'hicolor-icon-theme' 'libgl'
             'libidl2' 'libxcursor' 'libxinerama' 'libxmu' 'python' 'sdl')
    optdepends=('virtualbox-bin-guest-iso: for guest additions CD image'
                'virtualbox-bin-sdk: for the software developer kit'
                'virtualbox-ext-oracle: for Oracle extensions pack')
    provides=("virtualbox=${pkgver}" 'virtualbox-host-dkms' 'VIRTUALBOX-HOST-MODULES')
    conflicts=('virtualbox' 'virtualbox-host-dkms' 'virtualbox-host-modules-arch')
    replaces=('virtualbox_bin' 'virtualbox-sun')
    backup=('etc/vbox/vbox.cfg')
    options=('!strip' '!emptydirs')
    
    local _installdir='opt/VirtualBox'
    
    # install bundled files
    install -d -m755 "${pkgdir}/opt"
    cp -Pr --no-preserve='ownership' "${pkgname}-${pkgver}/VirtualBox-extracted" "${pkgdir}/${_installdir}"
    
    # mark binaries suid root, and make sure the directory is only writable by the user
    chmod 4755 "${pkgdir}/${_installdir}"/{VirtualBoxVM,VBox{Headless,Net{AdpCtl,DHCP,NAT},SDL,VolInfo}}
    chmod go-w "${pkgdir}/${_installdir}"
    
    # remove guest iso, rdesktop-vrdp packed sources and bundled sdk files
    rm -r "${pkgdir}/${_installdir}"/{additions/VBoxGuestAdditions.iso,rdesktop-vrdp.tar.gz,sdk}
    
    # module sources
    install -d -m755 "${pkgdir}/usr/src"
    mv "${pkgdir}/${_installdir}/src/vboxhost" "${pkgdir}/usr/src/vboxhost-${pkgver}_non_OSE"
    
    # module reloading shortcut (with a symlink with default helper)
    install -D -m755 vboxreload -t "${pkgdir}/usr/bin"
    ln -s vboxreload "${pkgdir}/usr/bin/rcvboxdrv"
    
    # udev rules
    ## we need to copy and not symlink VBoxCreateUSBNode.sh in /usr/lib/udev to avoid udevd
    ## to look /opt when /opt is not mounted. This can be done until VBoxCreateUSBNode.sh doesn't
    ## need more stuff from /opt
    install -D -m644 60-vboxdrv.rules -t "${pkgdir}/usr/lib/udev/rules.d"
    install -D -m755 "${pkgdir}/${_installdir}/VBoxCreateUSBNode.sh" -t "${pkgdir}/usr/lib/udev"
    install -D -m755 "${pkgdir}/${_installdir}/VBoxCreateUSBNode.sh" -t "${pkgdir}/usr/share/virtualbox"
    
    # configuration file
    install -D -m644 <(printf '%s\n' "INSTALL_DIR=/${_installdir}") "${pkgdir}/etc/vbox/vbox.cfg"
    
    # modules-load.d configuration
    install -D -m644 <(printf 'vboxdrv\nvboxnetadp\nvboxnetflt\n') "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    
    # systemd
    install -D -m644 vboxweb.service -t "${pkgdir}/usr/lib/systemd/system"
    install -D -m644 virtualbox.sysusers "${pkgdir}/usr/lib/sysusers.d/virtualbox.conf"
    
    # man page for rdesktop-vrdp
    install -D -m644 "${pkgname}-${pkgver}/rdesktop-${_rdeskver}-vrdp/doc/rdesktop.1" \
        "${pkgdir}/usr/share/man/man1/rdesktop-vrdp.1"
    
    # symlinks
    local _dir
    local _file
    install -d -m755 "${pkgdir}/usr/share"/{applications,{doc,licenses}/"$pkgname",mime/packages,pixmaps}
    for _file in vboxwebsrv VirtualBox{,VM} VBox{Manage,SDL,VRDP,Headless,Autostart,BalloonCtrl,BugReport,DTrace}
    do
        ln -s "../../${_installdir}/VBox.sh" "${pkgdir}/usr/bin/${_file}"
        [ "$_file" != 'vboxwebsrv' ] && ln -s "../../${_installdir}/VBox.sh" "${pkgdir}/usr/bin/${_file,,}"
    done
    ln -s "../../${_installdir}/VBoxTunctl" "${pkgdir}/usr/bin/VBoxTunctl"
    ln -s "../../${_installdir}/rdesktop-vrdp" "${pkgdir}/usr/bin/rdesktop-vrdp"
    ln -s "../../../${_installdir}/VBoxSysInfo.sh" "${pkgdir}/usr/share/virtualbox/VBoxSysInfo.sh"
    ln -s "../../../usr/src/vboxhost-${pkgver}_non_OSE" "${pkgdir}/${_installdir}/src/vboxhost"
    ln -s "../../../${_installdir}/VBox.png" "${pkgdir}/usr/share/pixmaps/VBox.png"
    ln -s "../../../${_installdir}/virtualbox.desktop" "${pkgdir}/usr/share/applications/virtualbox.desktop"
    ln -s "../../../../${_installdir}/virtualbox.xml" "${pkgdir}/usr/share/mime/packages/virtualbox.xml"
    ln -s "../../../../${_installdir}/UserManual.pdf" "${pkgdir}/usr/share/doc/${pkgname}/UserManual.pdf"
    ln -s "../../../../${_installdir}/VirtualBox.chm" "${pkgdir}/usr/share/doc/${pkgname}/VirtualBox.chm"
    ln -s "../../../../${_installdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    ## hicolor icons
    while read -r -d '' _file
    do
        if grep -Eq '/virtualbox\.(png|svg)$' <<< "$_file"
        then
            _dir="${_file%/*}/apps"
        else
            _dir="${_file%/*}/mimetypes"
        fi
        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${_dir}"
        ln -s "../../../../../../${_installdir}/icons/${_dir%/*}/${_file##*/}" \
            "${pkgdir}/usr/share/icons/hicolor/${_dir}/${_file##*/}"
    done < <(find "${pkgdir}/${_installdir}/icons" -type f -print0 | sed -z "s|${pkgdir}/${_installdir}/icons/||")
    ## workaround for unsupported $ORIGIN/.. in VBoxC.so
    for _file in VBox{RT,XPCOM}.so
    do
        ln -s "../${_file}" "${pkgdir}/${_installdir}/components/${_file}"
    done
}

package_virtualbox-bin-guest-iso() {
    pkgdesc='VirtualBox guest additions ISO image for use with virtualbox-bin package'
    arch=('any')
    provides=('virtualbox-guest-iso')
    
    install -D -m644 "${pkgbase}-${pkgver}/VirtualBox-extracted/additions/VBoxGuestAdditions.iso" \
        -t "${pkgdir}/opt/VirtualBox/additions"
}

package_virtualbox-bin-sdk() {
    pkgdesc='VirtualBox software developer kit for use with virtualbox-bin package'
    arch=('any')
    license=('LGPL2.1' 'GPL2' 'BSD' 'custom')
    depends=('python')
    optdepends=('java-runtime: for webservice java bindings')
    provides=('virtualbox-sdk')
    conflicts=('virtualbox-sdk')
    
    local _dir
    local _installdir='opt/VirtualBox'
    
    install -d -m755 "${pkgdir}/${_installdir}/sdk"
    while read -r -d '' _dir
    do
        cp -Pr --no-preserve='ownership' "$_dir" "${pkgdir}/${_installdir}/sdk"
    done < <(find "${pkgbase}-${pkgver}/sdk" -mindepth 1 -maxdepth 1 -type d ! -name 'installer' -print0)
    
    install -D -m644 "VBoxAuth-r${_rev}.h"    "${pkgdir}/${_installdir}/sdk/bindings/auth/include/VBoxAuth.h"
    install -D -m644 "VBoxAuthPAM-r${_rev}.c" "${pkgdir}/${_installdir}/sdk/bindings/auth/VBoxAuthPAM.cpp"
    install -D -m644 "VBoxAuthSimple-r${_rev}.cpp" "${pkgdir}/${_installdir}/sdk/bindings/auth/VBoxAuthSimple.cpp"
    install -D -m644 LICENSE.sdk "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
    cd "${pkgbase}-${pkgver}/sdk/installer"
    VBOX_INSTALL_PATH="/${_installdir}" python vboxapisetup.py install --root "$pkgdir" --skip-build --optimize='1'
}

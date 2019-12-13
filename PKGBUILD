# Maintainer : Daniel Bermond < gmail: danielbermond >
# Contributor: Rainmaker <rainmaker52@gmail.com>
# Contributor: gary9872	<garysBoXatgeemale.com>
# Contributor: khomutsky <bogdan@khomutsky.com>
# Contributor: M0Rf30

pkgname=virtualbox-bin
pkgver=6.1.0
_build=135406
_rev=79806
pkgrel=1
pkgdesc='Oracle VM VirtualBox Binary Edition (Oracle branded non-OSE version)'
arch=('x86_64')
url='https://www.virtualbox.org/'
license=('GPL2')
depends=('dkms' 'fontconfig' 'gcc' 'libgl' 'libidl2' 'libxcursor' 'libxinerama'
         'libxmu' 'python' 'sdl')
makedepends=('linux-headers')
optdepends=('virtualbox-ext-oracle: for Oracle extensions'
            'linux-headers: build the module for Arch kernel'
            'linux-lts-headers: build the module for LTS Arch kernel')
provides=("virtualbox=${pkgver}" 'virtualbox-sdk' 'VIRTUALBOX-HOST-MODULES'
          'virtualbox-host-dkms' 'virtualbox-guest-iso')
conflicts=('virtualbox' 'virtualbox-sdk' 'virtualbox-host-dkms' 'virtualbox-host-modules-arch')
replaces=('virtualbox_bin' 'virtualbox-sun')
backup=('etc/vbox/vbox.cfg' 'etc/conf.d/vboxweb')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("http://download.virtualbox.org/virtualbox/${pkgver}/VirtualBox-${pkgver}-${_build}-Linux_amd64.run"
        "https://download.virtualbox.org/virtualbox/${pkgver}/VirtualBoxSDK-${pkgver}-${_build}.zip"
        "VBoxAuth-r${_rev}.h"::"https://www.virtualbox.org/svn/vbox/trunk/include/VBox/VBoxAuth.h?p=${_rev}"
        "VBoxAuthPAM-r${_rev}.c"::"https://www.virtualbox.org/svn/vbox/trunk/src/VBox/HostServices/auth/pam/VBoxAuthPAM.c?p=${_rev}"
        "VBoxAuthSimple-r${_rev}.cpp"::"https://www.virtualbox.org/svn/vbox/trunk/src/VBox/HostServices/auth/simple/VBoxAuthSimple.cpp?p=${_rev}"
        'VBoxFixUSB'
        '10-vboxdrv.rules'
        'vboxweb.rc'
        'vboxweb.conf'
        'do_dkms'
        'dkms.conf'
        '013-Makefile.patch')
noextract=("VirtualBoxSDK-${pkgver}-${_build}.zip")
sha256sums=('ab2d021fac9651ee95ac2268aeea684faa547fad40448eb3e07ee52f193f0bab'
            'c2731de9a92a370d41279d77ff5d9c324aff9a9c855d827d445bb621fae12df6'
            '584f02a2a1e83b9cabd7b7e3b00a0515b118e040160eb46c014ea6fd3a16586e'
            '600df773fca199dc21acde10c95a4733b03b3efd8ffaef3a9fb9da363a9cd114'
            '452351c15d97aeda29e45dbcb0da69412dc3a615c9aece43a424af3639368d49'
            '0aebe22abab402ea6b6573af637a99d8056a904920a52d84fb97729219219c23'
            '69417a9e8855cab8e4878886abe138f559fd17ae487d4cd19c8a24974a8bbec2'
            '656905de981ffa24f6f921c920538854a235225053f44baedacc07b46ca0cf56'
            '12dbba3b59991f2b68cddeeeda20236aeff63e11b7e2d1b08d9d6a82225f6651'
            'cc1c0500ab07bc13563d99037f776bf64bdc90bb521e31e2e0b04e42ea5bb36a'
            '63f1e9eabedec2170bd0589aaa2bf5025ff8f8ec1764cc4823cbe446e9ce1388'
            '268e794de9d66a2751006b2ca3810fc6a05da4af2ffa8b58c56c94b292f1f424')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    
    # extract the main source file
    yes 2>/dev/null | sh "VirtualBox-${pkgver}-${_build}-Linux_amd64.run" \
                          --target "${srcdir}/${pkgname}-${pkgver}" \
                          --nox11 \
                          --noexec \
                          &> /dev/null
              
    # extract sdk
    cd "${pkgname}-${pkgver}"
    bsdtar -xf "${srcdir}/VirtualBoxSDK-${pkgver}-${_build}.zip"
}

package() {
    local _installdir='opt/VirtualBox'
    
    # install bundled files
    printf '%s\n' '  -> Installing bundled files...'
    install -d "${pkgdir}/${_installdir}"
    tar -jxf "${srcdir}/${pkgname}-${pkgver}/VirtualBox.tar.bz2" -C "${pkgdir}/${_installdir}"
    
    # fix dkms build
    printf '%s\n' "  -> Fixing DKMS build..."
    cd "${pkgdir}/${_installdir}"
    patch -Np1 -i "${srcdir}/013-Makefile.patch"
    
    # hardened build: mark binaries suid root, and make sure the
    # directory is only writable by the user
    printf '%s\n' '  -> Fixing permissions...'
    cd "${pkgdir}/${_installdir}"
    chmod 4755 VirtualBoxVM VBox{Headless,Net{AdpCtl,DHCP,NAT},SDL,VolInfo}
    chmod go-w "${pkgdir}/${_installdir}"
    
    # install SDK
    printf '%s\n' '  -> Installing SDK...'
    cd "${srcdir}/${pkgname}-${pkgver}"
    pushd 'sdk/installer' >/dev/null
    VBOX_INSTALL_PATH="/${_installdir}" python vboxapisetup.py install --root "$pkgdir"
    popd >/dev/null
    rm -r "${pkgdir}/${_installdir}/sdk"
    mkdir -p "${pkgdir}/${_installdir}/sdk"
    cp -a sdk/bindings "${pkgdir}/${_installdir}/sdk"
    cp -a sdk/docs     "${pkgdir}/${_installdir}"
    install -D -m644 "${srcdir}/VBoxAuth-r${_rev}.h"         "${pkgdir}/${_installdir}/sdk/bindings/auth/include/VBoxAuth.h"
    install -D -m644 "${srcdir}/VBoxAuthPAM-r${_rev}.c"      "${pkgdir}/${_installdir}/sdk/bindings/auth/VBoxAuthPAM.cpp"
    install -D -m644 "${srcdir}/VBoxAuthSimple-r${_rev}.cpp" "${pkgdir}/${_installdir}/sdk/bindings/auth/VBoxAuthSimple.cpp"
    
    # install udev rules
    printf '%s\n' '  -> Installing udev rules...'
    cd "${pkgdir}/${_installdir}"
    install -D -m0644 "${srcdir}/10-vboxdrv.rules" "${pkgdir}/usr/lib/udev/rules.d/10-vboxdrv.rules"
    ## we need to copy and not symlink VBoxCreateUSBNode.sh in /usr/lib/udev to avoid udevd
    ## to look /opt when /opt is not mounted. This can be done until VBoxCreateUSBNode.sh doesn't
    ## need more stuff from /opt
    cp -a VBoxCreateUSBNode.sh "${pkgdir}/usr/lib/udev/"
    
    printf '%s\n' '  -> Installing scripts...'
    
    # install VBoxFixUSB script
    install -D -m0755 "${srcdir}/VBoxFixUSB" VBoxFixUSB
    
    # install vboxweb initscript
    install -D -m0755 "${srcdir}/vboxweb.rc"   "${pkgdir}/etc/rc.d/vboxweb"
    install -D -m0644 "${srcdir}/vboxweb.conf" "${pkgdir}/etc/conf.d/vboxweb"
    
    printf '%s\n' '  -> Creating needed symlinks...'
    
    # symlinks for working around unsupported $ORIGIN/.. in VBoxC.so
    local _lib
    for _lib in VBox{RT,XPCOM}.so
    do
        ln -s "../${_lib}" "components/${_lib}"
    done
    
    # symlink the launchers
    local _bin
    install -d -m0755 "${pkgdir}/usr/bin"
    for _bin in VirtualBox{,VM} VBox{Headless,Manage,SDL,SVC,Tunctl,NetAdpCtl,FixUSB}
    do
        ln -s "../../${_installdir}/${_bin}" "${pkgdir}/usr/bin/${_bin}"
        ln -s "../../${_installdir}/${_bin}" "${pkgdir}/usr/bin/${_bin,,}"
    done
    ln -s "../../${_installdir}/rdesktop-vrdp" "${pkgdir}/usr/bin/rdesktop-vrdp"
    
    # symlink the desktop icon and .desktop files
    install -d -m0755 "${pkgdir}/usr/"{share/applications,share/pixmaps}
    ln -s "../../../${_installdir}/VBox.png"                     "${pkgdir}/usr/share/pixmaps/VBox.png"
    ln -s "../../../${_installdir}/icons/128x128/virtualbox.png" "${pkgdir}/usr/share/pixmaps/virtualbox.png"
    ln -s "../../../${_installdir}/virtualbox.desktop"           "${pkgdir}/usr/share/applications/virtualbox.desktop"
    
    # symlink mime info
    install -d -m0755 "${pkgdir}/usr/share/mime/packages"
    ln -s "../../../../${_installdir}/virtualbox.xml" "${pkgdir}/usr/share/mime/packages/virtualbox.xml"
    
    # symlink doc
    install -d -m0755 "${pkgdir}/usr/share/doc/${pkgname}"
    ln -s "../../../../${_installdir}/VirtualBox.chm" "${pkgdir}/usr/share/doc/${pkgname}/virtualbox.chm"
    
    # symlink icons
    local _dir
    local _icon
    pushd icons >/dev/null
    for _dir in *
    do
        cd "$_dir"
        install -d -m0755 "${pkgdir}/usr/share/icons/hicolor/${_dir}/"{apps,mimetypes}
        for _icon in *
        do
            if [ "$_icon" = 'virtualbox.png' ] 
            then
                ln -s "../../../../../../${_installdir}/icons/${_dir}/${_icon}" "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/${_icon}"
            else
                ln -s "../../../../../../${_installdir}/icons/${_dir}/${_icon}" "${pkgdir}/usr/share/icons/hicolor/${_dir}/mimetypes/${_icon}"
            fi
        done
        cd - >/dev/null
    done
    popd >/dev/null
    
    # with the relase of VirtualBox 5.1.0, Oracle dropped DKMS support from their package
    # we will restore DKMS with the use of these config files
    printf '%s\n' '  -> Installing DKMS support...'
    install -D -m0755 "${srcdir}/do_dkms" -t "${pkgdir}/${_installdir}/src/vboxhost"
    ## update module version
    cd "$srcdir"
    cp -a dkms.conf "${pkgname}-${pkgver}"
    sed -i "s/^\(PACKAGE_VERSION\)=/\1=${pkgver}/" "${pkgname}-${pkgver}/dkms.conf"
    install -D -m0644 "${pkgname}-${pkgver}/dkms.conf" -t "${pkgdir}/${_installdir}/src/vboxhost"

    # module sources in /usr/src
    printf '%s\n' '  -> Installing module sources...'
    install -d -m0755 "${pkgdir}/usr/src"
    mv "${pkgdir}/${_installdir}/src/vboxhost" "${pkgdir}/usr/src/vboxhost-${pkgver}"
    
    # write the configuration file
    printf '%s\n' '  -> Writing the configuration file...'
    install -D -m0644 /dev/null "${pkgdir}/etc/vbox/vbox.cfg"
    cat > "${pkgdir}/etc/vbox/vbox.cfg" << __EOF__
# VirtualBox installation directory
INSTALL_DIR='/${_installdir}'

# VirtualBox version
INSTALL_VER='${pkgver}'
INSTALL_REV='${_build}'
__EOF__
    
    # write modules-load.d configuration to ensure that modules are loaded at boot
    printf '%s\n' "  -> Writing 'modules-load.d' configuration..."
    install -D -m644 /dev/null "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    cat > "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf" << __EOF__
# Load virtualbox kernel modules at boot
# This file was installed by the ${pkgname} AUR package
vboxdrv
vboxpci
vboxnetadp
vboxnetflt
__EOF__
}

# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Contributor: Daniel Bermond < gmail: danielbermond >
# Contributor: Rainmaker <rainmaker52@gmail.com>
# Contributor: gary9872	<garysBoXatgeemale.com>
# Contributor: khomutsky <bogdan@khomutsky.com>
# Contributor: M0Rf30

pkgname=virtualbox-beta-bin
pkgver=6.0.0.127378
_pkgver=6.0.0_RC1
_build=127378
_rev=75527
pkgrel=3
pkgdesc='Oracle VM VirtualBox Binary Edition (Oracle branded non-OSE version)'
arch=('i686' 'x86_64')
url='https://www.virtualbox.org/'
license=('GPL2')
depends=('dkms' 'fontconfig' 'gcc' 'libgl' 'libidl2' 'libxcursor' 'libxinerama'
         'libxmu' 'python' 'sdl')
makedepends=('linux-headers')
optdepends=('virtualbox-ext-oracle-beta: for Oracle extensions'
            'linux-headers: build the module for Arch kernel'
            'linux-lts-headers: build the module for LTS Arch kernel')
provides=(virtualbox-beta "virtualbox=${_pkgver}" 'virtualbox-sdk' 'VIRTUALBOX-HOST-MODULES'
          'virtualbox-host-dkms' 'virtualbox-guest-iso')
conflicts=('virtualbox' 'virtualbox-sdk' 'virtualbox-host-dkms' 'virtualbox-host-modules-arch')
replaces=('virtualbox_bin' 'virtualbox-sun')
backup=('etc/vbox/vbox.cfg' 'etc/conf.d/vboxweb')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("https://download.virtualbox.org/virtualbox/${_pkgver}/VirtualBoxSDK-${_pkgver}-${_build}.zip"
        "VBoxAuth-r${_rev}.h"::"https://www.virtualbox.org/svn/vbox/trunk/include/VBox/VBoxAuth.h?p=${_rev}"
        "VBoxAuthPAM-r${_rev}.c"::"https://www.virtualbox.org/svn/vbox/trunk/src/VBox/HostServices/auth/pam/VBoxAuthPAM.c?p=${_rev}"
        "VBoxAuthSimple-r${_rev}.cpp"::"https://www.virtualbox.org/svn/vbox/trunk/src/VBox/HostServices/auth/simple/VBoxAuthSimple.cpp?p=${_rev}"
        'VBoxFixUSB'
        '10-vboxdrv.rules'
        'vboxweb.rc'
        'vboxweb.conf'
        'do_dkms'
        'dkms.conf'
        '009-include-path.patch')
source_i686=("http://download.virtualbox.org/virtualbox/${_pkgver}/VirtualBox-${_pkgver}-${_build}-Linux_x86.run")
source_x86_64=("http://download.virtualbox.org/virtualbox/${_pkgver}/VirtualBox-${_pkgver}-${_build}-Linux_amd64.run")
noextract=("VirtualBoxSDK-${_pkgver}-${_build}.zip")
sha256sums=('550f83ee2ee3844fdf4718ac4aa1f36fd22ac2fa7658779a1911060cf5aa9326'
            '23e3e0e6abfaa69bf0aa046c0ee070d19435b97cb4bfbb16bba65a2783502154'
            '815f6e2e3ab687356aad0e6f59eef6e266514fb12a6b569d239d834e0a480f37'
            '99deff35d8a600f20223b96ba409451834e58ac21a589a989dd82a2d6fe006ae'
            '0aebe22abab402ea6b6573af637a99d8056a904920a52d84fb97729219219c23'
            '69417a9e8855cab8e4878886abe138f559fd17ae487d4cd19c8a24974a8bbec2'
            '656905de981ffa24f6f921c920538854a235225053f44baedacc07b46ca0cf56'
            '12dbba3b59991f2b68cddeeeda20236aeff63e11b7e2d1b08d9d6a82225f6651'
            'cc1c0500ab07bc13563d99037f776bf64bdc90bb521e31e2e0b04e42ea5bb36a'
            'e9df0fff15184d0a90abe17707bdbe1931582433bbc14ded4fb3b0252653c801'
            '5112f0e1ba3bd0bd92ef2edb2d21024e265abb02841aa29aa05410526adc273f')
sha256sums_i686=('beb78333278ac38d219b343c2606da4053cfd0977e16375488d928df20eae9c0')
sha256sums_x86_64=('74b2c17c33e48ec90a505046e10710b79906488ef1e2cf4f3427504762686f61')

prepare() {
    [ "$CARCH" = 'i686'   ] && local _arch='x86'
    [ "$CARCH" = 'x86_64' ] && local _arch='amd64'
    
    mkdir -p "${pkgname}-${_pkgver}"
    
    # extract the main source file
    yes | sh "VirtualBox-${_pkgver}-${_build}-Linux_${_arch}.run" \
              --target "${srcdir}/${pkgname}-${_pkgver}" \
              --nox11 \
              --noexec \
              &> /dev/null
              
    # extract sdk
    cd "${pkgname}-${_pkgver}"
    bsdtar -xf "${srcdir}/VirtualBoxSDK-${_pkgver}-${_build}.zip"
}

package() {
    local _installdir='/opt/VirtualBox'
    
    # install bundled files
    printf '%s\n' '  -> Installing bundled files...'
    install -d "${pkgdir}/${_installdir}"
    tar -jxf "${srcdir}/${pkgname}-${_pkgver}/VirtualBox.tar.bz2" -C "${pkgdir}/${_installdir}"
    
    # apply patch 009-include-path (thanks to Christian Hesse)
    printf '%s\n' "  -> Applying patch '009-includepath.patch'..."
    cd "${pkgdir}/${_installdir}/src/vboxhost/"
    patch -Np5 -i "${srcdir}/009-include-path.patch"
    
    # hardened build: mark binaries suid root, create symlinks for working around
    #                 unsupported $ORIGIN/.. in VBoxC.so and make sure the
    #                 directory is only writable by the user (paranoid)
    cd "${pkgdir}/${_installdir}"
    chmod 0755 VirtualBox VBox{SDL,Headless,NetDHCP,NetNAT,NetAdpCtl,VolInfo}
    for _lib in VBox{VMM,RT}.so
    do
        ln -s "${_installdir}/${_lib}" "components/${_lib}"
    done
    chmod go-w "${pkgdir}/${_installdir}"
    
    # install SDK
    printf '%s\n' '  -> Installing SDK...'
    cd "${srcdir}/${pkgname}-${_pkgver}"
    pushd 'sdk/installer' >/dev/null
    VBOX_INSTALL_PATH="$_installdir" python vboxapisetup.py install --root "$pkgdir"
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
    
    # symlink the launchers (second link can fail if fs is not case sensitive)
    install -d -m0755 "${pkgdir}/usr/bin"
    for _bin in VirtualBox VBox{Headless,Manage,SDL,SVC,Tunctl,NetAdpCtl,FixUSB} rdesktop-vrdp
    do
        ln -s "${_installdir}/${_bin}" "${pkgdir}/usr/bin/${_bin}"
        ln -s "${_installdir}/${_bin}" "${pkgdir}/usr/bin/${_bin,,}" &>/dev/null || :
    done
    
    # symlink the desktop icon and .desktop files
    install -d -m0755 "${pkgdir}/usr/"{share/applications,share/pixmaps}
    ln -s "${_installdir}/VBox.png"                     "${pkgdir}/usr/share/pixmaps/VBox.png"
    ln -s "${_installdir}/icons/128x128/virtualbox.png" "${pkgdir}/usr/share/pixmaps/virtualbox.png"
    ln -s "${_installdir}/virtualbox.desktop"           "${pkgdir}/usr/share/applications/virtualbox.desktop"
    
    # symlink mime info
    install -d -m0755 "${pkgdir}/usr/share/mime/packages"
    ln -s "${_installdir}/virtualbox.xml" "${pkgdir}/usr/share/mime/packages/virtualbox.xml"
    
    # symlink doc
    install -d -m0755 "${pkgdir}/usr/share/doc/${pkgname}"
    ln -s "${_installdir}/VirtualBox.chm" "${pkgdir}/usr/share/doc/${pkgname}/virtualbox.chm"
    
    # symlink icons
    pushd icons >/dev/null
    for _dir in *
    do
        cd "$_dir"
        install -d -m0755 "${pkgdir}/usr/share/icons/hicolor/${_dir}/"{apps,mimetypes}
        for _icon in *
        do
            if [ "$_icon" = 'virtualbox.png' ] 
            then
                ln -s "${_installdir}/icons/${_dir}/${_icon}" "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/${_icon}"
            else
                ln -s "${_installdir}/icons/${_dir}/${_icon}" "${pkgdir}/usr/share/icons/hicolor/${_dir}/mimetypes/${_icon}"
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
    cp -a dkms.conf "${pkgname}-${_pkgver}"
    sed -i "s/PACKAGE_VERSION=/PACKAGE_VERSION=${_pkgver}/" "${pkgname}-${_pkgver}/dkms.conf"
    install -D -m0644 "${pkgname}-${_pkgver}/dkms.conf" -t "${pkgdir}/${_installdir}/src/vboxhost"

    # module sources in /usr/src
    printf '%s\n' '  -> Installing module sources...'
    install -d -m0755 "${pkgdir}/usr/src"
    mv "${pkgdir}/${_installdir}/src/vboxhost" "${pkgdir}/usr/src/vboxhost-${_pkgver}"
    
    # write the configuration file
    printf '%s\n' '  -> Writing the configuration file...'
    install -D -m0644 /dev/null "${pkgdir}/etc/vbox/vbox.cfg"
    cat > "${pkgdir}/etc/vbox/vbox.cfg" <<EOF
# VirtualBox installation directory
INSTALL_DIR='${_installdir}'

# VirtualBox version
INSTALL_VER='${_pkgver}'
INSTALL_REV='${_build}'
EOF
    
    # write modules-load.d configuration to ensure that modules are loaded at boot
    printf '%s\n' "  -> Writing 'modules-load.d' configuration..."
    install -D -m644 /dev/null "${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    printf '%s\n'   '# Load virtualbox kernel modules at boot '                >"${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    printf '%s\n\n' "# This file was installed by the ${pkgname} AUR package" >>"${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    printf '%s\n'   'vboxdrv'    >>"${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    printf '%s\n'   'vboxpci'    >>"${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    printf '%s\n'   'vboxnetadp' >>"${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    printf '%s\n'   'vboxnetflt' >>"${pkgdir}/usr/lib/modules-load.d/${pkgname}.conf"
    
    # fix permissions (change executables from 4711 to 4755)
    printf '%s\n' '  -> Fixing permissions...'
    chmod 0755 "${pkgdir}/${_installdir}"/{VBox{Headless,Net{AdpCtl,DHCP,NAT},SDL,VolInfo},VirtualBox}
}

# Maintainer:  dodotronix <dodotronix@gmail.com>

INSTALL_DIR="/opt/ti"

pkgname=ccstheia
_semver=1.4.1
_bldver=00001
pkgver=$_semver.$_bldver
pkgrel=2
pkgdesc="Texas Instruments Code Composer Studio Theia including SDKs and libraries"

# version of the SDK, libraries and compilers to be downloaded
_sdkver="03.06.02.00-LTS"
_sdkver_underscores=$(echo $_sdkver | sed 's/\./_/g')
_sdkinstall="mmwave_sdk_${_sdkver_underscores}-Linux-x86-Install.bin"

_dsplibver="3.4.0.0"
_dsplibver_underscores=$(echo $_dsplibver | sed 's/\./_/g')
_dsplibinstall="dsplib_c64Px_${_dsplibver_underscores}_Linux.bin"

arch=('x86_64')
url="http://www.ti.com/"
license=('custom')
makedepends=('glibc')

# the python2 and gconf have to be installed manualy from AUR
depends=('gtk3' 'python2' 'mono' 'ncurses5-compat-libs' 'libxcrypt-compat' 'libusb-compat' 'gconf')

# Without some ttf fonts installed, UI is ugly
optdepends=('ttf-dejavu')
_desktop="CCS Theia ${_semver}.desktop"
_archive=CCSTheia${pkgver}_linux-x64

source=(
    "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-63JH5Zr6eq/${_semver}/${_archive}.zip"
    "https://dr-download.ti.com/software-development/software-development-kit-sdk/MD-PIrUeCYr3X/${_sdkver}/${_sdkinstall}"
    "https://dr-download.ti.com/software-development/driver-or-library/MD-j4KPuQRRxY/${_dsplibver}/${_dsplibinstall}"
)

md5sums=(
    '486498dc96bc70d85316804995adf534'
    '1220a008af85c1cc97a2a8648c7f6c7c'
    '680a83b923237913b744c6dca9104d30'
)

# Takes forever for probably minimal gain
options=('!strip')

prepare() {
    cd "${srcdir}/${_archive}"
    echo "Directory changed: ${srcdir}/${_archive}"

    ./ccs_theia_setup_${pkgver}.run \
        --mode unattended \
        --unattendedmodeui minimal \
        --prefix "${srcdir}${INSTALL_DIR}"

    echo "Removing the ${srcdir} in all files to point to ${INSTALL_DIR}"
    PATH_TO_FIND=$(echo "${srcdir}" | sed 's/\//\\\//g')

    # remove the $srcdir prefix from all the paths in every file
    find ${srcdir}${INSTALL_DIR} -type f -exec sed -i "s/${PATH_TO_FIND}//g" '{}' \+
}

package() {
    mkdir -p ${pkgdir}${INSTALL_DIR}

    # install the CCS Theia
    echo "Installing CCS Theia to ${pkgdir}${INSTALL_DIR}"
    mv ${srcdir}${INSTALL_DIR}/* ${pkgdir}${INSTALL_DIR}
    ls -l ${pkgdir}${INSTALL_DIR}

    # create desktop shortcut
    install -D -m0644 "${pkgdir}${INSTALL_DIR}/${_desktop}" ${pkgdir}/usr/share/applications/${pkgname}.desktop

    mkdir -p ${pkgdir}/usr/bin
    ln -f -s $(grep 'Exec=' "${pkgdir}${INSTALL_DIR}/${_desktop}" | cut -d'=' -f2) ${pkgdir}/usr/bin/${pkgname}

    # install SDK to /opt/ti
    echo "Making ${_sdkinstall} executable"
    chmod +x ${_sdkinstall}

    echo "Installing SDK to ${pkgdir}${INSTALL_DIR}"
    ./${_sdkinstall} \
        --mode unattended \
        --unattendedmodeui none \
        --prefix "${pkgdir}${INSTALL_DIR}"

    echo "Making ${_dsplibinstall} executable"
    chmod +x ${_dsplibinstall}

    ./${_dsplibinstall} \
        --prefix "${pkgdir}${INSTALL_DIR}" \
        --mode "silent"

    # install udev rules
    cd "${pkgdir}${INSTALL_DIR}/ccs/install_scripts/"
    install -d "${pkgdir}/etc/udev/rules.d/"
	install -Dm644 "71-ti-permissions.rules" "${pkgdir}/etc/udev/rules.d/71-ti-permissions.rules"
	install -Dm644 "99-jlink.rules" "${pkgdir}/etc/udev/rules.d/99-jlink.rules"

}

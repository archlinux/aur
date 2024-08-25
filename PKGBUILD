# Maintainer:  dodotronix <dodotronix@gmail.com>

INSTALL_DIR="/opt/ti"

pkgname=ccstheia
_semver=1.4.1
_bldver=00001
pkgver=$_semver.$_bldver
pkgrel=1
pkgdesc="Texas Instruments Code Composer Studio Theia"
arch=('x86_64')
url="http://www.ti.com/"
license=('custom')
makedepends=('glibc')

# the python2 and gconf have to be installed manualy from AUR
depends=('gtk3' 'python2' 'ncurses5-compat-libs' 'libxcrypt-compat' 'libusb-compat' 'gconf')

# Without some ttf fonts installed, UI is ugly
optdepends=('ttf-dejavu')
_desktop="CCS Theia ${_semver}.desktop"
_archive=CCSTheia${pkgver}_linux-x64

source=(
    "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-63JH5Zr6eq/${_semver}/${_archive}.zip"
)

md5sums=(
    '486498dc96bc70d85316804995adf534'
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

    mv ${srcdir}${INSTALL_DIR}/* ${pkgdir}${INSTALL_DIR}
    ls -l ${pkgdir}${INSTALL_DIR}

    # create desktop shortcut
    install -D -m0644 "${pkgdir}${INSTALL_DIR}/${_desktop}" ${pkgdir}/usr/share/applications/${pkgname}.desktop

    mkdir -p ${pkgdir}/usr/bin
    ln -f -s $(grep 'Exec=' "${pkgdir}${INSTALL_DIR}/${_desktop}" | cut -d'=' -f2) ${pkgdir}/usr/bin/${pkgname}

    cd "${pkgdir}${INSTALL_DIR}/ccs/install_scripts/"
    install -d "${pkgdir}/etc/udev/rules.d/"
	install -Dm644 "71-ti-permissions.rules" "${pkgdir}/etc/udev/rules.d/71-ti-permissions.rules"
	install -Dm644 "99-jlink.rules" "${pkgdir}/etc/udev/rules.d/99-jlink.rules"

}

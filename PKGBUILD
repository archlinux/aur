# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-gui
pkgver=11.0.16.9184
pkgrel=2
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Graphical utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'icu' 'keyutils' 'krb5>=1.10.' 'lttng-ust' 'zlib>=1.1.4' 'plasticscm-client-core')
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the binaries
source=(
    "https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-client-gui.tar.gz"
    "https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-theme.tar.gz"
)
b2sums=(
    '3ca104729947dddef1fbc0a02d7d674183077bec0258c46cd4aa6bd1c18a21d03728882f2e2a998f97b533d990af1d40e55624ea6e0b438709097ac1403938d4'
    'fe1b5df079a9dbbca24bd01d8fbd2c734a23f4a11d5722e75a915930a5d7dbdbb146629ac705a2e14f77293120d1d42c39ca778273b037ee60870471b7991654'
)

prepare() {
    # these files are already provided by plasticscm-client-core
    rm client/cplusplusparser.jar
    rm client/javaparser.jar
}

package() {
    local -r plasticdir="/opt/plasticscm5"

    # create directories
    install -d "${pkgdir}${plasticdir}/" "${pkgdir}/usr/bin/" "${pkgdir}/usr/share/applications"

    # copy files
    cp -r "${srcdir}/client/" "${pkgdir}${plasticdir}/"
    cp -r "${srcdir}/theme/" "${pkgdir}${plasticdir}/"

    # set executable permissions
    chmod 775 "${pkgdir}${plasticdir}/client/lingluonx"
    chmod 775 "${pkgdir}${plasticdir}/client/linplasticx"

    # create symlinks because some .desktop files expect icon names prefixed with "lin"
    ln -s gluon.ico "${pkgdir}${plasticdir}/theme/avalonia/icons/lingluonx.ico"
    ln -s unityvcs.ico "${pkgdir}${plasticdir}/theme/avalonia/icons/linunityvcs.ico"

    # create symlinks
    ln -s "${plasticdir}/client/linplasticx" "${pkgdir}/usr/bin"
    ln -s "${plasticdir}/client/lingluonx" "${pkgdir}/usr/bin"
    ln -s "${plasticdir}/client/gtkmergetool" "${pkgdir}/usr/bin"
    ln -s "${plasticdir}/client/semanticmergetool" "${pkgdir}/usr/bin"
    ln -s "${plasticdir}/client/plasticx.desktop" "${pkgdir}/usr/share/applications"
    ln -s "${plasticdir}/client/unityvcs.desktop" "${pkgdir}/usr/share/applications"
    ln -s "${plasticdir}/client/gluonx.desktop" "${pkgdir}/usr/share/applications"
}

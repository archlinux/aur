# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-gui
pkgver=11.0.16.10303
pkgrel=1
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Graphical utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'icu' 'keyutils' 'krb5' 'lttng-ust' 'zlib' 'plasticscm-client-core')
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the binaries
source=(
    "https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-client-gui.tar.gz"
    "https://plastic-releases.s3.eu-west-2.amazonaws.com/releases/${pkgver}/plasticscm/linux/PlasticSCM-${pkgver}-linux-theme.tar.gz"
)
b2sums=('4e91c474310ea4456996d3f5d818845a423a5613466c5ed581fe2b18c40925be3bdcd94ef9433628dc5285018bf04330a1702447c9af240b5d88ab8f14788633'
        '01455f556a14d03b7f549f09e24651bfb1f09fe8c9bdac434199fad06dc69d43bd5f560b7056dd68f146a690de4d7ff72059a62dfd83811af03a7ad654100e02')

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

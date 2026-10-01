# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-gui
pkgver=11.0.16.10371
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
b2sums=('c2a7c479681af519e8a3dc359b0123f18b5623fcaf0f8305dc5fe1e8968529e110327ae7df604b8e4d86923934348b4b9abb2cb72732973a3e9c53c675afa125'
        '63d7df4b2bc939bbe365a1c06dae1c370653cf5636d3b4ff75829ed7997f9d4bd8ea378d0e4f37ac5a295f76550ebcfc551a9aee23d677d2153dd443d1a5953e')

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

# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-gui
pkgver=11.0.16.10042
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
b2sums=('57ece899f3cfd957c6329bd5553223459425d92ea4c65c8a859530c6c264fc14eb8eaa35eaa9d98530fbecf12daaabc12b7d44d5ca28248cb2dd6edb5f5357ee'
        'a89f6e5033332db7498587a0a1143daaf9d1efcf4c9c808c1753c870fa76ade54b6ad7c579f82749707ccf7f4d6ff47be973eddca9a434700bd840f94254146e')

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

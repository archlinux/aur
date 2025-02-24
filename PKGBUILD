# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-gui
pkgver=11.0.16.9213
pkgrel=1
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
    '58e470b2eebb556cdf22701bb746040f8717a9eac65291311a42ca30dbd9725ac633d5e6cb60e5de29f1d854a664e330529145e2ab7b3183d486976bc6f292b3'
    'c3da2737205000ff4fe1f9142a4040e65c3dbf09e267923eda751ff56e74ad7e478c19829de6f7d72d1c533a739eb6c5eeb9853c85f15cb349b71956d780c42a'
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

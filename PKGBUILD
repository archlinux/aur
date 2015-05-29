# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>
# Contributor: Greg Maslov <maslov@cs.unc.edu>

pkgbase="wfdb"
pkgname=('wfdb' 'wfdb-samples')
pkgver="10.5.23"
pkgrel="2"
pkgdesc="Software from PhysioNet for viewing, analyzing, and creating recordings of physiologic signals"
url="http://www.physionet.org/physiotools/wfdb.shtml"
license=('GPL')
arch=('i686' 'x86_64')
depends=('curl>=7.10' 'expat')
optdepends=('wfdb-samples')
makedepends=('gcc' 'chrpath')
install="${pkgname}.install"
changelog="ChangeLog"
source=("http://www.physionet.org/physiotools/${pkgname}.tar.gz")
md5sums=('0c4dd0bc86408709fe2364f6703c5c66')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    ./configure --prefix=/usr

    # One of this variable is causing problem, no idea which or why
    unset CHOST COMMAND_MODE CPPFLAGS CXXFLAGS MAKEFLAGS

    make

    builddir="${srcdir}/${pkgname}-${pkgver}/build"

    # Adapt some compile-time hardcoded paths
    sed -i "s+${builddir}+/usr/share/wfdb+g" \
        "${builddir}/bin/setwfdb" \
        "${builddir}/bin/cshsetwfdb"
    sed -i "s+${builddir}+/usr+g" \
        "${builddir}/bin/hrfft"\
        "${builddir}/bin/hrlomb"\
        "${builddir}/bin/hrmem"\
        "${builddir}/bin/hrplot"

    # Remove RPATH and RUNPATH from executables
    for ex in `find "${builddir}/bin/" -exec file {} \; | grep ELF | cut -d':' -f1`;
    do
        chrpath -d "$ex"
    done
}

package_wfdb() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    mkdir -p "${pkgdir}/usr"
    cp -R "build/bin" "${pkgdir}/usr/"
    cp -R "build/include" "${pkgdir}/usr/"
    cp -R "build/lib" "${pkgdir}/usr/"
    cp -R "build/lib64" "${pkgdir}/usr/"
    cp -R "build/share" "${pkgdir}/usr/"
}

package_wfdb-samples() {
    arch=('any')
    unset depends
    unset optdepends
    unset install

    cd "${srcdir}/${pkgbase}-${pkgver}"

    mkdir -p "${pkgdir}/usr/share/wfdb"
    cp -R "build/database" "${pkgdir}/usr/share/wfdb/"
}

# vim:set ts=4 sw=4 et:

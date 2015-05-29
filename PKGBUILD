# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

_pkgname='wfdb'
pkgname="lib32-${_pkgname}"
pkgver="10.5.23"
pkgrel="2"
pkgdesc="Software from PhysioNet for viewing, analyzing, and creating recordings of physiologic signals"
url="http://www.physionet.org/physiotools/wfdb.shtml"
license=('GPL')
arch=('x86_64')
depends=('lib32-curl>=7.10' 'lib32-expat')
provides=('wfdb')
conflicts=('wfdb')
optdepends=('wfdb-samples')
makedepends=('gcc-multilib' 'chrpath')
install="${_pkgname}.install"
changelog="ChangeLog"
source=("http://www.physionet.org/physiotools/${_pkgname}.tar.gz")
md5sums=('0c4dd0bc86408709fe2364f6703c5c66')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./configure --prefix=/usr

    # One of this variable is causing problem, no idea which or why
    unset CHOST COMMAND_MODE CPPFLAGS CXXFLAGS MAKEFLAGS

    make MFLAGS='-m32'

    builddir="${srcdir}/${_pkgname}-${pkgver}/build"

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

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    mkdir -p "${pkgdir}/usr"
    cp -R "build/bin" "${pkgdir}/usr/"
    cp -R "build/include" "${pkgdir}/usr/"
    cp -R "build/lib" "${pkgdir}/usr/lib32"
    cp -R "build/share" "${pkgdir}/usr/"

    # Why? Why 64???
    cp -R build/lib64/* "${pkgdir}/usr/lib32"
}

# vim:set ts=4 sw=4 et:

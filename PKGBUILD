# Maintainer:  bb010g <bb010g at gmail dot com>
# Contributor: kjslag <kjslag at gmail dot com>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: Anish Tondwalkar <anish@tjhsst.edu>
# Contributor: Ghost91 <m_graeb11@cs.uni-kl.de>
# Contributor: teratomata <teratomat@gmail.com>

pkgname=mathematica-09
pkgver=9.0.1
pkgrel=1
pkgdesc="A computational software program used in scientific, engineering, and mathematical fields and other areas of technical computing, version 9.0.1."
arch=('i686' 'x86_64')
url="http://www.wolfram.com/mathematica/"
license=('proprietary')
depends=(
    # Divined from namecap library names, pkgfile, and `find`ing in pkgdir.
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glib2'
    'glibc'
    'libx11'
    'libxcursor'
    'libxext'
    'libxfixes'
    'libxi'
    'libxmu'
    'libxrender'
    'ncurses'
)
optdepends=(
    'alsa-lib'
    'cuda'
    'libxrandr'
    'libxtst'
    'r'
    'unixodbc'
)
source=("file://Mathematica_${pkgver}_LINUX.sh")
md5sums=('7fcbc4d1488757b10ef07740ac30a580')
install='mathematica-09.install'
options=('!strip')

PKGEXT=".pkg.tar"

# To build this package you need to place the mathematica-installer into your startdir
# If you don't own the installer you can download a trial version at http://www.wolfram.com/mathematica/trial

build() {
    if [[ `echo "${srcdir}" | wc -w` -ne 1 ]]
    then   echo
           echo "ERROR: The Mathematica installer doesn't support directory names with spaces. Try building from a directory without spaces."
           echo "current build directory: ${srcdir}"
           false
    fi
    
    chmod +x ${srcdir}/Mathematica_${pkgver}_LINUX.sh
}

package() {
    ${srcdir}/Mathematica_${pkgver}_LINUX.sh -- -execdir=${pkgdir}/usr/bin -targetdir=${pkgdir}/opt/mathematica-09 -auto
    
    echo "Fixing symbolic symlinks"
    cd ${pkgdir}/usr/bin
    rm *
    ln -s /opt/mathematica-09/Executables/math
    ln -s /opt/mathematica-09/Executables/mathematica
    ln -s /opt/mathematica-09/Executables/Mathematica
    ln -s /opt/mathematica-09/Executables/mcc
    ln -s /opt/mathematica-09/Executables/MathKernel
    if [ "${CARCH}" = "x86_64" ]; then
        ln -s /opt/mathematica-09/SystemFiles/Kernel/Binaries/Linux-x86-64/MathematicaScript
    else
        ln -s /opt/mathematica-09/SystemFiles/Kernel/Binaries/Linux/MathematicaScript
    fi

    echo "Copying menu and mimetype information..."
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/desktop-directories
    mkdir -p ${pkgdir}/usr/share/mime/packages

    cd ${pkgdir}/opt/mathematica-09/SystemFiles/Installation

    cp wolfram-mathematica.desktop ${pkgdir}/usr/share/applications/wolfram-mathematica09.desktop
    cp wolfram-all.directory ${pkgdir}/usr/share/desktop-directories/
    cp *.xml ${pkgdir}/usr/share/mime/packages/

    echo "Copying icons..."
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/{32x32,64x64,128x128}/{apps,mimetypes}
    cd ${pkgdir}/opt/mathematica-09/SystemFiles/FrontEnd/SystemResources/X
    for i in "32" "64" "128"; do
        cp Mathematica-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-mathematica.png
        cp MathematicaPlayer-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-mathematicaplayer.png
        cp vnd.wolfram.cdf-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.cdf.png

        cp MathematicaDoc-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-mathematica.png
        cp MathematicaPlayerDoc-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-mathematicaplayer.png
        cp vnd.wolfram.cdfDoc-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.cdf.png

        cp MathematicaDoc-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/gnome-mime-application-mathematica.png
        cp MathematicaPlayerDoc-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/gnome-mime-application-mathematicaplayer.png
        cp vnd.wolfram.cdfDoc-${i}.png ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/gnome-mime-application-vnd.wolfram.cdf.png
    done

    echo "Copying manpages..."
    mkdir -p ${pkgdir}/usr/share/man/man1
    cd ${pkgdir}/opt/mathematica-09/SystemFiles/SystemDocumentation/Unix
    cp *.1 ${pkgdir}/usr/share/man/man1

    echo "Fixing file permissions..."
    chmod go-w -R ${pkgdir}/*

    echo "Done."
}

# vim:set ts=2 sw=2 et:

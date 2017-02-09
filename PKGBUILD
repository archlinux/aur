# Maintainer:  kjslag <kjslag at gmail dot com>
# Contributor: Michael Pusterhofer <pusterhofer at student dot tugraz dot at>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: Anish Tondwalkar <anish@tjhsst.edu>
# Contributor: Ghost91 <m_graeb11@cs.uni-kl.de>
# Contributor: teratomata <teratomat@gmail.com>
# Contributor: Joshua Ellis <josh@jpellis.me>

pkgname=mathematica
pkgver=11.0.1
pkgrel=1
pkgdesc="A computational software program used in scientific, engineering, and mathematical fields and other areas of technical computing."
arch=('i686' 'x86_64')
url="http://www.wolfram.com/mathematica/"
license=('proprietary')
depends=('ttf-bitstream-vera' 'libxcursor' 'alsa-lib' 'libxml2')
optdepends=('mesa-demos: glxinfo for "fully optimized graphics capabilities"') # without glxinfo, Mathematica outputs a warning to the terminal on startup
source=("local://Mathematica_${pkgver}_LINUX.sh")
md5sums=('444f096c9e058d8a4f8555c06ccc0233')
install='mathematica.install'
options=('!strip')

PKGEXT=".pkg.tar"

# To build this package you need to place the mathematica-installer into your startdir
# If you don't own the installer you can download a trial version at http://www.wolfram.com/mathematica/trial

prepare() {
    if df "${srcdir}" | grep -q tmpfs; then
        warning "Building Mathematica takes more than 8GB of space."
        warning "Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work."
    fi

    if [[ $(echo "${srcdir}" | wc -w) -ne 1 ]]; then
        echo "ERROR: The Mathematica installer doesn't support directory names with spaces."
        echo "Try building from a directory without spaces."
        echo "Current build directory: ${srcdir}"
        false
    fi

    chmod +x ${srcdir}/Mathematica_${pkgver}_LINUX.sh
}

package() {
    # https://reference.wolfram.com/language/tutorial/InstallingMathematica.html#650929293
    ${srcdir}/Mathematica_${pkgver}_LINUX.sh -- \
             -execdir=${pkgdir}/usr/bin \
             -targetdir=${pkgdir}/opt/Mathematica \
             -auto # -user

    echo "Fixing symbolic links"
    cd ${pkgdir}/usr/bin
    rm *
    ln -s /opt/Mathematica/Executables/math
    ln -s /opt/Mathematica/Executables/mathematica
    ln -s /opt/Mathematica/Executables/Mathematica
    ln -s /opt/Mathematica/Executables/MathKernel
    ln -s /opt/Mathematica/Executables/mcc
    ln -s /opt/Mathematica/Executables/wolfram
    ln -s /opt/Mathematica/Executables/WolframKernel

    echo "Linking MathematicaScript"
    if [ "${CARCH}" = "x86_64" ]; then
        ln -s /opt/Mathematica/SystemFiles/Kernel/Binaries/Linux-x86-64/MathematicaScript
        ln -s /opt/Mathematica/SystemFiles/Kernel/Binaries/Linux-x86-64/wolframscript
    else
        ln -s /opt/Mathematica/SystemFiles/Kernel/Binaries/Linux/MathematicaScript
        ln -s /opt/Mathematica/SystemFiles/Kernel/Binaries/Linux/wolframscript
    fi

    echo "Copying menu and mimetype information"
    mkdir -p ${pkgdir}/usr/share/applications
    mkdir -p ${pkgdir}/usr/share/desktop-directories
    mkdir -p ${pkgdir}/usr/share/mime/packages

    cd ${pkgdir}/opt/Mathematica/SystemFiles/Installation

    desktopFile='wolfram-mathematica11.desktop'
    sed -Ei 's|^(\s*TryExec=).*|\1/usr/bin/Mathematica|g' $desktopFile
    sed -Ei 's|^(\s*Exec=).*|\1/usr/bin/Mathematica %F|g' $desktopFile
    cp $desktopFile ${pkgdir}/usr/share/applications/
    echo -e 'Categories=Science;Math;NumericalAnalysis;DataVisualization;' >> ${pkgdir}/usr/share/applications/$desktopFile

    cp wolfram-all.directory ${pkgdir}/usr/share/desktop-directories/
    cp *.xml ${pkgdir}/usr/share/mime/packages/

    echo "Copying icons"
    mkdir -p ${pkgdir}/usr/share/icons/hicolor/{32x32,64x64,128x128}/{apps,mimetypes}
    cd ${pkgdir}/opt/Mathematica/SystemFiles/FrontEnd/SystemResources/X
    for i in "32" "64" "128"; do
        cp App-${i}.png \
           ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/wolfram-mathematica.png
        cp vnd.wolfram.cdf-${i}.png \
           ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.cdf.png
        cp vnd.wolfram.mathematica.package-${i}.png \
           ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.mathematica.package.png
        cp vnd.wolfram.nb-${i}.png \
           ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.nb.png
        cp vnd.wolfram.player-${i}.png \
           ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.player.png
        cp vnd.wolfram.wl-${i}.png \
           ${pkgdir}/usr/share/icons/hicolor/${i}x${i}/mimetypes/application-vnd.wolfram.wl.png
    done

    echo "Copying man pages"
    mkdir -p ${pkgdir}/usr/share/man/man1
    cd ${pkgdir}/opt/Mathematica/SystemFiles/SystemDocumentation/Unix
    cp *.1 ${pkgdir}/usr/share/man/man1

    echo "Fixing file permissions"
    chmod go-w -R ${pkgdir}/*
}

# vim:set ts=2 sw=2 et:


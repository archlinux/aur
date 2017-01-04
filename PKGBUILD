# Maintainer: Michael R. Shannon <mrshannon.aerospace@gmail.com>

## This PKGBUILD installs dependencies, provides desktop icons, and patches a
## currently installed version MATLAB.  It should be installed after a manual
## install of MATLAB and will find the location where MATLAB is installed as
## assuming the executable is on the PATH.  This package should not be used with
## the AUR matlab package by Daniel Shub and Ido Rosen.

## The version of this package will always match the MATLAB ## version numbers
## (of which you can find here
## https://en.wikipedia.org/wiki/MATLAB#Release_history) for which this package
## is intended to support.  Please flag as our of date upon a new MATLAB
## release.

## MATLAB is a commercial product with a paid license, this package does not
## provide MATLAB, it only provides dependencies and fixes to make it run better
## on Arch Linux.

## Much thanks to Daniel Shub and Ido Rosen whose matlab PKGBUILD served as a
## guide when making this one.

pkgname=matlab-support
pkgver=9.1.0
pkgrel=1
pkgdesc='Provides dependencies and common fixes for MATLAB.'
arch=('x86_64')
url='http://www.mathworks.com'
license=(custom)
depends=('libx11'
         'libxext'
         'libxt'
         'jre7-openjdk')
optdepends=('gcc47: For MEX support')
makedepends=('gendesk')
provides=('matlab')
conflicts=('matlab')
install=${pkgname}.install
source=('https://upload.wikimedia.org/wikipedia/commons/2/21/Matlab_Logo.png')
sha512sums=('ba72458379c89b22a27d1d7e357cefae4437fa28caac47b26ccd4f5b01b8cbc2c000baf38b5a52565f29b14e6da922bc3dc14bc5d47fa682fb6871422a59c397')

prepare() {
    msg2 'Creating desktop file'
    gendesk -f -n --pkgname 'matlab' \
        --pkgdesc 'A high-level language for numerical computation and visualization.' \
        --categories 'Development;Education;science;Mathematics;IDE' \
        --exec 'matlab -desktop -nosplash' \
        --mimetypes 'text/x-matlab' \
        "${srcdir}/matlab.desktop" >/dev/null 

    msg2 'Creating command line executable'
    echo -e "#!/bin/sh\nmatlab -nodesktop -nosplash" > "${srcdir}/matlab-cli"

    # If you never let MATLAB connect to the internet or run MATLAB on a server
    # the Java version it includes should be fine but otherwise the outdated
    # Java that ships with MATLAB is a security risk.
    msg2 'Creating profile.d files'
    echo -e "export MATLAB_JAVA=/usr/lib/jvm/java-7-openjdk/jre" > "${srcdir}/matlab.sh"
    echo -e "setenv MATLAB_JAVA /usr/lib/jvm/java-7-openjdk/jre" > "${srcdir}/matlab.csh"
}

package() {
    msg2 'Installing desktop files'
    install -D -m644 "matlab.desktop" "${pkgdir}/usr/share/applications/matlab.desktop"
    install -D -m644 "Matlab_Logo.png" "${pkgdir}/usr/share/pixmaps/matlab.png"

    msg2 'Installing command line executable'
    install -D -m755 'matlab-cli' "${pkgdir}/usr/bin/matlab-cli"
}

# Maintainer: Ashely Roll <ash at digitalnemesis dot com>

pkgname=astrodmx-capture
pkgver=0.86.3
pkgrel=1
pkgdesc="AstroDMx Capture Astronomical Imaging"
arch=('x86_64')
url="https://www.linux-astro-imaging.uk/"
# No licence file available in package, see https://www.linux-astro-imaging.uk/linux/astronomy/linux-downloads
# for details.
license=(custom)
options=(!strip)
install=$pkgname.install

source=("https://www.astrodmx-capture.org.uk/sites/downloads/astrodmx/current/x86-64/astrodmx-glibc-2.30_${pkgver}_x86-64-manual.tar.gz")
sha256sums=("26fec744b1ce169f09e83af9d8385c56b6a3cd4735635c64251579c621afe7b2")

_instdir="/usr/local/AstroDMx_Capture"
_prefix="R-Linux-64-2.30"

package() {
    # create the desitination folder
    mkdir -p "${pkgdir}${_instdir}"

    # copy over the linux 64 bit files
    cp --recursive ${_prefix}/usr/local/AstroDMx_Capture/* "${pkgdir}${_instdir}"

    # copy over the udev rules
    mkdir -p "${pkgdir}/etc/udev/rules.d"
    cp ${_prefix}/etc/udev/rules.d/* "${pkgdir}/etc/udev/rules.d"

    # create a profile file to add an alias for astrodmx
    # this is needed because the application has to be launced from the bin folder
    # to correctly work, so we can't just add the path. sigh.
    # Update V0.78.3: Now have to start with launcher.sh, this does a cd, so will continue
    # to wrap with pushd/popd to not mess up local path
    mkdir -p "${pkgdir}/etc/profile.d"
    echo "alias astrodmx=\"pushd '${_instdir}/bin'; ./AstroDMx-Launcher; popd\"" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}

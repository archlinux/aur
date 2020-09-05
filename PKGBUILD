# Maintainer: Ashely Roll <ash at digitalnemesis dot com>

pkgname=astrodmx-capture
pkgver=0.78.3
pkgrel=1
pkgdesc="AstroDMx Capture Astronomical Imaging"
arch=('x86_64')
url="https://www.linux-astro-imaging.uk/"
# No licence file available in package, see https://www.linux-astro-imaging.uk/linux/astronomy/linux-downloads
# for details.
license=(custom)
options=(!strip)
install=$pkgname.install

source=("https://www.linux-astro-imaging.uk/sites/downloads/astrodmx_capture-${pkgver}-manual-x86_64.tar.gz")
sha256sums=("a4bd110c6fb0b7371491ed3d615894edf8ddf927723bad8e2fe497fc8c748184")

_instdir="/usr/local/AstroDMx_Capture"
_prefix="x86-64-2.29"

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
	echo "alias astrodmx=\"pushd '${_instdir}/bin'; ./launcher.sh; popd\"" > "${pkgdir}/etc/profile.d/${pkgname}.sh"
}


# Maintainer Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="vstax"
_year="2019"
pkgver="${_year}_1.0.6"
pkgrel="272"
pkgdesc="Software to fill the tax forms of the canton of Valais, Switzerland"
url="http://www.vs.ch/vstax"
license=('unknown')
arch=('i686' 'x86_64')
depends=('jdk8' 'shared-mime-info' 'desktop-file-utils')
install="vstax.install"
changelog="ChangeLog"
[ "${CARCH}" = "i686" ] && _CARCH='i386'
[ "${CARCH}" = "x86_64" ] && _CARCH='amd64'
source=("https://sftp.vs.ch/${pkgname}/${_year}/${pkgname}${pkgver}-${pkgrel}_${_CARCH}.deb"
        'archlinux.patch')
sha256sums=('514d534984bac4fdc209056030e11f69130e498167197380ca3859b1d8f8b0c1'
            'd68eae6a3364e0215e76e04e100c05608c9a73f6e1668b0cc0403fd35fef05c1')
[ "${CARCH}" = "x86_64" ] && sha256sums[0]='bcb48b551878d7b653fbe56cf78dc48683ad98d581a94b4f36611ab3877e215e'

prepare() {
    cd "${srcdir}/"

    # Extract the data contained in the `deb` file
    tar -xf data.tar.xz

    # Patch for archlinux
    patch -p2 < archlinux.patch
}

package() {
    cd "${srcdir}/usr/share/"

    # Store application name in a variable
    _appname="${pkgname}${_year}"

    # Copy the application descriptor
    install -D "applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${_appname}.desktop"

    # Copy the application changelog
    install -D "doc/${_appname}/changelog.Debian.gz" "${pkgdir}/usr/share/doc/${_appname}/changelog.Debian.gz"

    # Copy the mime descriptor
    install -D "mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${_appname}.xml"

    # Copy the application itself
    install -d "${pkgdir}/usr/share/java/"
    cp -R "${_appname}" "${pkgdir}/usr/share/java/${_appname}"

    # Move executable to /usr/bin
    install -d "${pkgdir}/usr/bin/"
    mv "${pkgdir}/usr/share/java/${_appname}/${_appname}.sh" "${pkgdir}/usr/bin/${_appname}"

    # Remove the included java environment
    rm -Rf "${pkgdir}/usr/share/java/${_appname}/jre"
}

# vim:set ts=4 sw=4 et:

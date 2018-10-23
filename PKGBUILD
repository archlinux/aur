# Maintainer Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="vstax"
_year="2017"
pkgver="${_year}.1.0.17"
pkgrel="1"
pkgdesc="Software to fill the tax forms of the canton of Valais, Switzerland"
url="http://www.vs.ch/vstax"
license=('unknown')
arch=('i686' 'x86_64')
depends=('jdk8-openjdk' 'shared-mime-info' 'desktop-file-utils')
install="vstax.install"
changelog="ChangeLog"
[ "${CARCH}" = "i686" ] && _CARCH='i386'
[ "${CARCH}" = "x86_64" ] && _CARCH='amd64'
source=("https://sftp.vs.ch/${pkgname}/${_year}/${pkgname}${_year}_${_CARCH}.deb"
        'archlinux.patch')
sha256sums=('cb5e0dbda0aa167e4d9a93819914a65581632557ebadb531e327db9aba7c6675'
            '1b11130669a9be63c68067b356b979ed57f9ee04fd523aa6c411d9333c90a7ee')
[ "${CARCH}" = "x86_64" ] && sha256sums[0]='4c2276e2a0aef5c184f6804c15d3d1336b429b115ab29888769908e75af41baf'

prepare() {
    cd "${srcdir}/"

    # Extract the data contained in the `deb` file
    tar -xzf data.tar.gz

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

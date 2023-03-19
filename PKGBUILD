# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

# Contributors:
# Pierre-Yves Savioz <savioz.py@net-c.com>
# Stéphane Donnet <donnet.stephane@gmail.com>

pkgname="vstax"
_year="2022"
pkgver="${_year}_1.0.4"
pkgrel="65"
pkgdesc="Software to fill the tax forms of the canton of Valais, Switzerland"
url="http://www.vs.ch/vstax"
license=('unknown')
arch=('x86_64')
depends=('java-runtime' 'shared-mime-info' 'desktop-file-utils')
install="vstax.install"
changelog="ChangeLog"
source=("https://sftp.vs.ch/${pkgname}/${_year}/${pkgname}${pkgver}-${pkgrel}_amd64.deb"
        "archlinux.patch")
sha256sums=('c4eb50859d91ea134e26358716d1ce9e740821cf44a480ead602d8b35295a39f'
            '65d318828d2a993056c0b405452f7d5fd0c9e9bd1b608b562cc59c297caef9d9')


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

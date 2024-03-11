# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

# Contributors:
# Pierre-Yves Savioz <savioz.py@net-c.com>
# Stéphane Donnet <donnet.stephane@gmail.com>

pkgname="vstax"
_year="2023"
pkgver="${_year}_1.0.3"
pkgrel="86"
pkgdesc="Software to fill the tax forms of the canton of Valais, Switzerland"
url="http://www.vs.ch/vstax"
license=('unknown')
arch=('x86_64')
depends=('java-runtime' 'shared-mime-info' 'desktop-file-utils' 'libxrender' 'libxtst' 'fontconfig')
install="vstax.install"
changelog="ChangeLog"
source=("https://sftp.vs.ch/${pkgname}/${_year}/${pkgname}${pkgver}-${pkgrel}_amd64.deb"
        "archlinux.patch")
sha256sums=('80e68b477510a7402c39aa2ddd1ecb5be70721b7612ff955bf679e9073a916d1'
            'b0e77a6dbe4164a992a3670779e3c1a3bffd4f088f1be8170160235a76bee6b1')


prepare() {
    cd "${srcdir}/"

    # Extract the data contained in the `deb` file
    tar -xf data.tar.zst

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

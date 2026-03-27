# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

# Contributors:
# Pierre-Yves Savioz <savioz.py@net-c.com>
# Stéphane Donnet <donnet.stephane@gmail.com>

pkgname="vstax"
_year="2025"
_upstream_version="1.0.3"
_upstream_release="139"
pkgver="${_year}_${_upstream_version}_${_upstream_release}"
pkgrel="2"
pkgdesc="Software to fill the tax forms of the canton of Valais, Switzerland"
url="http://www.vs.ch/vstax"
license=('unknown')
arch=('x86_64')
depends=('java-runtime' 'shared-mime-info' 'desktop-file-utils' 'libxrender' 'libxtst' 'fontconfig')
install="vstax.install"
changelog="ChangeLog"
source=("https://sftp.vs.ch/${pkgname}/${_year}/${pkgname}${_year}_${_upstream_version}-${_upstream_release}_amd64.deb"
        "archlinux.patch")
sha256sums=('9490599c06b3afbf39f6a59aeefe65145f37f6c32f1dd84b4216487a11a3de2a'
            '45e6fe971c1f81f4c3ac14f185938cc751270a6132fd5099f6df6ac9a7ee7c97')

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

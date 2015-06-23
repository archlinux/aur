#Maintainer: Sämy Zehnder <saemy@gorrion.ch>

pkgname='smssender-gui'
pkgver=3.3.1
_ubuntuver='0ubuntu2'
pkgrel=1
pkgdesc="Fast and easy-to-use client for sending sms over internet gateways"
arch=('i686' 'x86_64')
url="http://smssender.gorrion.ch"
license=('GPL')
depends=('crypto++' 'qjson' 'qrencode' 'qt4')
provides=('smssender-gui')
conflicts=('smssender-gui')

package() {
    # Downloads the package files from the ubuntu repository.

    # Some settings.
    _url_prefix="https://launchpad.net/~saemy-zehnder/+archive/ppa/+files"
    _gateways="coopmobile ethz post smartphone sunrise"

    # Checks for which architecture files should be downloaded.
    _filearch=i386
    [ "${CARCH}" == "x86_64" ] && _filearch=amd64

    # Downloads and installs the packages.
    _packages="smssender-gui $(echo $_gateways | sed "s/\b\(\w\)/smssender-gateway-\1/g")"
    for _package in $_packages; do
        _file="${_package}_${pkgver}-${_ubuntuver}_${_filearch}.deb"
        wget "${_url_prefix}/$_file"

        ar x $_file
        tar xJf data.tar.xz -C "$pkgdir"
    done

    # Removes unused files & directories.
    rm -Rf $pkgdir/usr/share/menu
    rm -f $pkgdir/usr/share/doc/*/changelog.Debian.gz
}

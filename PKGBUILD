# Maintainer:  Yamada Hayao <hayao@fascode.net>

_pkgname=filezilla
pkgname="$_pkgname-bin"
pkgver=3.50.0
pkgrel=2
pkgdesc='Free, open source FTP, FTPS and SFTP client'
arch=('i686' 'x86_64')
url='https://filezilla-project.org'
license=('GPL')
depends=('pugixml' 'wxgtk3' 'xdg-utils' 'gmp' 'gnutls' 'nettle' 'sqlite')
makedepends=('curl')
provides=("$_pkgname")
conflicts=("$_pkgname")

machine_arch=$(uname -m)

source=(
    "FileZilla_${pkgver}_${machine_arch}-linux-gnu.tar.bz2::https://download.filezilla-project.org/client/FileZilla_${pkgver}_${machine_arch}-linux-gnu.tar.bz2"
)

sha512sums=(
    "$(
        _url="https://download.filezilla-project.org/client/FileZilla_${pkgver}.sha512"
        _sum=$(curl --silent -L "${_url}" | grep "FileZilla_${pkgver}_${machine_arch}-linux-gnu.tar.bz2" | awk '{print $1}')
        if [[ ! "${?}" = 0 ]] || [[ ! -v "_sum" ]]; then
            echo -n "SKIP"
        else
            echo -n "${_sum}"
        fi
    )"
)

package() {
    # filezilla
    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/"
    cp -r "${srcdir}/FileZilla3/bin/"* "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/FileZilla3/share/"* "${pkgdir}/usr/share/"

    # libfilezilla
    mkdir -p "${pkgdir}/usr/lib/"
    cp -r "${srcdir}/FileZilla3/lib/"* "${pkgdir}/usr/lib/"

    # remove conflict files
    rm -rf "${pkgdir}/usr/lib/libgmp."*
    rm -rf "${pkgdir}/usr/lib/libgnutls."*
    rm -rf "${pkgdir}/usr/lib/libhogweed."*
    rm -rf "${pkgdir}/usr/lib/libnettle."*
    rm -rf "${pkgdir}/usr/lib/libsqlite3."*

    chmod -R 755 "${pkgdir}/usr/"
}


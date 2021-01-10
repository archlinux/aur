# Maintainer:  Yamada Hayao <hayao@fascode.net>

_pkgname=filezilla
pkgname="$_pkgname-bin"
pkgver=3.52.0.5
pkgrel=2
pkgdesc='Free, open source FTP, FTPS and SFTP client (Pre-built binary)'
arch=('i686' 'x86_64')
url='https://filezilla-project.org'
license=('GPL')
depends=('pugixml' 'wxgtk3' 'xdg-utils' 'gmp' 'gnutls' 'nettle' 'sqlite')
makedepends=('curl')
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git" "libfilezilla")
machine_arch="${CARCH}"

for _arch in ${arch[@]}; do
    eval "source_${_arch}=(FileZilla_${pkgver}_${_arch}-linux-gnu.tar.bz2::https://download.filezilla-project.org/client/FileZilla_${pkgver}_${_arch}-linux-gnu.tar.bz2)"
    eval "sha512sums_${_arch}=(
        '$(
            _url="https://download.filezilla-project.org/client/FileZilla_${pkgver}.sha512"
            _sum="$(curl --silent -L "${_url}" | grep "FileZilla_${pkgver}_${_arch}-linux-gnu.tar.bz2")"
            if [[ ! "${?}" = 0 ]] || [[ ! -v "_sum" ]] || [[ -z "${_sum}" ]]; then
                echo -n "SKIP"
            else
                echo -n "$(echo "${_sum}" | cut -d ' ' -f 1)"
            fi
        )'
    )"
done

package() {
    rm -rf "${srcdir}/FileZilla_${pkgver}_${machine_arch}-linux-gnu.tar.bz2"
    mkdir -p "${pkgdir}/opt/" "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/"* "${pkgdir}/opt/"

    mv "${pkgdir}/opt/FileZilla3/share" "${pkgdir}/usr/"

    local _fullpath _filename _make_link
    function _make_link () {
        ln -s "${1}" "${2}"
        echo "Created symlink ${1} -> ${2}"
    }
    for _fullpath in "${pkgdir}/opt/FileZilla3/bin/"* ;do
        _filename="$(basename "${_fullpath}")"
        _make_link "/opt/FileZilla3/bin/${_filename}"  "${pkgdir}/usr/bin/${_filename}" 
    done
}

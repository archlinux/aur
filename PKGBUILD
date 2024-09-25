# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='borgit'
_pkgverUpstream="0.1.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="Write your Borg backup jobs with sourced bash configuration files"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/borgit/'
license=('GPL3')
depends=('bash' 'borg' 'coreutils' 'findutils')
source=("https://www.eomanis.dedyn.io/permshare/borgit/borgit-${_pkgverUpstream}.tar.gz")
sha384sums=('e508c3cf6f7a611ef8154c8c4e5faa4e124c8da5998f8ea1c4910269f8e657aab045aa88a94f885e489843a1f7fb3347')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

    # Place the main bash scripts into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin" || return 1
    cp -t . "${srcRootDir}/borgit"
    chmod u=rwx,go=rx "borgit"
    cp -t . "${srcRootDir}/borgem"
    chmod u=rwx,go=rx "borgem"

    # Gzip and place the manual pages
    mkdir -p "${pkgdir}/usr/share/man"
    cd "${pkgdir}/usr/share/man" || return 1
    mkdir "man1"
    cd "man1" || return 1
    gzip --fast --to-stdout - < "${srcRootDir}/borgit.1" > "borgit.1.gz"
    gzip --fast --to-stdout - < "${srcRootDir}/borgem.1" > "borgem.1.gz"
    cd - > /dev/null || return 1
    chmod -R u=rwX,go=rX .
}

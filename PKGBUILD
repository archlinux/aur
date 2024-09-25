# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='disk-test'
_pkgverUpstream="0.2.4"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="Block device read-write test utility written in bash"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/disk-test/'
license=('GPL3')
depends=('bash' 'coreutils' 'diffutils' 'grep' 'openssl' 'pv' 'sed' 'util-linux')
source=("https://www.eomanis.dedyn.io/permshare/disk-test/disk-test-${_pkgverUpstream}.tar.gz")
sha384sums=('fbc1d7bfa68ac88b0b122eca8192ef5721b37337c3df70194b2fb1eed0607257beeeb6d86249d4902c932f0eb1917b37')

package() {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

    # Place the main bash script into /usr/bin
    mkdir -p "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin" || return 1
    cp -t . "${srcRootDir}/disk-test"
    chmod u=rwx,go=rx "disk-test"

    # Gzip and place the manual page
    mkdir -p "${pkgdir}/usr/share/man"
    cd "${pkgdir}/usr/share/man" || return 1
    mkdir "man1"
    gzip --fast --to-stdout - < "${srcRootDir}/disk-test.1" > "man1/disk-test.1.gz"
    chmod -R u=rwX,go=rX .
}

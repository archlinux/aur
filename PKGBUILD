# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='disk-test'
_pkgverUpstream="0.4.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=2
pkgdesc="Block device read-write test utility written in bash"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/disk-test/'
license=('GPL-3.0-only')
depends=('bash' 'coreutils' 'diffutils' 'grep' 'openssl' 'pv' 'sed' 'util-linux')
source=("https://www.eomanis.dedyn.io/permshare/disk-test/disk-test-${_pkgverUpstream}.tar.gz"
        "https://www.eomanis.dedyn.io/permshare/disk-test/disk-test-${_pkgverUpstream}.tar.gz.asc")
sha384sums=('6d63707c3aa1ceaa8c318c27af268e4af0acd30c64bdc632732d83b16d9a893b18e601d3aa3ae05a7b283f6f3aba0094'
            'SKIP')
validpgpkeys=('F57637E9E5C28F91EE64277B603EEF8FE0A99498') # eomanis <eomanis at web dot de>

package() {
	local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

	# Create a bunch of directories
	install --mode=u=rwx,go=rx --directory \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/usr/share/man/man1"

	# Place the main bash script into /usr/bin
	install --mode=u=rwx,go=rx	--target-directory="${pkgdir}/usr/bin"	"${srcRootDir}/disk-test"

	# Gzip and place the manual page
	gzip --fast --to-stdout - < "${srcRootDir}/disk-test.1" > "${pkgdir}/usr/share/man/man1/disk-test.1.gz"
	find "${pkgdir}/usr/share/man" -mindepth 2 -maxdepth 2 -name '*.gz' -type f -exec chmod u=rw,go=r '{}' '+'
}

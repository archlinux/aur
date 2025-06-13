# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='disk-test'
_pkgverUpstream="0.3.0"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Block device read-write test utility written in bash"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/disk-test/'
license=('GPL-3.0-only')
depends=('bash' 'coreutils' 'diffutils' 'grep' 'openssl' 'pv' 'sed' 'util-linux')
source=("https://www.eomanis.dedyn.io/permshare/disk-test/disk-test-${_pkgverUpstream}.tar.gz")
sha384sums=('f4a80af2fb8ea17283cf75e66ccadaa2fd67bf7cea8151bab1c7fc820bf4fad43d0dc346f6e2d8273bd730ff21abfc75')

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

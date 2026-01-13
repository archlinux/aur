# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='coturn-babysitter'
_pkgverUpstream="0.0.3"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="coturn configuration rewriter and service reloader"
arch=('any')
url='https://www.eomanis.dedyn.io/permshare/coturn-babysitter/'
license=('GPL-3.0-only')
depends=('python>=3.13' 'python-dnspython')
source=("https://www.eomanis.dedyn.io/permshare/coturn-babysitter/coturn-babysitter-${_pkgverUpstream}.tar.gz")
sha384sums=('bb25634191e2053a83de6493a74eacf9de3d68048a34fbda67f6cd982d2e6b84965c088dad4e29803f45d2558324cbf0')

package () {
    local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

	# Create a bunch of directories
	install --mode=u=rwx,go=rx --directory \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/etc/coturn-babysitter" \
		"${pkgdir}/usr/lib/systemd/system" \
		"${pkgdir}/usr/lib/systemd/system/coturn-babysitter.d"

	# Place some files
	install --mode=u=rwx,go=rx --target-directory="${pkgdir}/usr/bin" -- \
		"${srcRootDir}/coturn-babysitter"
	install --mode=u=rw,go=r --target-directory="${pkgdir}/etc/coturn-babysitter" -- \
		"${srcRootDir}/turnserver.conf.template.example"
	install --mode=u=rw,go=r --target-directory="${pkgdir}/usr/lib/systemd/system" -- \
		"${srcRootDir}/systemd/coturn-babysitter.service" \
		"${srcRootDir}/systemd/coturn-babysitter.timer"
	install --mode=u=rw,go=r --target-directory="${pkgdir}/usr/lib/systemd/system/coturn-babysitter.d" -- \
	    "${srcRootDir}/systemd/custom.conf.example"
}

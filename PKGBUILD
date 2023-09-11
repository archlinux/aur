# shellcheck shell=bash
# shellcheck disable=SC2034  # Various variables that are used by makepkg
# shellcheck disable=SC2154  # Various variables that are provided by makepkg
# Maintainer: eomanis at web dot de

pkgname='yabddnsd'
_pkgverUpstream="0.10.1"
pkgver="${_pkgverUpstream//-/.}"
pkgrel=1
pkgdesc="Yet another bash dynamic DNS daemon"
arch=('any')
url='https://eomanis.duckdns.org/permshare/yabddnsd/'
license=('GPL3')
depends=('bash>=4.4' 'bc' 'bind-tools' 'coreutils' 'findutils' 'grep' 'iproute2' 'sed' 'wget')
optdepends=('miniupnpc: Detection of public IPv4 address using UPnP')
replaces=('freedns-maintain-ip')
source=("https://eomanis.duckdns.org/permshare/yabddnsd/yabddnsd-${_pkgverUpstream}.tar.gz")
sha384sums=('811122eabe671a5a00efb09ff35f9bc5b57c1592ffe7d66776897e82a9957b99c6e8e759561308c782e1bf944bdd3ce4')

package() {
	local srcRootDir="${srcdir}/${pkgname}-${_pkgverUpstream}"

	# Create the required directories
	install --mode=u=rwx,go=rx --directory \
		"${pkgdir}/usr/bin" \
		"${pkgdir}/usr/lib/systemd/system" \
		"${pkgdir}/usr/share/man/man8"

	# Place the files
	install --mode=u=rwx,go=rx --target-directory="${pkgdir}/usr/bin"                "${srcRootDir}/yabddnsd"
	install --mode=u=rw,go=r   --target-directory="${pkgdir}/usr/lib/systemd/system" "${srcRootDir}/systemd/yabddnsd@.service"
	# Gzip and place the manual pages
	gzip --fast --to-stdout - < "${srcRootDir}/yabddnsd.8"                 > "${pkgdir}/usr/share/man/man8/yabddnsd.8.gz"
	gzip --fast --to-stdout - < "${srcRootDir}/systemd/yabddnsd.service.8" > "${pkgdir}/usr/share/man/man8/yabddnsd.service.8.gz"
	chmod -R u=rwX,go=rX "${pkgdir}/usr/share/man/man8"
}

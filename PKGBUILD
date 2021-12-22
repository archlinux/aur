# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='passwords'
_upstreamver='2021.12.20-13229'
_upstreamver_regex='^[0-9][0-9][0-9][0-9]\.[0-9]+\.[0-9]+-[0-9]+$'
_source_type='custom'
_upstreamver_check() {
	# For upstream update checking - package maintainer helper

	# Receive json info about available nextcloud apps
	# and extract current version and jobid of downloadable artifact
	_nextcloud_server_version="$(pacman -Si nextcloud | grep Version | rev | cut -d' ' -f1 | rev | cut -d- -f1)"
	curl "https://apps.nextcloud.com/api/v1/platform/${_nextcloud_server_version}/apps.json" 2>/dev/null | \
	jq -r '[.[] | select(.id == "passwords") | .releases[] | select(.isNightly == false)] | .[0].version, .[0].download' | \
	{
		read -r _ver
		read -r _artifact_url
		printf '%s-%s' "${_ver}" "$(cut -d/ -f 8 <<< "${_artifact_url}")"
	}
}


pkgdesc='Easy to use yet feature-rich and secure password manager for Nextcloud'
pkgname=('nextcloud-app-passwords')
pkgver="${_upstreamver%-*}"
_jobid="${_upstreamver##*-}"
pkgrel=1
arch=('any')
license=('AGPL3')
url="https://apps.nextcloud.com/apps/passwords"
makedepends=()
depends=('nextcloud')
options=('!strip')
source=("${_nextcloud_appname}-v${pkgver}.tar.gz::https://git.mdns.eu/nextcloud/passwords/-/jobs/${_jobid}/artifacts/raw/${_nextcloud_appname}.tar.gz")
sha512sums=('6c99952cad43f7f3ab5e5c2f0cba3af5a1f33d372d84dee3c3bc92e589b8121a94de449480b433c918465a6501f06c683523e663ba41341768d624521db59d37')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

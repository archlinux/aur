# Maintainer: Anty0 <anty150 at gmail dot com>


# Helper variables for updaurpkg (https://aur.archlinux.org/packages/updaurpkg-git)
_nextcloud_appname='passwords'
_upstreamver='2022.5.20-13944'
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
sha512sums=('bbcc6c61e8aa989fa3ff5642bd00cb0224cfdb570c3981ad84b0265fa6b4b802704ad9def109b9520aa826eafac7af69f9dd1a74de331118065785107df237cb')

package() {
	install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
	cp -a "${srcdir}/${_nextcloud_appname}" "${pkgdir}/usr/share/webapps/nextcloud/apps/${_nextcloud_appname}"
}

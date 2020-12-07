# Maintainer: FirstAirBender <noblechuk5 [at] web [dot] de>

_pkgname='appimagetool'
pkgname="${_pkgname}-continuous"
pkgver=r0.'aaef827'
pkgrel=1
pkgdesc='Package desktop applications as AppImages'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/AppImage/AppImageKit'
license=('MIT')
optdepends=(
	'appstream: install it if you want to use AppStream metadata' 
)
makedepends=(
	curl
	jq
)
provides=(
	"${_pkgname}"
)
options=(
	!strip
)

_appimage=${_pkgname}.appimage
source_x86_64=("${_appimage}::${url}/releases/download/continuous/${_pkgname}-x86_64.AppImage")
source_i686=("${_appimage}::${url}/releases/download/continuous/${_pkgname}-i686.AppImage")
source_aarch64=("${_appimage}::${url}/releases/download/continuous/${_pkgname}-aarch64.AppImage")

sha256sums_x86_64=('SKIP')
sha256sums_i686=('SKIP')
sha256sums_aarch64=('SKIP')

pkgver() {
	curl --silent -H "Accept: application/vnd.github.v3+json" \
		'https://api.github.com/repos/AppImage/AppImageKit/tags' | \
	jq --raw-output '.[] | select(.name=="continuous") | .commit.sha | scan("^\\w{7}") | @sh "r0.\(.)"'
}

package() {
	install --directory "${pkgdir}"/{opt/appimagekit,usr/bin}
	install -vm755 "${_appimage}" --target "${pkgdir}/opt/appimagekit"
	ln --symbolic --relative --verbose \
		"${pkgdir}/opt/appimagekit/${_appimage}" \
		"${pkgdir}/usr/bin/${_pkgname}"
}

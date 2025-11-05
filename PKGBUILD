# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

pkgname=mattermost-plugin-calls
pkgver=1.11.0
pkgrel=1
epoch=1
pkgdesc='enables voice calling and screen sharing functionality in Mattermost channels'
arch=(x86_64)
url="https://github.com/${pkgname%%-*}/$pkgname"
license=(MIT)
makedepends=(jq)
options=(!strip)
_plugin="com.mattermost.${pkgname##*-}"
_archive="$pkgname-v$pkgver-linux-amd64"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz"{,.asc})
sha256sums=('27c9032fd6c00906c752ce9d466012747eb33754a9a76668ccabd144ea9910da'
            'SKIP')
validpgpkeys=(C55881B80F69E863B85AD5D1D1B54B47A5CEFEC4) # Mattermost, Inc. <support@mattermost.com>

# BEGIN boilerplate mattermost plugin version clamping, see also other packages in group
# 1. Call respective function helper in package() *after* cd'ing to the source directory
# 2. Add makedepends+=(jq)
_get_supported_ranges() {
	_plugin_min_mattermost="$(< plugin.json jq -r '.min_server_version')"
}
_mattermost_plugin_package() {
	_get_supported_ranges
	depends+=("mattermost>=${_plugin_min_mattermost:-0}")
}
# END boilerplate mattermost plugin version clamping

package() {
	local _plugins="$pkgdir/var/lib/mattermost/plugins"
	install -dm0755 "$_plugins"
	cp -r "$_plugin" "$_plugins"
	cd "$_plugin"
	_mattermost_plugin_package
}

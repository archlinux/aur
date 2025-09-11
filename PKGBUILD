# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

pkgname=mattermost-plugin-gitlab
pkgver=1.11.0
pkgrel=1
pkgdesc='a GitLab plugin for Mattermost'
arch=(x86_64)
url="https://github.com/${pkgname%%-*}/$pkgname"
license=(Apache-2.0)
makedepends=(jq)
options=(!strip)
_plugin="com.github.manland.$pkgname"
_archive="$pkgname-v$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz"{,.asc})
sha256sums=('a4c2fff9d1e1fafa2d996162a6b9a26acfad7beb4abfe3c90b066bd68f496bb5'
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

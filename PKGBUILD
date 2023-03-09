# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

_plugin=gitlab
pkgname=mattermost-plugin-$_plugin
pkgver=1.6.0
pkgrel=2
pkgdesc='a GitLab plugin for Mattermost'
arch=(x86_64)
url=https://mattermost.gitbook.io/plugin-gitlab
_url="https://github.com/mattermost/$pkgname"
license=(Apache2)
makedepends=(jq)
options=(!strip)
_archive="com.github.manland.$pkgname"
source=("$_url/releases/download/v$pkgver/$_archive-$pkgver.tar.gz")
sha256sums=('a646fe6882a5a29f7c0a04a8d4d9057e84ba64b7a93ec54544d156d4fe75bcac')

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
	cp -r "$_archive" "$_plugins"
	cd "$_archive"
	_mattermost_plugin_package
}

# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

_pkgname=CollaboraOnline
pkgname=mattermost-plugin-collabora
pkgver=1.2.1
pkgrel=1
epoch=1
pkgdesc='integrate Collabora Online so that users can view or edit files directly in the chat'
arch=(x86_64)
url="https://github.com/$_pkgname/${pkgname##*-}-mattermost"
license=(MPL-2.0)
makedepends=(jq)
options=(!strip)
_plugin="com.${_pkgname,,}.mattermost"
_archive="$_plugin-$pkgver"
source=("$url/releases/download/$pkgver/$_archive.tar.gz")
sha256sums=('e1c860b36535807e0cd627f82af02104cb24c40780eeef88014f53245d040ce4')

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

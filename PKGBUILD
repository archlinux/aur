# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

pkgname=mattermost-plugin-matterpoll
_pkgname=${pkgname##*-}
pkgver=1.8.0
pkgrel=1
pkgdesc='Create polls and surveys directly within Mattermost'
arch=(x86_64)
url="https://github.com/$_pkgname/$_pkgname"
license=(MIT)
makedepends=(jq)
options=(!strip)
_plugin="com.github.$_pkgname.$_pkgname"
_archive="$_plugin-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('3917daf9fe4724b6c6fa44672fe5276cbeba88f1fe4bd8e1387741d6fbd1c760')

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

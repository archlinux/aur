# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

_plugin=gitlab
pkgname=mattermost-plugin-$_plugin
pkgver=1.10.0
pkgrel=1
pkgdesc='a GitLab plugin for Mattermost'
arch=(x86_64)
url=https://mattermost.gitbook.io/plugin-gitlab
_url="https://github.com/mattermost/$pkgname"
license=(Apache2)
makedepends=(jq)
options=(!strip)
_app="com.github.manland.$pkgname"
source=("$_url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c19539ee7483b9ea0615f7789edb1770add8ce8fa2f126befec6d195055acc86')

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
	cp -r "$_app" "$_plugins"
	cd "$_app"
	_mattermost_plugin_package
}

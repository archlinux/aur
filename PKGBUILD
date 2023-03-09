# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note the intention of this package is to bulid from source, but I haven't
# gotten it to work yet. Contributions welcome! Temporarily it is installing
# the upstream generated binary version.

_plugin=playbooks
pkgname=mattermost-plugin-$_plugin
pkgver=1.36.0
pkgrel=2
pkgdesc='reliable and repeatable processes using checklists, automation, and retrospectives'
arch=(x86_64)
url="https://github.com/${pkgname%%-*}/$pkgname"
license=(Apache2)
makedepends=(jq)
options=(!strip)
_archive="$_plugin-$pkgver"
source=("$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('9e520bb08d46cf88cf77ceba3230b7f18dd36f5808b1cc3f7ac918a4d1d1f6f7')

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

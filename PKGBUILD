# Maintainer: xpufx <github@xpufx.com>
# Prebuilt companion to paseo-cli-git: same tree (built from upstream/main),
# repacked from our release asset so users skip the npm build.
# _commit pins the upstream commit; _bin_sha pins the prebuilt tarball.

pkgname=paseo-cli-git-bin
pkgver=0.9.2.r2.ge3c853df5
pkgrel=1
_commit='e3c853df58bd38f0c29553454c1cbe49cc391c09'
_bin_sha='5f1a23488a33e5dc3b4a276d7e173a19ffa61644a1969b0ab43f9fc02999babb'
_pkgdesc_base='Command-line interface for controlling Paseo AI coding agents'
pkgdesc='Command-line interface for controlling Paseo AI coding agents (built from main 2026-09-24 @e3c853d)'
arch=('x86_64')
url='https://github.com/getpaseo/paseo/tree/main/packages/cli'
license=('Apache-2.0')
depends=('nodejs>=22' 'bash' 'glibc' 'gcc-libs')
provides=('paseo' 'paseo-cli' 'paseo-cli-git')
conflicts=('paseo' 'paseo-bin' 'paseo-cli' 'paseo-cli-bun' 'paseo-cli-edge' 'paseo-cli-git')
source=("paseo-cli-git-standalone-${pkgver}.tar.gz::https://github.com/xpufx/xpufx-pkgs/releases/download/arch-x86_64-current/paseo-cli-git-standalone-${pkgver}.tar.gz")
sha256sums=("$_bin_sha")
options=('!strip')

package() {
	# Standalone tarball carries the full usr/ tree (wrapper + node_modules
	# + licenses) with paseo-cli-git paths; -bin and -git conflict so they
	# never cohabit. Only the license dir is renamed to this pkgname.
	tar -xzf "paseo-cli-git-standalone-${pkgver}.tar.gz" -C "${pkgdir}"
	if [ -d "${pkgdir}/usr/share/licenses/paseo-cli-git" ]; then
		mv "${pkgdir}/usr/share/licenses/paseo-cli-git" "${pkgdir}/usr/share/licenses/${pkgname}"
	fi
	chmod -R go-w "${pkgdir}/usr" 2>/dev/null || true
	find "${pkgdir}/usr" -type d -exec chmod 755 {} + 2>/dev/null || true
	chown -R root:root "${pkgdir}" 2>/dev/null || true
}

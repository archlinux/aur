# Maintainer: xpufx <github@xpufx.com>
# Prebuilt companion to paseo-cli-git: same tree (built from upstream/main),
# repacked from our release asset so users skip the npm build.
# _commit pins the upstream commit; _bin_sha pins the prebuilt tarball.

pkgname=paseo-cli-git-bin
pkgver=0.9.0.r1.g91d9cf1db
pkgrel=1
_commit='91d9cf1dbd0c095c8971d7e8f1fb73eb60a6a786'
_bin_sha='7581413e84d05f598b885f5638eaaae0e2d7a71a582c10e7cfd3955ec47108f0'
_pkgdesc_base='Command-line interface for controlling Paseo AI coding agents'
pkgdesc='Command-line interface for controlling Paseo AI coding agents (built from main 2026-09-22 @91d9cf1)'
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

# Maintainer: xpufx <github@xpufx.com>
# Prebuilt companion to paseo-cli-git: same tree (built from upstream/main),
# repacked from our release asset so users skip the npm build.
# _commit pins the upstream commit; _bin_sha pins the prebuilt tarball.

pkgname=paseo-cli-git-bin
pkgver=0.8.0.beta.1.r5.gda8c1b5c9
pkgrel=1
_commit='da8c1b5c94e752b01d451645e5fa52aba2c1b2f0'
_bin_sha='0a891a16d7bd0aae42637fe84c63d082fedf61bc9ffa9e2ae01bc2b3626bb856'
_pkgdesc_base='Command-line interface for controlling Paseo AI coding agents'
pkgdesc='Command-line interface for controlling Paseo AI coding agents (built from main 2026-09-08 @da8c1b5)'
arch=('x86_64')
url='https://github.com/getpaseo/paseo/tree/main/packages/cli'
license=('Apache-2.0')
depends=('nodejs>=22' 'bash' 'glibc' 'gcc-libs')
provides=('paseo' 'paseo-cli' 'paseo-cli-git')
conflicts=('paseo' 'paseo-bin' 'paseo-cli' 'paseo-cli-bun' 'paseo-cli-beta' 'paseo-cli-edge' 'paseo-cli-git')
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

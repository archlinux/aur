# Maintainer: Noel Jacob <noeljacob91 at gmail dot com>
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
# Contributor: sh!zeeg (shizeeque@gmail.com) support for non-avx2 CPUs, shell completions.
pkgname=bun-bin
pkgver=1.1.16
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with bundler, transpiler, test runner, and package manager. Includes bunx, shell completions and support for baseline CPUs"
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=('bun')
conflicts=('bun')
sha256sums_x86_64=('e82b9fcbbe84a67a4c0c2246571219d16b5f00b0fa891928efe3538491bdbf96'
	'9b296bcc20090b5ea079dc1bca15913a32246121169bcf54cbdb7384d6f5b32b'
)
sha256sums_aarch64=('fc528238c429f9b2951eb86f50b95a9ae6920bf295be4e2c155104ba8497eb3e'
	'9b296bcc20090b5ea079dc1bca15913a32246121169bcf54cbdb7384d6f5b32b'
)
_baseline=''
_baseline_sha256sums='2bcc23f3aa82615b451c4fedeb248aa3c38527ac9186cc7bce46a0c3569c3618'
if [[ $CARCH == 'x86_64' && $(cat /proc/cpuinfo | grep avx2) = '' ]]; then
	_baseline='-baseline'
	sha256sums_x86_64=${_baseline_sha256sums}
fi
source_x86_64=(
	"bun-x64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64${_baseline}.zip"
	"LICENSE"
)
source_aarch64=(
	"bun-aarch64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip"
	"LICENSE"
)
build() {
	if [ "${CARCH}" == "aarch64" ]; then
		cd "bun-linux-aarch64"
	else
		cd "bun-linux-x64${_baseline}"
	fi
	install -dm755 "completions"
	SHELL=zsh "./bun" completions >"completions/bun.zsh"
	SHELL=bash "./bun" completions >"completions/bun.bash"
	SHELL=fish "./bun" completions >"completions/bun.fish"
}
package() {
	if [ "${CARCH}" == "aarch64" ]; then
		cd "bun-linux-aarch64"
		install -Dm755 "./bun" "${pkgdir}/usr/bin/bun"
	else
		cd "bun-linux-x64${_baseline}"
		install -Dm755 "./bun" "${pkgdir}/usr/bin/bun"
	fi
	# simlink as bunx as in the official install.sh
	ln -s bun "${pkgdir}/usr/bin/bunx"

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 completions/bun.zsh "${pkgdir}/usr/share/zsh/site-functions/_bun"
	install -Dm644 completions/bun.bash "${pkgdir}/usr/share/bash-completion/completions/bun"
	install -Dm644 completions/bun.fish "${pkgdir}/usr/share/fish/vendor_completions.d/bun.fish"
}

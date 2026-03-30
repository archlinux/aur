# Maintainer: Noel Jacob <noeljacob91 at gmail dot com>
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
# Contributor: sh!zeeg (shizeeque@gmail.com) support for non-avx2 CPUs, shell completions.
pkgname=bun-bin
pkgver=1.3.11
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with bundler, transpiler, test runner, and package manager. Includes bunx, shell completions and support for baseline CPUs"
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=('bun')
conflicts=('bun')
options=('!debug')
sha256sums_x86_64=('8611ba935af886f05a6f38740a15160326c15e5d5d07adef966130b4493607ed'
                   'abe346f63414547cdf6b35b7a649a490c728b93d006226156923918a84c0e59b'
                   '9b296bcc20090b5ea079dc1bca15913a32246121169bcf54cbdb7384d6f5b32b')
sha256sums_aarch64=('d13944da12a53ecc74bf6a720bd1d04c4555c038dfe422365356a7be47691fdf'
                    '9b296bcc20090b5ea079dc1bca15913a32246121169bcf54cbdb7384d6f5b32b')
source_x86_64=(
"bun-x64.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64.zip"
"bun-x64-baseline.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-x64-baseline.zip"
"LICENSE"
)
source_aarch64=(
	"bun-aarch64-${pkgver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${pkgver}/bun-linux-aarch64.zip"
	"LICENSE"
)
build() {
	if [ "${CARCH}" == "x86_64" ]; then
    if grep -q avx2 /proc/cpuinfo; then
      _srcdir="bun-linux-x64"
    else
      _srcdir="bun-linux-x64-baseline"
    fi
	else
		_srcdir="bun-linux-aarch64"
	fi
  cd "$srcdir/$_srcdir"
	install -dm755 "completions"
	SHELL=zsh "./bun" completions >"completions/bun.zsh"
	SHELL=bash "./bun" completions >"completions/bun.bash"
	SHELL=fish "./bun" completions >"completions/bun.fish"
}
package() {
	if [ "${CARCH}" == "x86_64" ]; then
    if grep -q avx2 /proc/cpuinfo; then
      _srcdir="bun-linux-x64"
    else
      _srcdir="bun-linux-x64-baseline"
    fi
	else
		_srcdir="bun-linux-aarch64"
	fi
  cd "$srcdir/$_srcdir"
  install -Dm755 "./bun" "${pkgdir}/usr/bin/bun"
	# simlink as bunx as in the official install.sh
	ln -s bun "${pkgdir}/usr/bin/bunx"

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 completions/bun.zsh "${pkgdir}/usr/share/zsh/site-functions/_bun"
	install -Dm644 completions/bun.bash "${pkgdir}/usr/share/bash-completion/completions/bun"
	install -Dm644 completions/bun.fish "${pkgdir}/usr/share/fish/vendor_completions.d/bun.fish"
}

# Maintainer: Noel Jacob <noeljacob91 at gmail dot com>
# Contributor: thdxr (original PKGBUILD)
# Contributor: 37h4n (aarch64 support added by Ethan Reece <aur at ethanreece dot com>)
# Contributor: sh!zeeg (shizeeque@gmail.com) support for non-avx2 CPUs, shell completions.
pkgname=bun-bin
pkgver=1.4.2
pkgrel=1
pkgdesc="All-in-one JavaScript runtime built for speed, with bundler, transpiler, test runner, and package manager. Includes bunx, shell completions and support for baseline CPUs"
arch=('x86_64' 'aarch64')
url="https://github.com/oven-sh/bun"
license=('MIT')
provides=('bun')
conflicts=('bun')
options=('!debug')
sha256sums_x86_64=('36368faef7527875d5ffa52e53cd48021741f2a83eb6208a8dd64068d422a913'
                   'c678040f14fe0440eb839d37cbd0ce4c051a32da72806ac97de6a6aab6bf728f'
                   '9b296bcc20090b5ea079dc1bca15913a32246121169bcf54cbdb7384d6f5b32b')
sha256sums_aarch64=('54328bbc2d9c8e0c9f892c544d66c57a83b84139e34909e5ee81758f1ac8fda7'
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

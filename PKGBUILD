# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=noumena-code-git
pkgver=0.1.0.r14.g20343de6
pkgrel=1
pkgdesc="Noumena Code (ncode) - open-source terminal AI coding agent, optimized for Noumena's inference stack"
arch=('x86_64')
url="https://github.com/noumena-network/code"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'icu' 'openssl')
makedepends=('git' 'bun' 'rust' 'openssl')
provides=('noumena-code')
conflicts=('noumena-code')
# Bun standalone executables append the app bundle + a locator trailer after the
# ELF image; makepkg's default strip rewrites the ELF and breaks that trailer,
# leaving a binary that runs as bare Bun. The output is already stripped.
options=('!strip' '!debug')
source=("$pkgname::git+https://github.com/noumena-network/code.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local _ver
	_ver=$(sed -n 's/.*"version":[[:space:]]*"\([^"]*\)".*/\1/p' package.json | head -1)
	printf '%s.r%s.g%s' "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short=8 HEAD)"
}

prepare() {
	cd "$pkgname"
	bun install --frozen-lockfile
}

build() {
	cd "$pkgname"
	# Compiles the native Rust napi modules then bundles a single-file Bun
	# executable for bun-linux-x64. Upstream's only well-tested target.
	bun run build:external
}

package() {
	cd "$pkgname"
	install -Dm755 .tmp/packages/ncode-*-linux-x64/ncode "$pkgdir/usr/bin/ncode"
}

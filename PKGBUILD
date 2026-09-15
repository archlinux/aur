# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=imfing
_gitname=diffs-cli
_appname=${_gitname%-cli}
pkgname=${_appname}
pkgdesc="Fast, beautiful diffs in a single local binary"

pkgver=0.5.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

provides=("${_appname}")

makedepends=('cargo' 'pnpm')
depends=('glibc' 'libgcc' 'zlib')

options=('!lto' '!strip')

source=("${_appname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('9aff2d45b1c9a0d999e205b3a86564bd14f5541fb6e485dd61ac34e4cb32312c')


prepare() {
	cd "${pkgname}-cli-${pkgver}"

	cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd "${pkgname}-cli-${pkgver}"

	cd "web"
		export PNPM_HOME="$srcdir/.pnpm-home"
		export PATH="$PNPM_HOME:$PATH"

		pnpm install --frozen-lockfile # Installs exact dependencies from pnpm-lock.yaml
		pnpm run build                 # Generates the required 'dist/' folder for RustEmbed
	cd ..

	export CARGO_TARGET_DIR=target
	RUSTFLAGS="$RUSTFLAGS -C opt-level=3 -C target-cpu=native" cargo build --frozen --release
}

check() {
	cd "${pkgname}-cli-${pkgver}"

	export CARGO_TARGET_DIR=target
	cargo test --frozen --release
}

package() {
	cd "${pkgname}-cli-${pkgver}"

	install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

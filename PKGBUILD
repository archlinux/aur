# Maintainer: Juan Roa <hello@juanroa.dev>
pkgname=athas
pkgver=0.11.0
pkgrel=1
pkgdesc="Lightweight code editor built with React, TypeScript, and Tauri"
arch=('x86_64' 'aarch64')
url="https://athas.dev"
license=('AGPL-3.0-or-later')
depends=('gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'openssl' 'webkit2gtk-4.1')
makedepends=('bun' 'cmake' 'npm' 'rust')
conflicts=('athas-bin')
_source_name=athas
source=("${_source_name}-${pkgver}.tar.gz::https://github.com/athasdev/athas/archive/refs/tags/v${pkgver}.tar.gz"
        '0001-add-missing-js-deps-and-swift-cli-override.patch'
        '0002-add-packaging-tree-sitter-bootstrap-script.patch')
sha256sums=('ffbc07f49825dd463bf6d1c3b90213eb11c12e58fbdf7c28f567406fa91fd434'
            '05b94eeed03e6631b704b91206df3529a391f74317b0fcb3897cd554ad58918b'
            'bc65eec041814fbab5b7e4336d633abe6975227cd630e92ddf07f69a3624e492')

_builddir="${_source_name}-${pkgver}"

latestver() {
	gh api --paginate repos/athasdev/athas/releases --jq \
		'.[] | select(.prerelease == false and .draft == false) | .tag_name' |
		sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p' |
		sort -V |
		tail -1
}

prepare() {
	cd "${_builddir}"

	local cargo_home="${srcdir}/cargo"

	rm -f scripts/bootstrap-tree-sitter-cli.sh

	patch -Np1 < "${srcdir}/0001-add-missing-js-deps-and-swift-cli-override.patch"
	patch -Np1 < "${srcdir}/0002-add-packaging-tree-sitter-bootstrap-script.patch"

	export CARGO_HOME="${cargo_home}"
	mkdir -p "${cargo_home}"
}

build() {
	cd "${_builddir}"

	local cargo_home="${srcdir}/cargo"
	local cargo_target="${srcdir}/target"
	local debug_prefix="/usr/src/debug/${pkgname}"

	export CFLAGS="${CFLAGS/-flto=auto/}"
	export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
	export LDFLAGS="${LDFLAGS/-flto=auto/}"
	export CFLAGS="${CFLAGS} -ffile-prefix-map=${srcdir}=${debug_prefix}"
	export CXXFLAGS="${CXXFLAGS} -ffile-prefix-map=${srcdir}=${debug_prefix}"
	export RUSTFLAGS="${RUSTFLAGS:+${RUSTFLAGS} }--remap-path-prefix=${srcdir}=${debug_prefix}"
	export CARGO_HOME="${cargo_home}"
	export CARGO_TARGET_DIR="${cargo_target}"
	export OPENSSL_NO_VENDOR=1
	export npm_config_fetch_retries=5
	export npm_config_fetch_retry_maxtimeout=300000
	export npm_config_fetch_retry_mintimeout=20000
	export CXXFLAGS="${CXXFLAGS} -std=gnu++20"

	npm install --allow-git=all --legacy-peer-deps --install-strategy=nested --ignore-scripts
	bash scripts/bootstrap-tree-sitter-cli.sh "${CARCH}"

	npm rebuild tree-sitter-swift
	bun scripts/postinstall.ts
	npx vite build
	cargo build --release --manifest-path src-tauri/Cargo.toml
}

package() {
	cd "${_builddir}"

	local cargo_target="${srcdir}/target"

	install -Dm755 "${cargo_target}/release/athas" "${pkgdir}/usr/bin/${pkgname}"
	install -d "${pkgdir}/usr/lib/Athas"
	cp -r src/extensions/bundled "${pkgdir}/usr/lib/Athas/"

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 src-tauri/icons/32x32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	install -Dm644 src-tauri/icons/128x128.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"
	install -Dm644 src-tauri/icons/128x128@2x.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
	install -Dm644 src-tauri/icons/icon.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

	install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Athas
Comment=Lightweight code editor built with Tauri
Exec=athas %U
Icon=athas
Terminal=false
Categories=Development;IDE;
EOF
}

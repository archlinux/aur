# Maintainer: Juan Roa <hello@juanroa.dev>
pkgname=athas
pkgver=0.2.7
pkgrel=2
pkgdesc="Lightweight code editor built with React, TypeScript, and Tauri"
arch=('x86_64' 'aarch64')
url="https://github.com/athasdev/athas"
license=('AGPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
makedepends=('bun-bin' 'cmake' 'rust')
_source_name=athas
source=("${_source_name}-${pkgver}.tar.gz::https://github.com/athasdev/athas/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2315f42f51858a0422ede22dd6beee97f4c3cc8992822a86731990bc50d8a0c4')

_builddir="${_source_name}-${pkgver}"

prepare() {
	cd "${_builddir}"

	local cargo_home="${srcdir}/cargo"

	export CARGO_HOME="${cargo_home}"
	mkdir -p "${cargo_home}"
}

build() {
	cd "${_builddir}"

	local cargo_home="${srcdir}/cargo"
	local bun_cache="${srcdir}/bun-cache"
	local bun_global="${srcdir}/bun-global"
	local cargo_target="${srcdir}/target"

	mkdir -p "${bun_cache}" "${bun_global}"

	export CFLAGS="${CFLAGS/-flto=auto/}"
	export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
	export LDFLAGS="${LDFLAGS/-flto=auto/}"
	export CARGO_HOME="${cargo_home}"
	export CARGO_TARGET_DIR="${cargo_target}"
	export BUN_INSTALL_CACHE_DIR="${bun_cache}"
	export BUN_INSTALL_GLOBAL_DIR="${bun_global}"

	bun install
	bun run type-check
	bun vite build
	cargo build --release --locked --manifest-path src-tauri/Cargo.toml
}

package() {
	cd "${_builddir}"

	local cargo_target="${srcdir}/target"

	install -Dm755 "${cargo_target}/release/athas-code" "${pkgdir}/usr/lib/${pkgname}/athas"
	install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<'EOF'
#!/bin/sh
exec /usr/lib/athas/athas "$@"
EOF

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

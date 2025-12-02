# Maintainer: Kimiblock Moe
pkgname=clash-nyanpasu-git
_pkgname=clash-nyanpasu
_pkgver=2.0.0
pkgver=2.0.0.r5805.f78b7180
pkgrel=1
pkgdesc="A Clash GUI based on tauri. Clash Nyanpasu! (∠・ω< )⌒☆​"
arch=('x86_64' 'aarch64')
url="https://github.com/libnyanpasu/clash-nyanpasu"
license=('GPL3')
depends=('webkit2gtk-4.1' 'libayatana-appindicator' 'xdotool' 'mihomo')
makedepends=('rust-nightly' 'cargo-nightly' 'git' 'pnpm' 'clang' 'nodejs' 'librsvg' 'patchelf' 'jq')
optdepends=('clash' 'clash-rs' 'mihomo-alpha')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin" "${_pkgname}-git" "${_pkgname}-appimage")
source=("git+https://github.com/libnyanpasu/clash-nyanpasu.git")
sha256sums=('SKIP')
options=(strip !debug !lto)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "%s.r%s.%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
	cd "${srcdir}/${_pkgname}"

	local _target_triple=$(rustc -vV | sed -n 's/host: //p')
	mkdir -p backend/tauri/sidecar

	echo "Linking system mihomo to sidecar..."
	ln -sf /usr/bin/clash "backend/tauri/sidecar/clash-${_target_triple}"
	ln -sf /usr/bin/mihomo "backend/tauri/sidecar/mihomo-${_target_triple}"
	ln -sf /usr/bin/mihomo-alpha "backend/tauri/sidecar/mihomo-alpha-${_target_triple}"
	ln -sf /usr/bin/clash-rs "backend/tauri/sidecar/clash-rs-${_target_triple}"
	ln -sf /usr/bin/clash-rs-alpha "backend/tauri/sidecar/clash-rs-alpha-${_target_triple}"
	sed -i "s#{ name: 'clash'#//{ name: 'clash'#" scripts/check.ts
	sed -i "s#{ name: 'mihomo'#//{ name: 'mihomo'#" scripts/check.ts
	sed -i "s#{ name: 'mihomo-alpha'#//{ name: 'mihomo-alpha'#" scripts/check.ts
	sed -i "s#{ name: 'clash-rs'#//{ name: 'clash-rs'#" scripts/check.ts
	sed -i "s#{ name: 'clash-rs-alpha'#//{ name: 'clash-rs-alpha'#" scripts/check.ts

	echo "Installing node dependencies..."
	pnpm install --frozen-lockfile

	echo "Running nightly preparation..."
	pnpm prepare:nightly --disable-updater

	pnpm check

	echo "Disabling bundle in config..."
	local _conf="backend/tauri/tauri.nightly.conf.json"
	jq '.bundle.active = false' "$_conf" > "$_conf.tmp" && mv "$_conf.tmp" "$_conf"
}

function build(){
	cd "${srcdir}/${_pkgname}"

	echo "Building UI..."
	pnpm -F ui build

	echo "Building Tauri backend..."
	export CARGO_PROFILE_RELEASE_LTO=false
	pnpm build:nightly
}

package(){
	cd "${srcdir}/${_pkgname}"

	# install binary
	local _target_dir="backend/target/release"
	install -Dm755 "${_target_dir}/Clash Nyanpasu" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm755 "${_target_dir}/nyanpasu-service" -t "${pkgdir}/usr/bin"

	# install resources
	install -d "${pkgdir}/usr/lib/${_pkgname}/resources"
	install -m644 "backend/tauri/resources/Country.mmdb" "${pkgdir}/usr/lib/${_pkgname}/resources/Country.mmdb"
	install -m644 "backend/tauri/resources/geosite.dat" "${pkgdir}/usr/lib/${_pkgname}/resources/geosite.dat"
	install -m644 "backend/tauri/resources/geoip.dat" "${pkgdir}/usr/lib/${_pkgname}/resources/geoip.dat"

	# Fix icons
	local _backend_icons="backend/tauri/icons"
	install -Dm644 "${_backend_icons}/32x32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${_pkgname}.png"
	install -Dm644 "${_backend_icons}/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${_pkgname}.png"
	install -Dm644 "${_backend_icons}/128x128@2x.png" "${pkgdir}/usr/share/icons/hicolor/128x128@2/apps/${_pkgname}.pngg"
	install -Dm644 "${_backend_icons}/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

	if [ -f frontend/nyanpasu/src/assets/image/logo.svg ]; then
		install -Dm644 frontend/nyanpasu/src/assets/image/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
	fi

	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

	install -d "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<EOF
[Desktop Entry]
Categories=Development;
Comment=Clash Nyanpasu! (∠・ω< )⌒☆
Exec=${_pkgname}
StartupWMClass="Clash Nyanpasu"
Icon=${_pkgname}
Name=Clash Nyanpasu
Terminal=false
Type=Application
EOF
}

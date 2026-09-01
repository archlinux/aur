# Maintainer: xpufx <github@xpufx.com>
pkgname=tone3000-plugin
pkgver=0.0.2
pkgrel=1
pkgdesc="TONE3000 — NAM & IR loader plugin (VST3/CLAP/LV2/Standalone) (Built from source)"
arch=('x86_64')
url="https://github.com/tone-3000/tone3000-plugin"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'freetype2' 'curl' 'hicolor-icon-theme' 'glibc' 'gcc-libs')
makedepends=('cmake' 'ninja' 'nodejs' 'npm' 'git' 'pkgconf' 'unzip')
optdepends=('jack: JACK audio backend for standalone')
# provides not needed for canonical package
conflicts=('tone3000-plugin-bin')
source=("tone3000-plugin::git+https://github.com/tone-3000/tone3000-plugin.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "tone3000-plugin"
	git submodule update --init --recursive
	# UI must be built before CMake (juce_add_binary_data embeds webview)
	cd ui
	npm ci --omit=dev 2>/dev/null || npm ci
	npm run build
	cd ..
}

build() {
	cd "tone3000-plugin"
	cmake -B build -S . -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_TOOLCHAIN_FILE=cmake/linux-toolchain.cmake \
		-DBUILD_AAX=OFF
	cmake --build build --parallel
}

package() {
	cd "tone3000-plugin"
	# Artefacts layout matches build.yml: build/plugin/TONE3000_artefacts/Release/
	_ARTEFACTS="build/plugin/TONE3000_artefacts/Release"

	install -Dm755 "${_ARTEFACTS}/Standalone/TONE3000" "${pkgdir}/usr/bin/TONE3000"
	install -Dm755 "${_ARTEFACTS}/CLAP/TONE3000.clap" "${pkgdir}/usr/lib/clap/TONE3000.clap"

	mkdir -p "${pkgdir}/usr/lib/vst3" "${pkgdir}/usr/lib/lv2"
	cp -a "${_ARTEFACTS}/VST3/TONE3000.vst3" "${pkgdir}/usr/lib/vst3/"
	cp -a "${_ARTEFACTS}/LV2/TONE3000.lv2" "${pkgdir}/usr/lib/lv2/"

	find "${pkgdir}/usr/lib" -type d -exec chmod 755 {} +
	find "${pkgdir}/usr/lib" -type f -name "*.so" -exec chmod 755 {} +

	# Factory presets — system-wide (upstream install.sh replaces, we do same)
	if compgen -G "resources/factory-presets/*.t3kpreset" > /dev/null; then
		install -d "${pkgdir}/usr/share/tone3000/factory-presets"
		install -m644 resources/factory-presets/*.t3kpreset "${pkgdir}/usr/share/tone3000/factory-presets/"
	fi

	# Icon + desktop entry (absolute Exec)
	if [ -f "script/installer/linux/tone3000.png" ]; then
		install -Dm644 "script/installer/linux/tone3000.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tone3000.png"
	elif [ -f "tone3000.png" ]; then
		install -Dm644 "tone3000.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tone3000.png"
	fi
	install -d "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/tone3000.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Name=TONE3000
Comment=Play NAM captures and IRs straight from TONE3000
Exec=/usr/bin/TONE3000
Icon=tone3000
Terminal=false
Categories=AudioVideo;Audio;Music;
StartupWMClass=TONE3000
DESKTOP

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

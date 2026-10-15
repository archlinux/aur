# Maintainer: xpufx <github@xpufx.com>
pkgname=tone3000-plugin
pkgver=0.0.12
pkgrel=1
# Publish targets: aur + Arch release + Debian release (opt-in per format).
_publish_targets="aur github-arch github-deb"
# Debian runtime deps for the fpm conversion, translated from depends and
# cross-checked against `readelf -d` on the shipped ELF payload:
#   gtk3->libgtk-3-0t64, alsa-lib->libasound2t64, freetype2->libfreetype6,
#   curl->libcurl4t64, hicolor-icon-theme->hicolor-icon-theme,
#   glibc->libc6, gcc-libs->libgcc-s1 + libstdc++6, plus the libs JUCE links
#   directly (libfontconfig1, libx11-6). t64 is what Debian 13 and Ubuntu
#   24.04 ship. jack stays an optional Arch optdepend; the standalone loads
#   without it.
_deb_depends=('libc6' 'libgcc-s1' 'libstdc++6' 'libgtk-3-0t64' 'libasound2t64' 'libfreetype6' 'libfontconfig1' 'libcurl4t64' 'libx11-6' 'hicolor-icon-theme')
pkgdesc="TONE3000 — NAM & IR loader plugin (VST3/CLAP/LV2/Standalone) (Built from source)"
arch=('x86_64')
url="https://github.com/tone-3000/tone3000-plugin"
license=('MIT')
depends=('gtk3' 'alsa-lib' 'freetype2' 'curl' 'hicolor-icon-theme' 'glibc' 'gcc-libs')
makedepends=('cmake' 'ninja' 'git' 'pkgconf' 'unzip' 'jack')
optdepends=('jack: JACK audio backend for standalone')
# provides not needed for canonical package
conflicts=('tone3000-plugin-bin')
source=("tone3000-plugin::git+https://github.com/tone-3000/tone3000-plugin.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "tone3000-plugin"
	git submodule update --init --recursive
}

build() {
	cd "tone3000-plugin"
	# TONE3000 publishable key (OAuth client_id). Not a secret per their API docs:
	# https://www.tone3000.com/api — safe to embed in client-side code.
	# Same key upstream ships in their pre-built binaries.
	export T3K_PUBLISHABLE_KEY='t3k_pub__B8V_QGmV50ov2YWJzjqOxQE0q1-wURs'
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

	# Factory presets — the Linux runtime scans this shared system directory.
	if compgen -G "resources/factory-presets/*.t3kpreset" > /dev/null; then
		install -d "${pkgdir}/usr/share/TONE3000/Presets/Factory"
		install -m644 resources/factory-presets/*.t3kpreset "${pkgdir}/usr/share/TONE3000/Presets/Factory/"
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

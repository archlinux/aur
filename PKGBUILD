# Maintainer: xpufx <github@xpufx.com>
pkgname=tone3000-plugin-bin
pkgver=0.0.12
_tar_sha='c45ea5d64e6eef991b14f1883a4249ed1a883253db1a9d9f0605e0540aba5fc7'
_license_sha='88d4908d7343898f682e47e70f4288728006ed650dbf79e8940c709d55b76326'
pkgrel=3
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
pkgdesc="TONE3000 — NAM & IR loader plugin (VST3/CLAP/LV2/Standalone) (Github release binary)"
arch=('x86_64')
url="https://github.com/tone-3000/tone3000-plugin"
_github_url="https://github.com/tone-3000/tone3000-plugin"
license=('MIT')
depends=('gtk3' 'alsa-lib' 'freetype2' 'curl' 'hicolor-icon-theme' 'glibc' 'gcc-libs')
optdepends=('jack: JACK audio backend for standalone')
provides=('tone3000-plugin')
conflicts=('tone3000-plugin')
options=('!strip' '!debug')
source=("TONE3000-v${pkgver}-linux-x64.tar.gz::${_github_url}/releases/download/v${pkgver}/TONE3000-v${pkgver}-linux-x64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/tone-3000/tone3000-plugin/v${pkgver}/LICENSE")
sha256sums=("$_tar_sha"
            "$_license_sha")

package() {
	cd "$srcdir"

	_srcdir="TONE3000-v${pkgver}-linux-x64"
	# Fallback if prepare already ran in a different workdir (e.g. update-package.sh)
	if [ ! -d "$_srcdir" ] && [ -f "TONE3000-v${pkgver}-linux-x64.tar.gz" ]; then
		tar -xzf "TONE3000-v${pkgver}-linux-x64.tar.gz"
	fi

	# Binaries — system-wide locations (Arch audio plugin convention).
	# Do NOT use ${pkgname} in install paths (see paseo fix); use fixed names.
	install -Dm755 "${_srcdir}/TONE3000" "${pkgdir}/usr/bin/TONE3000"
	install -Dm755 "${_srcdir}/TONE3000.clap" "${pkgdir}/usr/lib/clap/TONE3000.clap"

	# VST3 is a bundle dir; LV2 is a bundle dir
	mkdir -p "${pkgdir}/usr/lib/vst3" "${pkgdir}/usr/lib/lv2"
	cp -a "${_srcdir}/TONE3000.vst3" "${pkgdir}/usr/lib/vst3/"
	cp -a "${_srcdir}/TONE3000.lv2" "${pkgdir}/usr/lib/lv2/"

	# Fix permissions: upstream tar ships dirs at 775, Arch wants 755; .so perms
	find "${pkgdir}/usr/lib" -type d -exec chmod 755 {} +
	find "${pkgdir}/usr/lib" -type f -name "*.so" -exec chmod 755 {} +

	# Factory presets — the Linux runtime scans this shared system directory.
	if compgen -G "${_srcdir}/factory-presets/*.t3kpreset" > /dev/null; then
		install -d "${pkgdir}/usr/share/TONE3000/Presets/Factory"
		install -m644 "${_srcdir}/factory-presets"/*.t3kpreset "${pkgdir}/usr/share/TONE3000/Presets/Factory/"
	fi

	# Icon + desktop entry (Exec must be absolute /usr/bin path)
	install -Dm644 "${_srcdir}/tone3000.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/tone3000.png"
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

	# License — ship original MIT from upstream (second source)
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

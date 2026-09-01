# Maintainer: xpufx <github@xpufx.com>
pkgname=tone3000-plugin-bin
pkgver=0.0.2
_zip_sha='fade5434e78a0cfefeb7b13987cd549e169f7c1caf0584eebc1ce1497dac636d'
_license_sha='88d4908d7343898f682e47e70f4288728006ed650dbf79e8940c709d55b76326'
pkgrel=1
pkgdesc="TONE3000 — NAM & IR loader plugin (VST3/CLAP/LV2/Standalone, JUCE/WebKitGTK)"
arch=('x86_64')
url="https://github.com/tone-3000/tone3000-plugin"
_github_url="https://github.com/tone-3000/tone3000-plugin"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'alsa-lib' 'freetype2' 'curl' 'hicolor-icon-theme' 'glibc' 'gcc-libs')
optdepends=('jack: JACK audio backend for standalone')
makedepends=('unzip')
provides=('tone3000-plugin')
conflicts=('tone3000-plugin')
options=('!strip' '!debug')
source=("TONE3000-v${pkgver}-linux-x64.zip::${_github_url}/releases/download/v${pkgver}/TONE3000-v${pkgver}-linux-x64.zip"
        "LICENSE::https://raw.githubusercontent.com/tone-3000/tone3000-plugin/v${pkgver}/LICENSE")
sha256sums=("$_zip_sha"
            "$_license_sha")

prepare() {
	# The zip contains a single inner tar.gz. makepkg (bsdtar) extracts the zip
	# leaving TONE3000-vX-linux-x64.tar.gz; unpack it to get the payload dir.
	if [ -f "TONE3000-v${pkgver}-linux-x64.tar.gz" ]; then
		tar -xzf "TONE3000-v${pkgver}-linux-x64.tar.gz"
	fi
}

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

	# Factory presets — system-wide, replaces previous set (upstream install.sh does rm *.t3kpreset first)
	if compgen -G "${_srcdir}/factory-presets/*.t3kpreset" > /dev/null; then
		install -d "${pkgdir}/usr/share/tone3000/factory-presets"
		install -m644 "${_srcdir}/factory-presets"/*.t3kpreset "${pkgdir}/usr/share/tone3000/factory-presets/"
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

# Maintainer: ArtFox3 <artfox3@gmail.com>

_pkgname=replay-browser
_pkgsrc='https://static.replay.io/downloads/linux-replay.tar.bz2'
_pkgsrcFileExtension='.tar.bz2'

pkgname="${_pkgname}"
pkgver=2024.03.18
pkgrel=1
pkgdesc="Replay.io is a tool that makes debugging easy. It's a browser that lets you record your web app and retroactively inspect it using print statements and browser DevTools."
url='https://www.replay.io'
license=('custom:replay.io')
arch=('x86_64')

depends=('dbus' 'dbus-glib' 'ffmpeg' 'gtk3' 'libpulse' 'libxss' 'libxt' 'mime-types' 'nss' 'ttf-font')
makedepends=('grep' 'coreutils')
optdepends=(
	'hunspell-en_US: Spell checking, American English'
	'libnotify: Notification integration'
	'networkmanager: Location detection via available WiFi networks'
	'pulseaudio: Audio support'
	'speech-dispatcher: Text-to-Speech'
	'xdg-desktop-portal: Screensharing with Wayland'
)
# options=(!debug !emptydirs !lto !makeflags !strip)

source=("${pkgname}-${pkgver}-${pkgrel}${_pkgsrcFileExtension}::${_pkgsrc}")
sha256sums=('7cb91614766e078404ec56f1f82380dd4a37489fe2e338fcdd76f61e2c4bd923')

pkgver() {
	version=$(grep BuildID ${srcdir}/replay/platform.ini | cut -d'=' -f2 | cut -b1-8)
	echo ${version:0:4}.${version:4:2}.${version:6:2}
}

# prepare sources for build and packaging
prepare() {
	# creating .desktop file
	cat > ${pkgname}.desktop <<-'EOF'
		[Desktop Entry]
		Version=1.0
		Type=Application
		Name=Replay browser
		Comment=Record your web app and retroactively inspect it using print statements and browser DevTools
		Exec=replay-browser
		Icon=replay-browser
		Terminal=false
		StartupNotify=false
		Categories=WebDevelopment;
		SingleMainWindow=true
		StartupWMClass=REPLAY
	EOF
}

# build() {
# }

package() {
	# Package
	install -dm755 "${pkgdir}/opt"
	cp -R "${srcdir}/replay" ${pkgdir}/opt/${pkgname}
# 	chmod -R 755 ${pkgdir}/opt/${pkgname}

	# Desktop file
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

	# Icon images
	install -Dm644 "${srcdir}/replay/browser/chrome/icons/default/default16.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/${pkgname}.png"
	install -Dm644 "${srcdir}/replay/browser/chrome/icons/default/default32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${pkgname}.png"
	install -Dm644 "${srcdir}/replay/browser/chrome/icons/default/default48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
	install -Dm644 "${srcdir}/replay/browser/chrome/icons/default/default64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png"
	install -Dm644 "${srcdir}/replay/browser/chrome/icons/default/default128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname}.png"

	# Symlink executable
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/replay" "${pkgdir}/usr/bin/${pkgname}"
}

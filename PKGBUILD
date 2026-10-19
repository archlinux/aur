# Maintainer: xpufx <github@xpufx.com>
pkgname=nota-daw
pkgver=0.56.1
pkgrel=1
# Publish targets: aur + Arch release + Debian release (opt-in per format).
_publish_targets="aur github-arch github-deb"
# Debian runtime deps for the fpm conversion:
#   ALSA -> libasound2t64, FreeType -> libfreetype6, Fontconfig -> libfontconfig1,
#   X11 -> libx11-6, libxext6, libxrandr2, libxinerama1, libxcursor1,
#   ICE/SM -> libice6, libsm6,
#   glibc/gcc -> libc6, libgcc-s1, libstdc++6,
#   certificates / theme -> ca-certificates, hicolor-icon-theme
_deb_depends=('libc6' 'libgcc-s1' 'libstdc++6' 'libasound2t64' 'libfreetype6' 'libfontconfig1' 'libx11-6' 'libxext6' 'libxrandr2' 'libxinerama1' 'libxcursor1' 'libice6' 'libsm6' 'ca-certificates' 'hicolor-icon-theme')
_deb_provides=('nota')
_deb_conflicts=('nota')
pkgdesc="Modern digital audio workstation (DAW) (Built from source)"
arch=('x86_64')
url="https://github.com/nota-daw/nota"
license=('AGPL-3.0-only')
depends=('alsa-lib' 'freetype2' 'fontconfig' 'glibc' 'gcc-libs' 'libx11' 'libxcursor' 'libxext' 'libxinerama' 'libxrandr' 'libice' 'libsm' 'openssl' 'zlib' 'icu' 'hicolor-icon-theme')
makedepends=('cmake' 'ninja' 'git' 'dotnet-sdk-10.0' 'aspnet-targeting-pack-10.0')
optdepends=(
	'pulseaudio: PulseAudio audio backend support'
	'pipewire-pulse: PipeWire PulseAudio audio backend support'
)
provides=('nota')
conflicts=('nota')
source=("nota::git+https://github.com/nota-daw/nota.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!strip')

prepare() {
	cd "nota"
	git submodule update --init --recursive
}

build() {
	cd "nota"

	# Build native engine and scan worker
	cmake -B build-native -S src/native/nota.engine -G Ninja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON
	cmake --build build-native --parallel

	# Publish managed Avalonia application (self-contained linux-x64)
	export DOTNET_CLI_TELEMETRY_OPTOUT=1
	export DOTNET_NOLOGO=1
	dotnet publish src/managed/Nota.App \
		-c Release \
		-r linux-x64 \
		--self-contained true \
		"-p:NotaNativeDir=$(pwd)/build-native" \
		-p:DebugType=none \
		-p:DebugSymbols=false \
		-p:AllowMissingPrunePackageData=true \
		-o build-publish

	# Ensure native engine and scan worker are in publish directory
	cp -f build-native/libnota_engine.so build-publish/
	if [ -f build-native/nota-scanworker ]; then
		cp -f build-native/nota-scanworker build-publish/
	fi
}

package() {
	cd "nota"

	# Install application payload into /usr/lib/nota
	install -d "${pkgdir}/usr/lib/nota"
	cp -a build-publish/* "${pkgdir}/usr/lib/nota/"
	chmod 755 "${pkgdir}/usr/lib/nota/Nota.App"
	if [ -f "${pkgdir}/usr/lib/nota/nota-scanworker" ]; then
		chmod 755 "${pkgdir}/usr/lib/nota/nota-scanworker"
	fi

	# Remove LTTng tracepoint provider to avoid unnecessary dependency on liblttng-ust
	rm -f "${pkgdir}/usr/lib/nota/libcoreclrtraceptprovider.so"

	# Install launcher scripts
	install -d "${pkgdir}/usr/bin"
	cat > "${pkgdir}/usr/bin/nota" << 'EOF'
#!/bin/sh
exec /usr/lib/nota/Nota.App "$@"
EOF
	chmod 755 "${pkgdir}/usr/bin/nota"
	ln -s nota "${pkgdir}/usr/bin/nota-daw"

	# Desktop entry
	install -d "${pkgdir}/usr/share/applications"
	cat > "${pkgdir}/usr/share/applications/nota.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Nota
Comment=Modern digital audio workstation
Exec=/usr/bin/nota
Icon=nota
Terminal=false
Categories=AudioVideo;Audio;Music;
StartupWMClass=Nota.App
EOF

	# Application icons
	for size in 16 24 32 48 64 128 256 512; do
		if [ -f "assets/icons/linux/nota-${size}.png" ]; then
			install -Dm644 "assets/icons/linux/nota-${size}.png" \
				"${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/nota.png"
		fi
	done

	# License
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

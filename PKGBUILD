# Maintainer: xpufx <github@xpufx.com>
pkgname=nota-daw
pkgver=0.58.1
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
# The payload mixes .NET assemblies (PE images) with native ELF binaries, so
# makepkg must not strip the tree wholesale: '!strip' keeps it away from the
# managed assemblies. '!debug' is required as well: with strip disabled but
# debug enabled, makepkg's tidy_strip() copies the DWARF source tree into
# /usr/src/debug/<pkgname> of the *main* package. Native ELF binaries are
# stripped explicitly in package() instead.
options=('!strip' '!debug')

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

	# Strip the native ELF binaries. Only these two are touched: the managed
	# assemblies in the payload are PE images and must stay untouched.
	if [ -f "${pkgdir}/usr/lib/nota/libnota_engine.so" ]; then
		strip --strip-unneeded "${pkgdir}/usr/lib/nota/libnota_engine.so"
	fi
	if [ -f "${pkgdir}/usr/lib/nota/nota-scanworker" ]; then
		strip --strip-unneeded "${pkgdir}/usr/lib/nota/nota-scanworker"
	fi

	# Drop build-time artifacts that only bloat the package
	find "${pkgdir}/usr/lib/nota" -name "*.pdb" -delete
	find "${pkgdir}/usr/lib/nota" -name "*.xml" -delete

	# createdump is a development/crash-dump helper, not needed at runtime
	rm -f "${pkgdir}/usr/lib/nota/createdump"

	# Never ship a DWARF source tree (e.g. /usr/src/debug/nota-daw)
	rm -rf "${pkgdir}/usr/src"

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

# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox
_pkgname=Bettbox
pkgver=1.19.7
pkgrel=1
pkgdesc="A cross-platform network traffic routing and DNS debugging tool, deeply built on the powerful Mihomo core."
arch=('x86_64' 'aarch64')
options=('!lto')
case "$CARCH" in
	x86_64)  _arch=amd64; _flutter_arch=x64  ;;
	aarch64) _arch=arm64; _flutter_arch=arm64 ;;
esac
url="https://github.com/appshubcc/${_pkgname}"
license=('GPL-3.0-or-later')
conflicts=('bettbox-compatible' 'bettbox-compatible-pre' 'bettbox-compatible-bin' 'bettbox-bin' 'bettbox-pre' 'bettbox-compatible-pre-bin' 'bettbox-pre-bin')
provides=("${pkgname}=${pkgver}")
depends=(
	'gtk3'
	'libayatana-appindicator'
	'libayatana-indicator'
	'libkeybinder3'
)
makedepends=('git' 'clang' 'cmake' 'ninja' 'go' 'rustup' 'fvm' 'patchelf')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz" "restart-bettbox.hook" "bettbox.desktop" "bettbox.install")
sha256sums=('4d9e9aee91557d4866ee0ec52f6600fabded81e7ea03bcb4d41cc63a9d0c59d9'
            '03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'd7b7bdb64b1aabcedc8092a1498d743fad66d34b7f592194f805d039004d3e0f'
            'c6a494309939447475c29c83020d0ad19b12bed0b3f5aaae3c7c8b5f32942d2b')
install=bettbox.install
prepare() {
	cd "${_pkgname}-${pkgver}"
	fvm use 3.47.7
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
}

build () {
	cd "${_pkgname}-${pkgver}"
	# cargokit (code_forge plugin) requires FLUTTER_ROOT for its dart
	export FLUTTER_ROOT="$(pwd)/.fvm/flutter_sdk"
	local app_env=stable
	fvm dart run build_runner build -d
	fvm dart ./setup.dart linux --arch "$_arch" --out core
	fvm flutter build linux --no-pub --release --target-platform "linux-$_flutter_arch" --dart-define=APP_ENV="$app_env"
}

# Waiting for https://github.com/appshubcc/Bettbox/pull/159
# Once merged, setup.dart gains --out app --build-only (-B) which builds the
# core, sets setuid, and runs flutter build in one step (with --env for APP_ENV).
# --arch is omitted since setup.dart now auto-detects the host CPU architecture
# (ArchExt.same). With --build-only, flutter build runs inside setup.dart, which
# derives --target-platform from the auto-detected arch, so neither $_arch nor
# $_flutter_arch are used in PKGBUILD anymore.
# Replace the build() above with:
# build() {
# 	cd "${_pkgname}-${pkgver}"
# 	export FLUTTER_ROOT="$(pwd)/.fvm/flutter_sdk"
# 	local app_env=stable
# 	fvm dart run build_runner build -d
# 	fvm dart ./setup.dart linux --build-only --env "$app_env"
# }

package () {
	cd "${_pkgname}-${pkgver}"
	pushd "build/linux/$_flutter_arch/release"
	install -Dm755 "bundle/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname}/"
	install -Dm755 "bundle/BettboxCore" -t "${pkgdir}/usr/lib/${pkgname}/"
	# Install lib/ and data/ from the bundle; `cmake -P` bakes $pkgdir into CMakeCache.txt, breaking `makepkg -f`.
	install -dm755 "${pkgdir}/usr/lib/${pkgname}/lib"
	cp -a bundle/lib/. "${pkgdir}/usr/lib/${pkgname}/lib/"
	install -dm755 "${pkgdir}/usr/lib/${pkgname}/data"
	cp -a bundle/data/. "${pkgdir}/usr/lib/${pkgname}/data/"
	popd

	# Reset RPATH
	patchelf --set-rpath '$ORIGIN' ${pkgdir}/usr/lib/${pkgname}/lib/*.so

	# Symlink
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/bettbox"

	# Hook
	install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

	# Polkit rule for resolvectl command; upstream owns the file in the source
	# tree (linux/packaging/polkit/), so the package ships it verbatim.
	install -Dm644 "linux/packaging/polkit/90-bettbox.rules" \
		"${pkgdir}/usr/share/polkit-1/rules.d/90-bettbox.rules"

	# Desktop file
	install -Dm644 "${srcdir}/bettbox.desktop" -t "${pkgdir}/usr/share/applications/"

	cd assets
	install -Dm644 images/icon.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/bettbox.png"
	install -Dm644 images/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bettbox.png"
}

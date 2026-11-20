# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox-lite-pre
_pkgname=Bettbox
pkgver=1.19.9pre1
pkgrel=1
_pkgver="${pkgver/pre/-pre}"
pkgdesc="A cross-platform network traffic routing and DNS debugging tool, deeply built on the powerful Mihomo core. (Lite build: no EasyTier/Tailscale/ZeroTier/fake-TCP/gVisor)"
arch=('x86_64' 'aarch64')
options=('!lto')
case "$CARCH" in
	x86_64)  _arch=amd64; _flutter_arch=x64  ;;
	aarch64) _arch=arm64; _flutter_arch=arm64 ;;
esac
url="https://github.com/appshubcc/${_pkgname}"
license=('GPL-3.0-or-later')
conflicts=(
	'bettbox' 'bettbox-bin' 'bettbox-compatible' 'bettbox-compatible-bin'
	'bettbox-compatible-pre' 'bettbox-compatible-pre-bin' 'bettbox-lite'
	'bettbox-lite-bin' 'bettbox-lite-compatible' 'bettbox-lite-compatible-bin'
	'bettbox-lite-compatible-pre' 'bettbox-lite-compatible-pre-bin'
	'bettbox-lite-pre-bin' 'bettbox-pre' 'bettbox-pre-bin'
)
provides=("${pkgname%-lite-pre}=${pkgver}")
depends=(
	'gtk3'
	'libayatana-appindicator'
	'libayatana-indicator'
	'libkeybinder3'
)
makedepends=('git' 'clang' 'cmake' 'ninja' 'go' 'rustup' 'fvm' 'patchelf')
source=("${_pkgname}-${_pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz" "restart-bettbox.hook" "bettbox.desktop" "bettbox.install")
sha256sums=('c66aa913efe6e2bb7ac1feb26e2ffea11c08466ad91bc0b1d1e7c87f02d59791'
            '03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'd7b7bdb64b1aabcedc8092a1498d743fad66d34b7f592194f805d039004d3e0f'
            'c6a494309939447475c29c83020d0ad19b12bed0b3f5aaae3c7c8b5f32942d2b')
install=bettbox.install
prepare() {
	cd "${_pkgname}-${_pkgver}"
	fvm use 3.47.7
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
}

build () {
	cd "${_pkgname}-${_pkgver}"
	# cargokit (code_forge plugin) requires FLUTTER_ROOT for its dart
	export FLUTTER_ROOT="$(pwd)/.fvm/flutter_sdk"
	local app_env=stable
	[[ "${pkgver}" == *pre* ]] && app_env=pre
	fvm dart run build_runner build
	# Lite: upstream's --lite swaps the core tags to
	# no_easytier,no_tailscale,no_zerotier,no_fake_tcp,with_low_memory and
	# passes APP_LITE to the app (see upstream .github/workflows/build.yaml).
	fvm dart ./setup.dart linux --arch "$_arch" --out core --lite
	fvm flutter build linux --no-pub --release --target-platform "linux-$_flutter_arch" --dart-define=APP_ENV="$app_env" --dart-define=APP_LITE=true
}

# Waiting for https://github.com/appshubcc/Bettbox/pull/159
# Once merged, setup.dart gains --out app --build-only (-B) which builds the
# core, sets setuid, and runs flutter build in one step (with --env for APP_ENV
# and --lite for APP_LITE). --arch is omitted since setup.dart now auto-detects
# the host CPU architecture (ArchExt.same). With --build-only, flutter build
# runs inside setup.dart, which derives --target-platform from the auto-detected
# arch, so neither $_arch nor $_flutter_arch are used in PKGBUILD anymore.
# Replace the build() above with:
# build() {
# 	cd "${_pkgname}-${_pkgver}"
# 	export FLUTTER_ROOT="$(pwd)/.fvm/flutter_sdk"
# 	local app_env=stable
# 	[[ "${pkgver}" == *pre* ]] && app_env=pre
# 	fvm dart run build_runner build
# 	fvm dart ./setup.dart linux --lite --build-only --env "$app_env"
# }

package () {
	cd "${_pkgname}-${_pkgver}"
	pushd "build/linux/$_flutter_arch/release"
	install -Dm755 "bundle/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-lite-pre}/"
	install -Dm755 "bundle/BettboxCore" -t "${pkgdir}/usr/lib/${pkgname%-lite-pre}/"
	# Install lib/ and data/ from the bundle; `cmake -P` bakes $pkgdir into CMakeCache.txt, breaking `makepkg -f`.
	install -dm755 "${pkgdir}/usr/lib/${pkgname%-lite-pre}/lib"
	cp -a bundle/lib/. "${pkgdir}/usr/lib/${pkgname%-lite-pre}/lib/"
	install -dm755 "${pkgdir}/usr/lib/${pkgname%-lite-pre}/data"
	cp -a bundle/data/. "${pkgdir}/usr/lib/${pkgname%-lite-pre}/data/"
	popd

	# Reset RPATH
	patchelf --set-rpath '$ORIGIN' ${pkgdir}/usr/lib/${pkgname%-lite-pre}/lib/*.so

	# Symlink
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname%-lite-pre}/${_pkgname}" "${pkgdir}/usr/bin/bettbox"

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

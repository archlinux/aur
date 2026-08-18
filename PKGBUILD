# Maintainer: VillagerTom <villager-tom at proton dot me>

pkgname=bettbox
_pkgname=Bettbox
pkgver=1.18.10
_pkgver="${pkgver/pre/-pre}"
pkgrel=2
pkgdesc="A multi-platform proxy client powered by the Mihomo (Clash Meta) core, refactored based on early versions of FlClash."
arch=('x86_64' 'aarch64')
options=('!lto')
case "$CARCH" in
	x86_64)  _arch=amd64; _flutter_arch=x64  ;;
	aarch64) _arch=arm64; _flutter_arch=arm64 ;;
esac
url="https://github.com/appshubcc/${_pkgname}"
license=('GPL-3.0-or-later')
conflicts=("${pkgname}-compatible" "${pkgname}-compatible-bin" "${pkgname}-bin")
provides=("${pkgname}=${pkgver}")
depends=(
	'gtk3'
	'libayatana-appindicator'
	'libkeybinder3'
)
makedepends=('git' 'clang' 'cmake' 'ninja' 'go' 'rustup' 'fvm' 'patchelf')
source=("${_pkgname}-${_pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz" "restart-bettbox.hook" "bettbox.desktop")
sha256sums=('9ae07bc91f5d44562af50fc5018ee843abbb7bda81805a05e0b78802dbe12add'
            '03d4aadb32c7a3876ac3dbafeb3d2ecd38b0fc87d19ff57d5dc46d452fd026a2'
            'd7b7bdb64b1aabcedc8092a1498d743fad66d34b7f592194f805d039004d3e0f')
prepare() {
	cd "${_pkgname}-${_pkgver}"
	fvm use 3.44.8
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
}

build () {
	cd "${_pkgname}-${_pkgver}"
	# cargokit (code_forge plugin) requires FLUTTER_ROOT for its dart
	export FLUTTER_ROOT="$(pwd)/.fvm/flutter_sdk"
	local app_env=pre
	[[ "$pkgver" != *pre* ]] && app_env=stable
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
# 	cd "${_pkgname}-${_pkgver}"
# 	export FLUTTER_ROOT="$(pwd)/.fvm/flutter_sdk"
# 	local app_env=pre
# 	[[ "$pkgver" != *pre* ]] && app_env=stable
# 	fvm dart run build_runner build -d
# 	fvm dart ./setup.dart linux --build-only --env "$app_env"
# }

package () {
	cd "${_pkgname}-${_pkgver}"
	pushd "build/linux/$_flutter_arch/release"
	install -Dm755 "bundle/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname}/"
	install -Dm755 "bundle/BettboxCore" -t "${pkgdir}/usr/lib/${pkgname}/"
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/lib/${pkgname}" .
	cmake -P cmake_install.cmake
	popd

	# Reset RPATH
	patchelf --set-rpath '$ORIGIN' ${pkgdir}/usr/lib/${pkgname}/lib/*.so

	# Set setuid on BettboxCore for TUN mode (to avoid password prompt)
	chmod +sx "${pkgdir}/usr/lib/${pkgname}/BettboxCore"

	# Symlink
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/bettbox"

	# Hook
	install -Dm644 -t "${pkgdir}/usr/share/libalpm/hooks/" "${srcdir}/restart-bettbox.hook"

	# Desktop file
	install -Dm644 "${srcdir}/bettbox.desktop" -t "${pkgdir}/usr/share/applications/"

	cd assets
	install -Dm644 images/icon.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/bettbox.png"
	install -Dm644 images/icon.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/bettbox.png"
}

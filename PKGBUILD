# Maintainer: vhqihh <zxcvbnm197305@126.com>
# Maintainer: George Hu <integral@archlinux.org>

pkgname=pilipro
_srcname=PiliPro
pkgver=2.0.0
pkgrel=1
pkgdesc="A third-party Bilibili client developed in Flutter ; Fork from github.com/bggRGjQaUbCoE/piliplus"
url="https://github.com/naaammme/${_srcname}"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('gtk3' 'mpv' 'libayatana-appindicator')
makedepends=('git' 'clang' 'cmake' 'ninja' 'fvm' 'patchelf')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('5a19880ccd602422e1831066800033ce971b5a5af9bfedb49eaf5c0cd3699c09')

prepare() {
	cd "${_srcname}/"
	# Fix protobuf issue: use relative imports for well_known_types to avoid v6.0.0 dependency mismatch
	sed -i "s|import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as \$0;|import '../../../../google/protobuf/any.pb.dart' as \$0;|" \
		lib/grpc/bilibili/app/playerunite/v1/playerunite.pb.dart
	sed -i "s|import 'package:protobuf/well_known_types/google/protobuf/any.pb.dart' as \$0;|import '../../google/protobuf/any.pb.dart' as \$0;|" \
		lib/grpc/bilibili/playershared/playershared.pb.dart

	fvm install 3.41.4 && fvm use 3.41.4
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
}

build() (
	cd "${_srcname}/"
	rm -rf build
	fvm flutter build linux --no-pub --release \
		--dart-define pili.name="${pkgver}" \
		--dart-define pili.code="$(git rev-list --count HEAD)" \
		--dart-define pili.hash="$(git rev-parse HEAD)" \
		--dart-define pili.time="$(date +%s)"
)

package() {
	cd "${_srcname}/"

	pushd build/linux/x64/release
	install -Dm755 "bundle/${_srcname}" -t "${pkgdir}/usr/lib/${pkgname}/"
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/lib/${pkgname}" .
	cmake -P cmake_install.cmake
	popd

	# Reset RPATH
	patchelf --set-rpath '$ORIGIN' ${pkgdir}/usr/lib/${pkgname}/lib/*.so

	# Symlink
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname}/${_srcname}" "${pkgdir}/usr/bin/${pkgname}"

	cd assets
	install -Dm644 images/logo/logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"
	# Fix .desktop file name and content
	sed -i "s/Name=PiliPlus/Name=PiliPro/" linux/piliplus.desktop
	sed -i "s/Exec=PiliPlus/Exec=${pkgname}/" linux/piliplus.desktop
	sed -i "s/Icon=PiliPlus/Icon=${pkgname}/" linux/piliplus.desktop
	install -Dm644 "linux/piliplus.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

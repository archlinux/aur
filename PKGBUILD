# Maintainer: vhqihh <zxcvbnm197305@126.com>
# Maintainer: George Hu <integral@archlinux.org>

pkgname=pilipro
_srcname=PiliPro
pkgver=1.8.0
pkgrel=1
pkgdesc="A third-party Bilibili client developed in Flutter ; Fork from github.com/bggRGjQaUbCoE/piliplus"
url="https://github.com/naaammme/${_srcname}"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('gtk3' 'mpv' 'libayatana-appindicator')
makedepends=('git' 'clang' 'cmake' 'ninja' 'fvm' 'patchelf')
source=("git+${url}.git#tag=${pkgver}")
sha256sums=('f37e24d71c91eb001ae5535ae654d863f935793167482814cb52048d07873345')

prepare() {
	cd "${_srcname}/"
	fvm install 3.35.7 && fvm use 3.35.7
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
}

build() (
	cd "${_srcname}/"
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
	install -Dm644 "linux/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}

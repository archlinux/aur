# Maintainer: nlsdt <githubaccount2333@proton.me>
# Contributor: George Hu <integral@archlinux.org>

pkgname=piliplus-git
_srcname=PiliPlus
_pkgname=piliplus
pkgver=2.0.4.r7.g2232bc0
pkgrel=2
pkgdesc="A third-party Bilibili client developed in Flutter"
url="https://github.com/bggRGjQaUbCoE/${_srcname}"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('gtk3' 'mpv' 'libayatana-appindicator' 'webkit2gtk-4.1')
makedepends=('git' 'clang' 'cmake' 'ninja' 'fvm' 'patchelf')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_srcname}/"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${_srcname}/"
	fvm install
	fvm flutter --disable-analytics
	fvm flutter --no-version-check pub get
}

build() {
	cd "${_srcname}/"
	local _sdk _scripts
	_sdk="$(readlink -f .fvm/flutter_sdk)"
	_scripts="${PWD}/lib/scripts"

	local _patches=(modal_barrier text_selection mouse_cursor image_anim
	                layout_builder navigation_drawer popup_menu fab
	                null_safety_for_selectable_region selectable_region
	                editable_text text_field scroll_position scrollable
	                scrollable_gesture draggable_scrollable_sheet scaffold
	                text text_painter sliver)

	printf "正在应用 Flutter 引擎补丁...\n"
	git -C "${_sdk}" reset --hard HEAD
	git -C "${_sdk}" show beb2ad17004a1b118ff2bd09f55cee23198f6652 --binary | git -C "${_sdk}" apply
	for _patch in "${_patches[@]}"; do
		git -C "${_sdk}" apply "${_scripts}/${_patch}.patch"
	done

	printf "补丁应用完成, 开始构建...\n"
	if fvm flutter build linux --no-pub --release \
		--dart-define pili.name="${pkgver}" \
		--dart-define pili.code="$(git rev-list --count HEAD)" \
		--dart-define pili.hash="$(git rev-parse HEAD)" \
		--dart-define pili.time="$(date +%s)"; then
		git -C "${_sdk}" reset --hard HEAD
	else
		_rc=$?
		printf "构建失败, 正在恢复 Flutter SDK...\n"
		git -C "${_sdk}" reset --hard HEAD
		return ${_rc}
	fi
	printf "构建完成, Flutter SDK 已恢复.\n"
}

package() {
	cd "${_srcname}/"

	pushd build/linux/x64/release
	install -Dm755 "bundle/${_pkgname}" -t "${pkgdir}/usr/lib/${_pkgname}/"
	cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/lib/${_pkgname}" .
	cmake -P cmake_install.cmake
	popd

	# Reset RPATH
	patchelf --set-rpath '$ORIGIN' ${pkgdir}/usr/lib/${_pkgname}/lib/*.so

	# Symlink
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	cd assets
	install -Dm644 images/logo/logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"
	install -Dm644 "linux/com.example.${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
}

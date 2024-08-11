# Maintainer: Kimiblock Moe
# Contributor: Integral

pkgname=qcm
pkgver=1.0.4
pkgrel=1
pkgdesc="Qt client for netease cloud music"
arch=('x86_64')
url="https://github.com/hypengw/Qcm"
license=('GPL-2.0-or-later')
depends=(
	'qt6-base'
	'qt6-shadertools'
	'hicolor-icon-theme'
	'curl'
	'openssl'
	'qt6-tools'
	'qt6-declarative'
	'gcc-libs'
	'glibc'
	'dbus'
	'libnghttp2'
	'libidn2'
	'krb5'
	'zstd'
	'zlib'
	'qt6-wayland'
	'libx11'
	'libxkbcommon'
	'libpng'
	'freetype2'
	'icu'
	'pcre2'
	'gnutls'
	'graphite'
	'lz4'
	'libgpg-error'
	'ffmpeg')
makedepends=(
	'git'
	'cmake'
	'extra-cmake-modules'
	'ninja')
provides=("qcm")
source=("git+https://github.com/hypengw/Qcm.git#tag=v${pkgver}")
sha256sums=('SKIP')
conflicts=("qcm")

function prepare() {
	cd Qcm
	git submodule update --init
	#if [ -d "${srcdir}"/Qcm/build ]; then
	#	rm -r "${srcdir}"/Qcm/build
	#fi
	if [ -d qml_material ]; then
		rm -rf qml_material
	fi
	git clone https://github.com/hypengw/QmlMaterial.git qml_material
}

function build(){
	cd Qcm
	mkdir build -p
	cd build
	cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_INSTALL_RPATH=YES
	ninja
}

function package(){
	local appID=io.github.hypengw.Qcm
	cd Qcm
	install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${appID}.svg"
	install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.desktop" "${pkgdir}/usr/share/applications/${appID}.desktop"
	install -Dm755 "${srcdir}/Qcm/build/app/Qcm" "${pkgdir}/usr/bin/Qcm"
	install -Dm755 "${srcdir}/Qcm/build/qcm_interface/libqcm_interface.so" "${pkgdir}/usr/lib/libqcm_interface.so"
	install -Dm755 "${srcdir}/Qcm/build/asio_helper/libqcm_asio.so" "${pkgdir}/usr/lib/libqcm_asio.so"
	#DESTDIR="$pkgdir" cmake --install build
}

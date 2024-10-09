# Maintainer: Kimiblock Moe
# Contributor: Integral
# Contributor: ZhangHua

pkgname=qcm-git
pkgver=1.1.0.r0.ga4ddfc3b
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
	'ffmpeg'
	"fmt")
makedepends=(
	'git'
	'cmake'
	'extra-cmake-modules'
	'ninja')
provides=("qcm")
source=("git+https://github.com/hypengw/Qcm.git")
sha256sums=('SKIP')
conflicts=("qcm")

function pkgver(){
	cd Qcm
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cd "${srcdir}/Qcm"
	git submodule update --init --recursive
}

function build(){
	cd "${srcdir}/Qcm"
	cmake -S . -B build -GNinja -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

function package(){
	cd "${srcdir}/Qcm"
	DESTDIR="${pkgdir}" cmake --install build
	mv "${pkgdir}/usr/local"/* "${pkgdir}/usr"
# 	mkdir -p "${pkgdir}/usr/share/Qcm/"
# 	cp -r "${srcdir}/Qcm/build/qml_modules" "${pkgdir}/usr/share/Qcm/"
# 	sed -i 's|Exec=Qcm|Exec=env QML_IMPORT_PATH=/usr/share/Qcm/qml_modules Qcm|g' \
# 		"${pkgdir}/usr/share/applications"/*.desktop
}

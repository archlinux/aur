# Maintainer: Kimiblock Moe
# Contributor: Integral

pkgname=qcm-git
pkgver=1.0.2.r5.gab29b2cd
pkgrel=3
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
source=('git+https://github.com/hypengw/Qcm.git')
sha256sums=('SKIP')
conflicts=("qcm")

function prepare() {
	cd Qcm
	#git submodule update --init --depth 1 --remote
	git submodule update --init
	if [ -d "${srcdir}"/Qcm/build ]; then
		rm -r "${srcdir}"/Qcm/build
	fi
}

function pkgver(){
	cd Qcm
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function build(){
	cd Qcm
	mkdir build
	cd build
	cmake .. -GNinja -DCMAKE_BUILD_TYPE=Release
	ninja
}

function package(){
	local appID=io.github.hypengw.Qcm
	install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${appID}.svg"
	install -Dm644 "${srcdir}/Qcm/app/assets/Qcm.desktop" "${pkgdir}/usr/share/applications/${appID}.desktop"
	install -Dm755 "${srcdir}/Qcm/build/app/Qcm" "${pkgdir}/usr/bin/Qcm"
}

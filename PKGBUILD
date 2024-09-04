#!/usr/bin/bash
# Maintainer: Kimiblock Moe

pkgname=nbteditor-git
arch=('x86_64')
backup=()
pkgver=1.3.r3.g714ac6e4
pkgrel=1
pkgdesc="Editor for Minecraft NBT and schematic files"
url="https://github.com/Howaner/NBTEditor"
license=("Apache")
depends=("qt5-base" "qt5-wayland" "zlib")
source=(
	"git+https://github.com/Howaner/NBTEditor.git"
	"NBTEditor.desktop"
	)
makedepends=("cmake" "git" "extra-cmake-modules")
sha256sums=('SKIP'
            'f490dbcc7e4d6f32d5bf15e50acc35d8ccbed20d159379a469e9b30f0dcd3480')
provides=("nbteditor")
conflicts=("nbteditor" "nbteditor-bin")

function pkgver() {
	cd NBTEditor
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function prepare() {
	cmake -B build -S NBTEditor \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-Wno-dev
}

function build() {
	cmake --build build
}

function check() {
	ctest \
		--test-dir build \
		--output-on-failure
}

function package() {
	#DESTDIR="${pkgdir}" cmake --install build
	install -Dm755 "${srcdir}/build/nbteditor" "${pkgdir}/usr/bin/nbteditor"
	install -Dm644 "${srcdir}/NBTEditor/resources/logo.png" \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/nbteditor.png"
	install -Dm644 "${srcdir}/NBTEditor.desktop" \
		"${pkgdir}/usr/share/applications/nbteditor.desktop"
}

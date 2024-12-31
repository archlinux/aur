# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.7.139
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=(x86_64)
url=https://xemu.app/
license=("GPL-2.0-only AND LGPL-2.1-only AND LicenseRef-QEMUDistributionLicense")
depends=(
	dtc
	gcc-libs
	glibc
	hicolor-icon-theme
	libcpp-httplib.so
	sdl2
	zlib
)
makedepends=(
	cmake
	git
	glib2
	glu
	gtk3
	keyutils
	libepoxy
	libpcap
	libsamplerate
	libslirp
	meson
	nlohmann-json
	openssl
	pixman
	python-yaml
	'tomlplusplus>=3.1'
	'xxhash>=0.8'
)
optdepends=(
	'fancy-mouse-boot-rom: first-stage xbox bootrom'
)
install=$pkgname.install
source=(
	"$pkgname::git+https://github.com/xemu-project/xemu.git#tag=v$pkgver"
	"$pkgname-imgui::git+https://github.com/xemu-project/imgui.git"
	'berkeley-softfloat-3::git+https://gitlab.com/qemu-project/berkeley-softfloat-3.git'
	'berkeley-testfloat-3::git+https://gitlab.com/qemu-project/berkeley-testfloat-3.git'
	'genconfig::git+https://github.com/mborgerson/genconfig.git'
	'implot::git+https://github.com/epezent/implot.git'
	'keycodemapdb::git+https://gitlab.com/qemu-project/keycodemapdb.git'
	'nv2a_vsh_cpu::git+https://github.com/abaire/nv2a_vsh_cpu.git'
	'use-system-libs.patch'
)
b2sums=('6c28bc4b52a7c9721db6622323d29ad98fa8d9b7812e1b4b7ce7641da1d2c90178dca8533b14994bc584e65f0119a52a7eeab486bd0f3ef4f31df5e371a75af2'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '6b072b31fe7fb5b81f0e681104ab7351e81e7b2e02f91c5926b32af4e260c636ad2834bafd8818528b5ebe2cb9912012c1c18f3c87b4312507544a6a17c728d3')

prepare() {
	cd $pkgname
	git config submodule.genconfig.url ../genconfig
	git config submodule.hw/xbox/nv2a/thirdparty/nv2a_vsh_cpu.url ../nv2a_vsh_cpu
	git config submodule.tests/fp/berkeley-softfloat-3.url ../berkeley-softfloat-3
	git config submodule.tests/fp/berkeley-testfloat-3.url ../berkeley-testfloat-3
	git config submodule.ui/keycodemapdb.url ../keycodemapdb
	git config submodule.ui/thirdparty/imgui.url ../$pkgname-imgui
	git config submodule.ui/thirdparty/implot.url ../implot
	git -c protocol.file.allow=always submodule update
	mkdir -p ../build
	patch -Np1 < ../use-system-libs.patch
	python scripts/gen-license.py > XEMU_LICENSE
}

build() {
	cd build
	../$pkgname/configure \
		--audio-drv-list="sdl" \
		--disable-debug-info \
		--extra-cflags="-DXBOX=1" \
		--ninja="$NINJA" \
		--target-list="i386-softmmu" \
		--with-git-submodules=ignore \
		--disable-fortify-source
	make qemu-system-i386
}

package() {
	depends+=(
		'libepoxy.so'
		'libgdk-3.so'
		'libglib-2.0.so'
		'libgobject-2.0.so'
		'libgtk-3.so'
		'libkeyutils.so'
		'libpcap.so'
		'libpixman-1.so'
		'libsamplerate.so'
		'libslirp.so'
		'libtomlplusplus.so'
	)
	cd $pkgname
	# shellcheck disable=SC2154
	install -Dm755 ../build/qemu-system-i386 "$pkgdir"/usr/bin/$pkgname
	install -Dm644 ui/xemu.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
	for _size in 16 24 32 48 64 128 256 512; do
		install -Dm644 ui/icons/xemu_${_size}x${_size}.png "$pkgdir"/usr/share/icons/hicolor/${_size}x${_size}/apps/$pkgname.png
	done
	install -Dm644 ui/icons/xemu.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$pkgname.svg
	install -Dm644 XEMU_LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

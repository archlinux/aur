# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.7.132
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
b2sums=('e0d89077518cddaa11d607183c8bf73f1054d9470e537cea48467cee22fff3bc9bf59308934bebb222944b7e5f3ccef53b2b275500cf648bc6000df75e9ed71a'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'ab5636092dd543c38b9756914100f15a44222d5e4a3160360a1d739725a65f95ea8a5c48e11358397c0a07bbbc04ed604fc86295d979209481b1e56c5c7b4dcf')

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

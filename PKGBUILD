# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.8.7
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=(x86_64)
url=https://xemu.app/
license=("GPL-2.0-only AND LGPL-2.1-only AND LicenseRef-QEMUDistributionLicense")
depends=(
	dtc
	gcc-libs
	glibc
	glslang
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
	vulkan-headers
	vulkan-icd-loader
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
	'use-system-libs.patch'
)
b2sums=('dc7204ea68ea0f67885c3c6a56c6d662eae1346117b4f598796b99854d4ac42255042d20e5dbcd2dcb35aa5bc54291c0c6d0bb2a90d27b0a869f02e2c2a0cab0'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'edb812cf4c5162d71fa4d53828c12667bb12526b5b23cf97e244a5f107599a797fdcb8e53e27b10b95caf101ad324bb4679d7f309c9437fe0c227c2602fc3b56')

prepare() {
	cd $pkgname
	git config submodule.genconfig.url ../genconfig
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
		'libxxhash.so'
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

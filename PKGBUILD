# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.8.131
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=(x86_64)
url=https://xemu.app/
license=("GPL-2.0-only AND LGPL-2.1-only AND LicenseRef-QEMUDistributionLicense")
depends=(
	gcc-libs
	glibc
	glslang
	hicolor-icon-theme
	sdl2
)
makedepends=(
	cmake
	curl
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
	python-distlib
	python-yaml
	'tomlplusplus>=3.1'
	vulkan-headers
	vulkan-icd-loader
	'xxhash>=0.8'
	zlib
)
optdepends=(
	'fancy-mouse-boot-rom: first-stage xbox bootrom'
)
install=$pkgname.install
source=(
	"$pkgname::git+https://github.com/xemu-project/xemu.git#tag=v$pkgver"
)
b2sums=('29bc40d926980a8a085b46b0657d488ae8614ccb7de64d281e4cebc53ae65348b69b68986ff5e1685c804702641f6c5a4bd58a312f5a21dab06e3181ba61dc54')

prepare() {
	cd $pkgname
	sed -i '/\[wrap-/a method=cmake' subprojects/{SPIRV-Reflect,VulkanMemoryAllocator,glslang,nv2a_vsh_cpu,volk}.wrap
	meson subprojects download
	mkdir -p ../build
	python scripts/gen-license.py > XEMU_LICENSE
	# fix bug with cmake subprojects
	sed -i '/CPU_CFLAGS="-m64"/d' configure
}

build() {
	cd build
	../$pkgname/configure \
		--audio-drv-list="sdl" \
		--disable-docs \
		--disable-download \
		--disable-werror \
		--enable-pie \
		--extra-cflags="-DXBOX=1" \
		--ninja="$NINJA" \
		--target-list="i386-softmmu" \
		-Dbuildtype=plain
	make qemu-system-i386
}

package() {
	depends+=(
		'libcurl.so'
		'libepoxy.so'
		'libgdk-3.so'
		'libglib-2.0.so'
		'libgobject-2.0.so'
		'libgtk-3.so'
		'libpcap.so'
		'libusb-1.0.so'
		'libsamplerate.so'
		'libslirp.so'
		'libtomlplusplus.so'
		'libxxhash.so'
		'libz.so'
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

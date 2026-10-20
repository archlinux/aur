# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.8.138
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=(x86_64)
url=https://xemu.app/
license=("GPL-2.0-only AND LGPL-2.1-only AND LicenseRef-QEMUDistributionLicense")
depends=(
	glibc
	glslang
	hicolor-icon-theme
	'sdl3>=3.4'
)
makedepends=(
	cmake
	curl
	git
	glib2
	glu
	libatomic
	libepoxy
	libgcc
	libpcap
	libsamplerate
	libslirp
	libstdc++
	libusb
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
	'zenity: file open dialog fallback'
)
install=$pkgname.install
source=(
	"$pkgname::git+https://github.com/xemu-project/xemu.git#tag=v$pkgver"
)
b2sums=('7cfba418805873013ff0315c8b7cd960896ac752214dc170273f1ec58515381753a7b86f82442c75f20c9d24015d39b329b2a285e3e3e1fbeebb3e8b9510311a')

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
		'libatomic.so'
		'libcurl.so'
		'libepoxy.so'
		'libgcc_s.so'
		'libglib-2.0.so'
		'libpcap.so'
		'libsamplerate.so'
		'libslirp.so'
		'libstdc++.so'
		'libtomlplusplus.so'
		'libusb-1.0.so'
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

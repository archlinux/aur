# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.8.35
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
b2sums=('818c524cfb6295fe5da7597bcb22d8550029a7905abc8779f0005cfb3aa32a22680300a5b21f9e7f85e064053436abdf6a958b6720f5eedb25ccda51836fc75a')

prepare() {
	cd $pkgname
	echo method=cmake | tee -a subprojects/{SPIRV-Reflect,VulkanMemoryAllocator,glslang,nv2a_vsh_cpu,volk}.wrap
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

# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=xemu
pkgname=$_pkgname-git
pkgver=0.8.135.r13.gfeac623
pkgrel=1
pkgdesc="Original Xbox emulator (fork of XQEMU)"
arch=('x86_64')
url="https://xemu.app/"
license=('GPL-2.0-only')
depends=(
	'glibc'
	'glslang'
	'hicolor-icon-theme'
	'sdl3>=3.4'
)
makedepends=(
	'cmake'
	'curl'
	'git'
	'glib2'
	'glu'
	'libatomic'
	'libepoxy'
	'libgcc'
	'libpcap'
	'libsamplerate'
	'libslirp'
	'libstdc++'
	'libusb'
	'meson'
	'nlohmann-json'
	'python-distlib'
	'python-yaml'
	'tomlplusplus>=3.1'
	'vulkan-headers'
	'vulkan-icd-loader'
	'xxhash>=0.8'
	'zlib'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install=$_pkgname.install
source=("$_pkgname::git+https://github.com/xemu-project/xemu.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --abbrev=7 | sed 's/^v//;s/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	sed -i '/\[wrap-/a method=cmake' subprojects/{SPIRV-Reflect,VulkanMemoryAllocator,glslang,nv2a_vsh_cpu,volk}.wrap
	meson subprojects download
	mkdir -p ../build
	python scripts/gen-license.py > XEMU_LICENSE
	# fix bug with cmake subprojects
	sed -i '/CPU_CFLAGS="-m64"/d' configure
}

build() {
	local options=(
		--audio-drv-list="sdl"
		--disable-docs
		--disable-download
		--disable-werror
		--enable-pie
		--extra-cflags="-DXBOX=1"
		--ninja="$NINJA"
		--target-list="i386-softmmu"
		-Dbuildtype=plain
	)
	local flags
	IFS=\  read -r -a flags <<< "$CFLAGS"
	local defines
	defines=$(echo | gcc "${flags[@]}" -dM -E -)
	if grep -q __AVX512F__ <<< "$defines"; then
		options+=(-Dx86_version=4)
	elif grep -q __AVX2__ <<< "$defines"; then
		options+=(-Dx86_version=3)
	elif grep -q __SSE4_2__ <<< "$defines"; then
		options+=(-Dx86_version=2)
	else
		options+=(-Dx86_version=1)
	fi
	cd build
	../$_pkgname/configure "${options[@]}"
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

	cd $_pkgname
	# shellcheck disable=SC2154
	install -Dm755 ../build/qemu-system-i386 "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 ui/xemu.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
	local size
	for size in 16 24 32 48 64 128 256 512; do
		install -Dm644 ui/icons/xemu_${size}x${size}.png "$pkgdir"/usr/share/icons/hicolor/${size}x${size}/apps/$_pkgname.png
	done
	install -Dm644 ui/icons/xemu.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg
	install -Dm644 XEMU_LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}

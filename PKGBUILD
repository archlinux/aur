# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Alexandre Bouvier <contact@amb.tf>

pkgname=xemu
pkgver=0.8.10
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
	'use-system-libs.patch'
)
b2sums=('150d5af35714040a99b00be9f0aca6329cf9e82d455b473ca057e375686a203e01821c15c2f98ab15a272d5597e31f154a83a0b035b1a0d3acb299c3e6d7196e'
        '7fcaa84ca21edc825404aefe9915cce97c6907421e35674b041f6c3b4fa40a1950da218cd3cec23c6d8ac5e4ef85605c104bf5744ed32fcea7a0f3c0f0cd53d6')

prepare() {
	cd $pkgname
	mkdir -p ../build
	patch -Np1 < ../use-system-libs.patch
	python scripts/gen-license.py > XEMU_LICENSE
}

build() {
	cd build
	../$pkgname/configure \
		--audio-drv-list="sdl" \
		--disable-werror \
		--extra-cflags="-DXBOX=1" \
		--ninja="$NINJA" \
		--target-list="i386-softmmu" \
		--disable-fortify-source \
		-Dbuildtype=plain
	make qemu-system-i386
}

package() {
	depends+=(
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

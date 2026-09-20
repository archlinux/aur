# Maintainer: mAmineChniti <emin.chniti@esprit.tn>
pkgname=gb4me-git
pkgver=r2.0a3b686
pkgrel=1
pkgdesc='Nintendo Game Boy / Game Boy Color emulator in C++23 (SDL3 + Vulkan)'
arch=('x86_64')
url='https://github.com/mAmineChniti/GB4ME'
license=('custom:unknown')
depends=('sdl3' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'shaderc' 'vulkan-headers')
provides=('gb4me')
conflicts=('gb4me')
source=('git+https://github.com/mAmineChniti/GB4ME.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/GB4ME"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/GB4ME"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build -j"$(nproc)"
}

package() {
	cd "$srcdir/GB4ME"
	DESTDIR="$pkgdir" cmake --install build

	# Compiled SPIR-V shaders (glslc emits these POST_BUILD into build/bin/shaders).
	# The renderer searches /usr/share/GB4ME/shaders (see vulkan_renderer.cpp).
	install -Dm644 build/bin/shaders/quad.vert.spv "$pkgdir/usr/share/GB4ME/shaders/quad.vert.spv"
	install -Dm644 build/bin/shaders/quad.frag.spv "$pkgdir/usr/share/GB4ME/shaders/quad.frag.spv"
	install -Dm644 build/bin/shaders/gui.vert.spv "$pkgdir/usr/share/GB4ME/shaders/gui.vert.spv"
	install -Dm644 build/bin/shaders/gui.frag.spv "$pkgdir/usr/share/GB4ME/shaders/gui.frag.spv"

	# Console photo texture for the menu shell (see create_body_texture).
	install -Dm644 assets/gbc_body.png "$pkgdir/usr/share/GB4ME/assets/gbc_body.png"

	# Window/app icon (512x512) and desktop entry (Icon=GB4ME resolves via hicolor).
	install -Dm644 assets/GB4ME.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/GB4ME.png"
	install -Dm644 GB4ME.desktop "$pkgdir/usr/share/applications/GB4ME.desktop"
}

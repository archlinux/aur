# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=dusklight
pkgver=1.4.1
pkgrel=2
pkgdesc="Dusklight brings a classic adventure to PC and mobile platforms with a variety of fixes and improvements."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusklight"
license=('CC0-1.0')
depends=('glibc' 'libgcc' 'abseil-cpp' 'libstdc++' 'sdl3' 'libjpeg-turbo' 'freetype2'
	 'zlib' 'libpng' 'fmt' 'sqlite')
makedepends=('cmake' 'ninja' 'clang' 'lld' 'vulkan-headers' 'patchelf' 'git')
provides=('tp-dusk')
conflicts=('tp-dusk')
replaces=('tp-dusk')
source=("git+$url.git#tag=v${pkgver}"
	"git+https://github.com/encounter/aurora.git"
	)
sha256sums=('90920dafb86c6453c883d7e103814cb139f6368909eee1cedf3de9258269b5da'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.extern/aurora.url "$srcdir/aurora"
	git -c protocol.file.allow=always submodule update
	# Fix compile for now
	sed -i -e '1i#include <cstring>\' extern/aurora/lib/card/CardGciFolder.cpp
}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname} -GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_C_FLAGS="${CFLAGS} -flto=thin -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -flto=thin -DNDEBUG" \
	-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
	-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
	-DDUSK_ENABLE_UPDATE_CHECKER=OFF \
	-DDUSK_PACKAGE_INSTALL=OFF \
	-DDUSK_VERSION_OVERRIDE="v${pkgver}"

	cmake --build build
}

package() {
	cd "$srcdir"
	install -Dm755 build/${pkgname} "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
	install -Dm755 build/libs/freeverb/libfreeverb.so -t "${pkgdir}/usr/lib/${pkgname}"
	install -Dm755 build/librmlui.so -t "${pkgdir}/usr/lib/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -a build/res "${pkgdir}/usr/share/${pkgname}/res"
	ln -s /usr/share/${pkgname}/res "${pkgdir}/usr/lib/${pkgname}/res"
	ln -s /usr/lib/${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 ${pkgname}/platforms/freedesktop/dev.twilitrealm.dusk.desktop "${pkgdir}/usr/share/applications/dev.twilitrealm.dusk.desktop"
	#install -Dm644 ${pkgname}/res/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/dev.twilitrealm.dusk.png"
	install -Dm644 ${pkgname}/res/icon.png "${pkgdir}/usr/share/pixmaps/dev.twilitrealm.dusk.png"

	patchelf --set-rpath "/usr/lib/${pkgname}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}" #needed for rmlui & freeverb :)
}

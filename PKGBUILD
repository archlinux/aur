# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=dusklight
pkgver=1.0.1
pkgrel=1
pkgdesc="Dusklight brings a classic adventure to PC and mobile platforms with a variety of fixes and improvements."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusklight"
license=('CC0-1.0')
depends=('glibc' 'libgcc' 'abseil-cpp' 'libstdc++' 'sdl3' 'libjpeg-turbo' 'freetype2')
makedepends=('cmake' 'meson' 'clang' 'lld' 'llvm' 'vulkan-headers' 'patchelf')
provides=('tp-dusk')
conflicts=('tp-dusk')
replaces=('tp-dusk')
source=("git+$url.git#tag=v${pkgver}"
	"git+https://github.com/encounter/aurora.git"
	)
sha256sums=('0d76d2fe29a0273aea84f3d71807c09b08911523ebeca8a7db8c8c8fdaae7022'
            'SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submoudle.extern/aurora.url "$srcdir/aurora"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname} -GNinja \
	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DCMAKE_C_FLAGS="${CFLAGS} -flto=thin" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -flto=thin" \
	-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
	-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS} -fuse-ld=lld" \
	-DDUSK_ENABLE_UPDATE_CHECKER=OFF

	cmake --build build
}

package() {
	cd "$srcdir"
	install -Dm755 build/dusk "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -a build/res "${pkgdir}/usr/share/${pkgname}/res"
	ln -s /usr/share/${pkgname}/res "${pkgdir}/usr/lib/${pkgname}/res"
	ln -s /usr/lib/${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

	patchelf --remove-rpath "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
}

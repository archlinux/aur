# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>

pkgname=dusklight
pkgver=2.0.3
pkgrel=2
pkgdesc="Dusklight brings a classic adventure to PC and mobile platforms with a variety of fixes and improvements."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusklight"
license=('CC0-1.0')
depends=('glibc' 'libgcc' 'abseil-cpp' 'libstdc++' 'sdl3' 'freetype2'
	 'libpng' 'fmt' 'sqlite' 'libogg' 'opus' 'curl')
makedepends=('cmake' 'ninja' 'vulkan-headers' 'git')
provides=('tp-dusk')
conflicts=('tp-dusk')
replaces=('tp-dusk')
source=("git+$url.git#tag=v${pkgver}"
	"git+https://github.com/encounter/aurora.git"
	"git+https://github.com/encounter/borealis.git"
	"git+https://github.com/TwilitRealm/dusklight-randomizer.git"
	"git+https://github.com/TwilitRealm/dusklight-cosmetics.git"
	)
sha256sums=('535d50e77ddeaf2dd4c9baa7b96f8fea83f3b818b44eac7f8265e239cb37fb5d'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
# Mod support seems dependent on LTO being turned off
# plus debug info being into the binary. In the future,
# if this can be removed, I would like to remove it.
options=(!lto !debug)

prepare() {
	cd "$srcdir/$pkgname"
	git submodule init
	git config submodule.extern/aurora.url "$srcdir/aurora"
	git config submodule.extern/borealis.url "$srcdir/borealis"
	git config submodule.mods/randomizer.url "$srcdir/dusklight-randomizer"
	git config submodule.mods/cosmetics.url "$srcdir/dusklight-cosmetics"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$srcdir"
	cmake -B build -S ${pkgname} -GNinja \
	-DCMAKE_BUILD_TYPE=None \
	-DCMAKE_C_COMPILER=gcc \
	-DCMAKE_CXX_COMPILER=g++ \
	-DCMAKE_SKIP_RPATH=ON \
	-DCMAKE_C_FLAGS="${CFLAGS} -g -DNDEBUG" \
	-DCMAKE_CXX_FLAGS="${CXXFLAGS} -g -DNDEBUG" \
	-DCMAKE_EXE_LINKER_FLAGS="${LDFLAGS}" \
	-DCMAKE_SHARED_LINKER_FLAGS="${LDFLAGS}" \
	-DDUSK_ENABLE_OPUS=ON \
	-DDUSK_PACKAGE_INSTALL=OFF \
	-DAURORA_SDL3_PROVIDER=system

	cmake --build build
}

package() {
	cd "$srcdir"
	install -Dm755 build/${pkgname} "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -a build/res "${pkgdir}/usr/share/${pkgname}/res"
	ln -s /usr/share/${pkgname}/res "${pkgdir}/usr/lib/${pkgname}/res"
	ln -s /usr/lib/${pkgname}/${pkgname} "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 ${pkgname}/platforms/freedesktop/dev.twilitrealm.dusk.desktop "${pkgdir}/usr/share/applications/dev.twilitrealm.dusk.desktop"
	#install -Dm644 ${pkgname}/res/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/dev.twilitrealm.dusk.png"
	install -Dm644 ${pkgname}/res/icon.png "${pkgdir}/usr/share/pixmaps/dev.twilitrealm.dusk.png"
}

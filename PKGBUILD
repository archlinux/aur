# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>

_pkgname=dusklight
pkgname=${_pkgname}-git
pkgver=2.0.3.r5.g77705f8
pkgrel=1
pkgdesc="Dusklight brings a classic adventure to PC and mobile platforms with a variety of fixes and improvements."
arch=('x86_64')
url="https://github.com/TwilitRealm/dusklight"
license=('CC0-1.0')
depends=(libpng zlib libjpeg-turbo glibc libgcc sdl3 abseil-cpp freetype2 libstdc++ fmt sqlite libogg opus curl)
makedepends=(cmake ninja vulkan-headers git)
replaces=(tp-dusk-git)
conflicts=(dusklight dusklight-bin)
source=(
  "git+$url"
  "git+https://github.com/encounter/aurora.git"
  "git+https://github.com/encounter/borealis.git"
  "git+https://github.com/TwilitRealm/dusklight-randomizer.git"
  "git+https://github.com/TwilitRealm/dusklight-cosmetics.git"
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}
options=(!lto !debug)

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.extern/aurora.url "${srcdir}/aurora"
  git config submodule.extern/borealis.url "${srcdir}/borealis"
  git config submodule.extern/randomizer.url "${srcdir}/dusklight-randomizer"
  git config submodule.extern/cosmetics.url "${srcdir}/dusklight-cosmetics"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}"

  cmake -B build -S ${_pkgname} -GNinja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
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
	install -Dm755 build/${_pkgname} "${pkgdir}/usr/lib/${pkgname}/${pkgname}"
	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/${pkgname}"
	cp -a build/res "${pkgdir}/usr/share/${pkgname}/res"
	ln -s /usr/share/${_pkgname}/res "${pkgdir}/usr/lib/${pkgname}/res"
	ln -s /usr/lib/${_pkgname}/${_pkgname} "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 ${_pkgname}/platforms/freedesktop/dev.twilitrealm.dusk.desktop "${pkgdir}/usr/share/applications/dev.twilitrealm.dusk.desktop"
	install -Dm644 ${_pkgname}/res/icon.png "${pkgdir}/usr/share/pixmaps/dev.twilitrealm.dusk.png"
}

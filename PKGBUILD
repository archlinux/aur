# Maintainer: John Regan <john@jrjrtech.com>
pkgname='libgme-vgmplay-git'
_pkgbase='libgme-vgmplay'
pkgver=r253.5bdc5d1
pkgrel=2
pkgdesc="libgme fork with VGMPlay integrated"
arch=('x86_64' 'i686')
url="https://git.lopez-snowhill.net/chris/game_music_emu"
license=('LGPL')
makedepends=('cmake' 'git')
conflicts=('libgme')
provides=('libgme')

source=(
'libgme-vgmplay::git+https://git.lopez-snowhill.net/chris/game_music_emu.git#branch=vgmplay'
'vgmplay::git+https://git.lopez-snowhill.net/chris/vgmplay.git'
'file_extractor::git+https://git.lopez-snowhill.net/chris/file_extractor.git'
'CMakeLists.txt'
'libgme-vgmplay-cpp-fixes.patch'
'libgme-vgmplay-more-cpp-fixes.patch'
)

md5sums=(
'SKIP'
'SKIP'
'SKIP'
'da9b3b9f37af84222b9ac300ccf61e90'
'186ed10b81f12813612d363f1a11da5e'
'e2ffcfe50c1d9369a21d6612ecd8e9d4'
)

pkgver() {
	cd "$srcdir/${_pkgbase}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${_pkgbase}"
    git submodule init
    git config submodule.vgmplay.url "${srcdir}/vgmplay"
    git submodule update
    ln -sf "${srcdir}/file_extractor" ./file_extractor
    cp "${srcdir}/CMakeLists.txt" .
    patch --forward --strip=1 --input="${srcdir}/libgme-vgmplay-cpp-fixes.patch"
    patch --forward --strip=1 --input="${srcdir}/libgme-vgmplay-more-cpp-fixes.patch"
}

build() {
    cd "$srcdir/${_pkgbase}"
    rm -rf build
    mkdir build
    cd build
    cmake \
      -DCMAKE_SHARED_LINKER_FLAGS="-Wl,-Bsymbolic -Wl,-Bsymbolic-functions" \
      -DCMAKE_MODULE_LINKER_FLAGS="-Wl,-Bsymbolic -Wl,-Bsymbolic-functions" \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_SKIP_BUILD_RPATH=TRUE \
      -DCMAKE_INSTALL_PREFIX=/usr \
      ..
	make V=1 VERBOSE=1
}

package() {
    cd "$srcdir/${_pkgbase}/build"
    make DESTDIR="$pkgdir/" install
}

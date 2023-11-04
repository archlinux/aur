# Maintainer: Camber Huang <camber@poi.science>
pkgname=openixcard
pkgver=1.1.8
pkgrel=1
pkgdesc="Open Source Version of Allwinner PhoenixCard on Linux"
arch=("x86_64")
url="https://github.com/YuzukiTsuru/OpenixCard"
license=('GPL')
groups=()
depends=('glibc' 'confuse')
makedepends=('cmake')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::git+https://github.com/YuzukiTsuru/OpenixCard.git#tag=${pkgver}"
        "git+https://github.com/YuzukiTsuru/ColorCout.git"
		#"https://github.com/ctag/ColorCout"
        "git+https://github.com/p-ranav/argparse.git"
        "git+https://github.com/arun11299/cpp-subprocess.git"
        "git+https://github.com/ArthurSonzogni/FTXUI.git"
        "git+https://github.com/SemaiCZE/inicpp.git"
		"0001-Added-cstdint-to-fix-error-when-compiling-on-Linux.patch"
        )
noextract=()
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '5ef6d78c5e98bf7ca87911ef7609b9192a9a88411741a971d565401b8fd85523')

prepare() {
    pushd $pkgname-$pkgver
        git submodule init
        git config submodule.lib/ColorCout.url "$srcdir/ColorCout"
        git config submodule.lib/argparse.url "$srcdir/argparse"
        git config submodule.lib/cpp-subprocess.url "$srcdir/cpp-subprocess"
        git config submodule.lib/ftxui.url "$srcdir/FTXUI"
        git config submodule.lib/inicpp.url "$srcdir/inicpp"
		git -c protocol.file.allow=always submodule update
        pushd lib/argparse
            #git checkout 95d4850 include/argparse/argparse.hpp
        popd
        pushd lib/inicpp
			git fetch
			git checkout 0f7bd53
		popd
        # Temporary workaround until ColorCout and OpenixCard/submodule are both updated.
		pushd lib/ColorCout
			git apply --verbose $srcdir/0001-Added-cstdint-to-fix-error-when-compiling-on-Linux.patch
		popd
		
    popd
}

build() {
    cmake -B build -S $pkgname-$pkgver \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}

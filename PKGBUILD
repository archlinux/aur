# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=4.1.1
pkgrel=1
pkgdesc='Cross platform Pokémon RNG tool'
arch=(x86_64)
url='https://github.com/Admiral-Fish/PokeFinder'
license=('GPL3')
depends=(
    'qt6-base'
)
makedepends=(
    'cmake'
    'git'
    'python'
)

source=(
    "$pkgname-$pkgver::git+https://github.com/Admiral-Fish/PokeFinder.git#tag=v$pkgver"
    # Git submodules:
    "git+https://gitlab.com/bzip2/bzip2"
    "git+https://github.com/ColinDuquesnoy/QDarkStyleSheet"
    "git+https://github.com/Admiral-Fish/EncounterTableGenerator"
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Initialize git submodules
    git submodule init
    git config submodule."External/bzip2".url "$srcdir/bzip2"
    git config submodule."External/QDarkStyleSheet".url "$srcdir/QDarkStyleSheet"
    git config submodule."Source/Core/Resources/EncounterTables".url "$srcdir/EncounterTableGenerator"
    git -c protocol.file.allow=always submodule update
}

build() {
    cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=RELEASE -DTEST=ON
    cmake --build build
}

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "build/Source/PokeFinder" "$pkgdir/usr/bin/pokefinder"
}

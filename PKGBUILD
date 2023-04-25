# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=4.1.0
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
)

source=(
    "$pkgname-$pkgver::git+https://github.com/Admiral-Fish/PokeFinder.git#tag=v$pkgver"
    # Patches
    "0001-Fix-build-failure-by-qualifying-size_t-as-std-size_t.patch"
    "0002-Include-missing-std-find-from-algorithm.patch"
    # Git submodules:
    "git+https://gitlab.com/bzip2/bzip2"
    "git+https://github.com/ColinDuquesnoy/QDarkStyleSheet"
    "git+https://github.com/Admiral-Fish/EncounterTableGenerator"
)

sha256sums=('SKIP'
            '4f3fb9c3826295745417163d8d4ab842b8fc62420f403986b93f4499bc4a0abe'
            '59008b7b7ce02bc4135156ec73aa9aaecde2c6d4556c4aaa35d7f40e2e23a37b'
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

    # Apply patches
    git apply \
        "$srcdir/0001-Fix-build-failure-by-qualifying-size_t-as-std-size_t.patch" \
        "$srcdir/0002-Include-missing-std-find-from-algorithm.patch"
}

build() {
    cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=RELEASE -DTEST=ON
    cmake --build build
}

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "build/Source/PokeFinder" "$pkgdir/usr/bin/pokefinder"
}

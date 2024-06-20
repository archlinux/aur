# Maintainer: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=4.2.0
pkgrel=1
pkgdesc='Cross platform Pokémon RNG tool'
arch=(x86_64)
url='https://github.com/Admiral-Fish/PokeFinder'
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
)
makedepends=(
    'cmake'
    'git'
    'python'
    'qt6-tools' # For Qt6Linguist
)

source=(
    "$pkgname-$pkgver::git+https://github.com/Admiral-Fish/PokeFinder.git#tag=v$pkgver"
    # Patches:
    "0001-Add-missing-include-to-JirachiPattern.cpp-392.patch::https://github.com/Admiral-Fish/PokeFinder/commit/2cb1b049cabdf0d1b32c8cf29bf6c9d9c5c55cb0.patch"
    # Git submodules:
    "git+https://gitlab.com/bzip2/bzip2"
    "git+https://github.com/ColinDuquesnoy/QDarkStyleSheet"
    "git+https://github.com/Admiral-Fish/EncounterTableGenerator"
)

sha256sums=('e0eb9a52d6ce8bc9a6f7a4d791a9fb4d6ae469f5a94bd259d09380bb7b0684a3'
            '6dc2bb77ab6b9e90d7581476ff93294f8ccacc20b7609c5c4b035fec719875fa'
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
    git apply $srcdir/0001-Add-missing-include-to-JirachiPattern.cpp-392.patch
}

build() {
    cmake -B build -S "$srcdir/$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=RELEASE -DTEST=ON
    cmake --build build
}

package() {
    install -v -m755 -d "$pkgdir/usr/bin/"
    install -v -m755 "build/Source/PokeFinder" "$pkgdir/usr/bin/pokefinder"
}

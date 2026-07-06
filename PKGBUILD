# Maintainer: Rodney van den Velden <rodney@dfagaming.nl>
# Contributor: Philipp Joram <mail at phijor dot me>

pkgname=pokefinder
pkgver=4.3.2
pkgrel=2
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
    "${pkgname}.desktop"
    "${pkgname}.png"
    # Git submodules:
    "git+https://github.com/facebook/zstd"
    "git+https://github.com/Admiral-Fish/EncounterTableGenerator"
)

sha256sums=('d5a8635250acae55793b3e71140e608f2c4d68c0fe86bb51844a0945427d9aea'
            '505646d82b2fd54666ee7174cf36e569ec0e2b080c62ff40bb3dc62bbc2e5cd6'
            '4151b4be2d9ace17c665d1537f061a8646e995d5152fd9be0b503d4beb236d3d'
            'SKIP'
            'SKIP')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Initialize git submodules
    git submodule init
    git config submodule."Core/External/ztsd".url "$srcdir/bzip2"
    git config submodule."Core/Resources/EncounterTables".url "$srcdir/EncounterTableGenerator"
    git -c protocol.file.allow=always submodule update

    mkdir build
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"

    cmake -G"Unix Makefiles" -DCMAKE_BUILD_TYPE=RELEASE ../
    cmake --build .
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/build/PokeFinder" "$pkgdir/usr/bin/${pkgname}"

    install -Dm755 "$srcdir/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "$srcdir/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}

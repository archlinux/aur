# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren-git
pkgver=0.1.0.r377.be1d911
pkgrel=1
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url="https://veloren.net/"
license=('GPL3')
options=('!strip')
depends=('bash')
makedepends=(
    'git'
    'rustup'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "$pkgname::git+https://gitlab.com/veloren/game.git"
    "assets_voxygen::git+https://gitlab.com/veloren/assets/voxygen.git"
    "assets_world::git+https://gitlab.com/veloren/assets/world.git"
    "voxygen.desktop"
    "voxygen.png"
)
noextract=("voxygen.desktop" "voxygen.png")
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '79950e7d39b1a14a7b218b0da9abe723dffc7a37421fb76e86446e1993e09bf037559803b4825a8c083d2fdb7a85c96c971f5e6eacf690fffec462673a6b24e7'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')
pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule init assets/world
    git submodule init assets/voxygen
    git config submodule.assets/voxygen.url "$srcdir/assets_voxygen"
    git config submodule.assets/world.url "$srcdir/assets_world"
    git submodule update
}

build() {
    rustup toolchain install nightly
    _original_toolchain="$(rustup show active-toolchain)"
    rustup default nightly
    cd "$srcdir/$pkgname/voxygen"
    VELOREN_ASSETS=/usr/share/veloren/assets/ VOXYGEN_SHADERS=/usr/share/veloren/shaders/ cargo build --release
    cd "$srcdir/$pkgname/server-cli"
    VELOREN_ASSETS=/usr/share/veloren/assets/ cargo build --release
    rustup default "${_original_toolchain}"
}

package() {
    mkdir -p "$pkgdir/usr/share/veloren"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/pixmaps"
    mkdir -p "$pkgdir/usr/share/applications/veloren"
    cp -r "$srcdir/$pkgname/assets" "$pkgdir/usr/share/veloren/"
    cp -r "$srcdir/$pkgname/voxygen/shaders" "$pkgdir/usr/share/veloren/"
    cp "$srcdir/$pkgname/target/release/voxygen" "$pkgdir/usr/bin/veloren-voxygen"
    chmod +x "$pkgdir/usr/bin/veloren-voxygen"
    cp "$srcdir/$pkgname/target/release/server-cli" "$pkgdir/usr/bin/veloren-server"
    chmod +x "$pkgdir/usr/bin/veloren-server"
    cp "$srcdir/voxygen.desktop" "$pkgdir/usr/share/applications/veloren/"
    cp "$srcdir/voxygen.png" "$pkgdir/usr/share/pixmaps/"
}

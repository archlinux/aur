# Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren-git 
pkgver=0.1.0.r259.37af884
pkgrel=1
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url="https://veloren.net/"
license=('GPL3')
depends=('bash')
makedepends=(
    'git'
    'rustup'
)
provides=("$pkgname")
conflicts=("$pkgname")
source=(
    "$pkgname::git+https://gitlab.com/veloren/game.git"
    "assets::git+https://gitlab.com/veloren/assets/voxygen.git"
    "veloren-voxygen"
)
noextract=("veloren-voxygen")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
}

prepare() {
    cd "$srcdir/$pkgname/voxygen"
    git submodule init assets
    git config submodule.voxygen/assets.url "$srcdir/assets"
    git submodule update
}

build() {
    rustup default nightly
    cd "$srcdir/$pkgname/voxygen"
    cargo build --release
    cd "$srcdir/$pkgname/server-cli"
    cargo build --release
}

package() {
    mkdir -p "$pkgdir/usr/share/veloren/voxygen"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/$pkgname/voxygen/assets" "$pkgdir/usr/share/veloren/voxygen/assets"
    cp -r "$srcdir/$pkgname/voxygen/shaders" "$pkgdir/usr/share/veloren/voxygen/shaders"
    cp "$srcdir/$pkgname/target/release/voxygen" "$pkgdir/usr/share/veloren/voxygen/voxygen"
    chmod +x "$pkgdir/usr/share/veloren/voxygen/voxygen"
    # currently a script is needed to run voxygen from directory containing assets because using alternative assets path hasn't been implemented yet
    cp "$srcdir/veloren-voxygen" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-voxygen"

    cp "$srcdir/$pkgname/target/release/server-cli" "$pkgdir/usr/bin/veloren-server"
    chmod +x "$pkgdir/usr/bin/veloren-server"

}

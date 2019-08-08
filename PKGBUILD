# Maintainer: Mckol <mckol363@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
pkgname=veloren
pkgver=0.3.0
pkgrel=6
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url="https://veloren.net/"
license=('GPL3')
options=('!strip')
depends=()
makedepends=(
    'git'
    'git-lfs'
    'rustup'
)
provides=("$pkgname")
conflicts=("$pkgname")
_repo_url="https://gitlab.com/veloren/veloren.git"
source=(
    "$pkgname"::"git+$_repo_url#tag=v0.3.0"
    "veloren-voxygen.desktop"
    "voxygen.png"
)
noextract=("veloren-voxygen.desktop" "voxygen.png")
sha512sums=('SKIP'
            '312439719c23326eee6c04b216c2a16219c3804bdb451b763eb726062a40f364e32f9c9a608086bb92dcb9b24d938a37f1f05229faf20602a9e1756219fcaad3'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

prepare() {
    unset GIT_LFS_SKIP_SMUDGE
    cd "$srcdir/$pkgname"
    git remote set-url origin "$_repo_url"
    git lfs install
    git lfs fetch
    git lfs checkout
}

build() {
    cd "$srcdir/$pkgname/voxygen"
    cargo build --release
    cd "$srcdir/$pkgname/server-cli"
    cargo build --release
}

package() {
    mkdir -p "$pkgdir/usr/share/veloren"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "$srcdir/$pkgname/assets" "$pkgdir/usr/share/veloren/"
    cp -r "$srcdir/$pkgname/voxygen/shaders" "$pkgdir/usr/share/veloren/"
    cp "$srcdir/$pkgname/target/release/veloren-voxygen" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-voxygen"
    cp "$srcdir/$pkgname/target/release/veloren-server-cli" "$pkgdir/usr/bin/"
    chmod +x "$pkgdir/usr/bin/veloren-server-cli"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    mkdir -p "$pkgdir/usr/share/applications"
    cp "$srcdir/veloren-voxygen.desktop" "$pkgdir/usr/share/applications"
    cp "$srcdir/voxygen.png" "$pkgdir/usr/share/pixmaps/"
}

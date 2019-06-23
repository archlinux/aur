# Maintainer: Mckol <mckol363@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
pkgname=veloren-git
pkgver=0.2.0.r191.132d1a6
pkgrel=1
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
conflicts=("$pkgname" "veloren")
_repo_url="https://gitlab.com/veloren/veloren.git"
source=(
    "$pkgname"::"git+$_repo_url"
    "voxygen.desktop"
    "voxygen.png"
)
noextract=("voxygen.desktop" "voxygen.png")
sha512sums=('SKIP'
            '27e4e25dc7f7f149873da28414b176c19c27d4c8d656a7f2ab11648137d75e2ec7d0ed07066e5384525123eace34debe1417d16f3e86a2b4ccf06f7c77fa052e'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
}

prepare() {
    unset GIT_LFS_SKIP_SMUDGE
    cd "$srcdir/$pkgname"
    git remote set-url origin "$_repo_url"
    git lfs install
    git lfs fetch
    git lfs checkout
    rustup toolchain install nightly
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
    mkdir -p "$pkgdir/usr/share/applications/veloren"
    cp "$srcdir/voxygen.desktop" "$pkgdir/usr/share/applications/veloren/"
    cp "$srcdir/voxygen.png" "$pkgdir/usr/share/pixmaps/"
}

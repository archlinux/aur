# Maintainer: Mckol <mckol363@gmail.com>
# Contributor: Songtronix <contact@songtronix.com>

export GIT_LFS_SKIP_SMUDGE=1 # This is to prevent Git LFS errors
pkgname=airshipper-git
pkgver=0.10.0.r6.0fa7c6d
pkgrel=1
pkgdesc="The official launcher for Veloren - an open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url='https://gitlab.com/veloren/airshipper'
license=('GPL3')
depends=('openssl' 'libxcb' 'bzip2')
makedepends=('git' 'rustup' 'git-lfs')
provides=('airshipper')
conflicts=('airshipper')
_repo='https://gitlab.com/veloren/airshipper.git'
install='airshipper.install'
source=(
    "$pkgname"::"git+$_repo"
    'airshipper.desktop'
    'airshipper.install'
    'veloren.png'
)
noextract=('airshipper.desktop' 'veloren.png')
sha512sums=('SKIP'
            '4937c26f412c07946ccadacb5a6951e5f42af46b5e44e05a38a6628c09c2a1dbaf98ceec846f5487632a06f38fb8d7453928315ab952908b606716d7370ce606'
            'ce561587113480c8485892983eed16aca6979afa024cc8e7842fd349896696e3bee825ca0214cbdcc8fb972f432957a172df9adc7daa8bf2a7bc2b2828c09928'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
}

prepare() {
    unset GIT_LFS_SKIP_SMUDGE
    cd "$srcdir/$pkgname"
    git remote set-url origin "$_repo"
    git lfs install
    git lfs fetch
    git lfs checkout
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release --bin airshipper
}

package() {
    install -D "$srcdir/$pkgname/target/release/airshipper" -t "$pkgdir/usr/bin/"
    install -Dm 644 "$srcdir/veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -D "$srcdir/airshipper.desktop" -t "$pkgdir/usr/share/applications"
}

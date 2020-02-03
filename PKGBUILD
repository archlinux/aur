# Maintainer: Mckol <mckol363@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

export GIT_LFS_SKIP_SMUDGE=1 # This is to prevent Git LFS errors 
pkgname=veloren
pkgver=0.5.0
pkgrel=1
pkgdesc='An open-world, open-source multiplayer voxel RPG'
arch=('x86_64' 'i686')
url='https://veloren.net/'
license=('GPL3')
options=('!strip') # This makes debugging issues easier sometimes, comment out if small package size is needed
depends=('gtk3')
makedepends=('git' 'git-lfs' 'rustup' 'cairo' 'alsa-lib' 'pango' 'atk' 'gdk-pixbuf2')
provides=("$pkgname")
conflicts=("$pkgname")
_repo='https://gitlab.com/veloren/veloren.git'
source=(
    "$pkgname"::"git+$_repo#tag=v$pkgver"
    'veloren-voxygen.desktop'
    'voxygen.png'
)
noextract=('veloren-voxygen.desktop' 'voxygen.png')
sha512sums=('SKIP'
            '27488b6d59c1f7cd397b9457ad32e7aedd5245559d6cdd02bb102747eb8bf24305b6671a994b8853be0ac49099982aa7e3ff43be527ffc1083bb02a94980b489'
            'b5e5cbf28ab0e335f5a0fc93511fc9936360432a36e35cc876761601abacf257299deb0af6b3d9081143b700f6663c4f603970155dd4dacedb7a9672cde1dc94')

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
    cargo build --release --bin veloren-voxygen --bin veloren-server-cli
}

package() {
    install -D "$srcdir/$pkgname/target/release/veloren-voxygen" -t "$pkgdir/usr/bin"
    install -D "$srcdir/$pkgname/target/release/veloren-server-cli" -t "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/veloren"
    cp -a "$srcdir/$pkgname/assets" "$pkgdir/usr/share/veloren/"
    install -D "$srcdir/veloren-voxygen.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm 644 "$srcdir/voxygen.png" -t "$pkgdir/usr/share/pixmaps/"
}

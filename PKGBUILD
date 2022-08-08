# Maintainer: Mckol <mckol363@gmail.com>

export GIT_LFS_SKIP_SMUDGE=1
pkgname=veloren-git
pkgver=0.13.0.r37.525866816
pkgrel=1
pkgdesc="An open-world, open-source multiplayer voxel RPG"
arch=('x86_64' 'i686')
url='https://veloren.net/'
license=('GPL3')
options=('!strip') # This makes debugging issues easier sometimes, comment out if small package size is needed
depends=('alsa-lib' 'glslang' 'libxkbcommon-x11' 'pulseaudio-alsa' 'vulkan-icd-loader')
makedepends=('atk' 'cmake' 'cairo' 'gdk-pixbuf2' 'git' 'git-lfs' 'openssl' 'pango' 'python' 'rustup' 'udev')
provides=('veloren')
conflicts=('veloren')
_repo='https://gitlab.com/veloren/veloren.git'
source=("$pkgname"::"git+$_repo")
noextract=()
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
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
    export VELOREN_USERDATA_STRATEGY='system' 
    cargo build --release --bin veloren-voxygen --no-default-features --features="default-publish"
    cargo build --release --bin veloren-server-cli
}

package() {
    install -D "$srcdir/$pkgname/target/release/veloren-voxygen" -t "$pkgdir/usr/bin"
    install -D "$srcdir/$pkgname/target/release/veloren-server-cli" -t "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/veloren"
    cp -a "$srcdir/$pkgname/assets" "$pkgdir/usr/share/veloren/"
    install -Dm 644 "$srcdir/$pkgname/assets/voxygen/net.veloren.veloren.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm 644 "$srcdir/$pkgname/assets/voxygen/net.veloren.veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm 644 "$srcdir/$pkgname/assets/voxygen/net.veloren.veloren.metainfo.xml" -t "$pkgdir/usr/share/metainfo"
}

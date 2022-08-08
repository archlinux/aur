# Maintainer: Mckol <mckol363@gmail.com>
# Contributor: Jean Lucas <jean@4ray.co>

export GIT_LFS_SKIP_SMUDGE=1 # This is to prevent Git LFS errors
pkgname=veloren
pkgver=0.13.0
pkgrel=2
pkgdesc='The last stable release of an open-world, open-source multiplayer voxel RPG.'
arch=('x86_64' 'i686')
url='https://veloren.net/'
license=('GPL3')
options=('!strip') # This makes debugging issues easier sometimes, comment out if small package size is needed
depends=('alsa-lib' 'glslang' 'libxkbcommon-x11' 'pulseaudio-alsa' 'vulkan-icd-loader')
makedepends=('atk' 'cairo' 'cmake' 'gdk-pixbuf2' 'git' 'git-lfs' 'openssl' 'pango' 'python' 'rustup' 'udev')
provides=()
conflicts=()
_repo='https://gitlab.com/veloren/veloren.git'
source=("$pkgname"::"git+$_repo#tag=v$pkgver")
noextract=()
sha512sums=('SKIP')

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
    VELOREN_USERDATA_STRATEGY='system' cargo build --release --bin veloren-voxygen --bin veloren-server-cli
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

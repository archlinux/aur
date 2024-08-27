# Maintainer: LunarEclipse <luna@lunareclipse.zone>
# Contributor: Jean Lucas <jean@4ray.co>

export GIT_LFS_SKIP_SMUDGE=1 # This is to prevent Git LFS errors
pkgname=veloren
pkgver=0.16.0
pkgrel=2
pkgdesc='The last stable release of an open-world, open-source multiplayer voxel RPG.'
arch=('x86_64' 'i686')
url='https://veloren.net/'
license=('GPL3')
options=('!strip') # This makes debugging issues easier sometimes, comment out if small package size is needed
depends=('alsa-lib' 'glslang' 'libxkbcommon-x11' 'vulkan-icd-loader')
optdepends=(
    'pulseaudio-alsa: audio support on pulseaudio'
    'pipewire-alsa: audio support on pipewire'
)
makedepends=('atk' 'cairo' 'cmake' 'gdk-pixbuf2' 'git' 'git-lfs' 'openssl' 'pango' 'python' 'rustup' 'udev')
provides=()
conflicts=()
_repo='https://gitlab.com/veloren/veloren.git'
source=("$pkgname"::"git+$_repo#tag=v$pkgver")
noextract=()
sha512sums=('3785641aaa5b5849d44c6ac99dd414fd02aeba95cd12ccb3c52da64a9f92f8d8fe7cbdf04956d014b7823d925c1af21347cff2ccfeb8924563646afff274a4ee')

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

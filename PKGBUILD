# Maintainer: LunarEclipse <luna@lunareclipse.zone>
# Contributor: Jean Lucas <jean@4ray.co>

export GIT_LFS_SKIP_SMUDGE=1 # This is to prevent Git LFS errors
pkgname=veloren
pkgver=0.17.0
pkgrel=2
pkgdesc='The last stable release of an open-world, open-source multiplayer voxel RPG.'
arch=('x86_64' 'i686')
url='https://veloren.net/'
license=('GPL3')
# !strip makes debugging issues easier sometimes, comment out if small package size is needed
# !lto is needed temporarily due to some breaking change in one of the not-pinned complilers IIUC
options=('!strip' '!lto')
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

    # Necessary for shaderc-sys until the next update
    export CMAKE_POLICY_VERSION_MINIMUM=3.5

    export VELOREN_USERDATA_STRATEGY='system'
    cargo build --release \
        --no-default-features --features default-publish \
        --bin veloren-voxygen \
        --bin veloren-server-cli
}

package() {
    install -D "$srcdir/$pkgname/target/release/veloren-voxygen" -t "$pkgdir/usr/bin"
    install -D "$srcdir/$pkgname/target/release/veloren-server-cli" -t "$pkgdir/usr/bin"

    mkdir -p "$pkgdir/usr/share/veloren"
    cp -a "$srcdir/$pkgname/assets" "$pkgdir/usr/share/veloren/"

    install -Dm 644 "$srcdir/$pkgname/assets/voxygen/net.veloren.veloren.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm 644 "$srcdir/$pkgname/assets/voxygen/net.veloren.veloren.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm 644 "$srcdir/$pkgname/assets/voxygen/net.veloren.veloren.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
}

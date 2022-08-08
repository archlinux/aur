# Maintainer:    Lukas1818 aur at lukas1818 dot de
# Co-Maintainer: Mckol <mckol363@gmail.com>

pkgname=veloren-nightly
pkgver=0.13.0.r37.525866816
pkgrel=1
pkgdesc="This version is compatible with the official server."
arch=('x86_64' 'i686')
url='https://veloren.net/'
license=('GPL3')
options=('!strip') # This makes debugging issues easier sometimes, comment out if small package size is needed
depends=('systemd-libs' 'alsa-lib' 'libxcb' 'pulseaudio-alsa')
makedepends=('git' 'git-lfs' 'rustup' 'cairo' 'pango' 'atk' 'gdk-pixbuf2' 'python' 'openssl' 'cmake' 'udev')
provides=('veloren')
conflicts=('veloren')
_repo='https://gitlab.com/veloren/veloren.git'
source=()
noextract=()
sha512sums=()

prepare() {
    cd "$srcdir"
    git clone "$_repo" "$pkgname" || true
    cd "$pkgname"
    git fetch
    git checkout $(wget -qO - https://download.veloren.net/version/linux/x86_64/weekly)
    git lfs install
    git lfs fetch
    git lfs checkout
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --match 'v*' | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//'
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

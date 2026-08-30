# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: fabillo <fabillo@archlinux.org>

pkgname=intiface-central
pkgver=3.1.1+43
_btp_commit=9571b3db42ee2d7b3342ab9d40eb5c9e45679444
_btp_dart_commit=6d91665a3e5faa389e9a626c9b0bb79c6f126d57
_int_ifc_commit=29004d2d7deb7a726e9ed48b88c647e59cac7c49
#_fvm_ver=3.47.2
_fvm_ver=stable
pkgrel=1
pkgdesc="Intiface Central (Buttplug Frontend) Application for Desktop and Mobile "
arch=('x86_64')
url="https://intiface.com/central/"
license=('GPL-3.0-only')
depends=('gtk3' 'openssl' 'bash' 'hicolor-icon-theme' 'libayatana-appindicator')
makedepends=('rustup' 'fvm' 'cmake' 'ninja' 'unzip')
source=("buttplug::git+https://github.com/buttplugio/buttplug#commit=${_btp_commit}"
    "buttplug_dart::git+https://github.com/buttplugio/buttplug_dart#commit=${_btp_dart_commit}"
    "${pkgname}::git+https://github.com/intiface/intiface-central#commit=${_int_ifc_commit}"
    'intiface_central.desktop'
    'run_intiface_central')
sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'e47e91a4581bc9f5487b1ea970595d2a9b3de409718d3e36fd242073a4eadacf'
    '7ded01ad0a04a0daf72bfdc3d1393cfa8dcc11aa64c9bba74eaa880f02eb652b'
)

prepare() {
    cd "$srcdir/$pkgname"
    sed -i "s/PRIVATE -Wall -Werror/PRIVATE -Wno-error/g" ./linux/CMakeLists.txt
    rustup set profile minimal
    rustup toolchain install stable
    rustup override set stable
    fvm use $_fvm_ver --force
    fvm flutter config --enable-linux-desktop
}

build() {
    cd "$srcdir/$pkgname"
    fvm flutter build linux --release
}

package() {
    install -Dm755 "run_intiface_central" "$pkgdir/usr/lib/intiface_central/run_intiface_central"
    install -Dm644 "intiface_central.desktop" "$pkgdir/usr/share/applications/intiface_central.desktop"

    cd "$srcdir/$pkgname/build/linux/x64/release/bundle/"
    install -Dm755 "intiface_central" "$pkgdir/usr/lib/intiface_central/intiface_central"
    cp -r "data" "$pkgdir/usr/lib/intiface_central/data"
    cp -r "lib" "$pkgdir/usr/lib/intiface_central/lib"
    install -Dm644 "data/flutter_assets/assets/icons/intiface_central_icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/intiface_central.png"
}

# Maintainer: Bitals <me at bitals dot xyz>
# Contributor: fabillo <fabillo@archlinux.org>

pkgname=intiface-central
pkgver=3.1.0+42
_btp_commit=893b03c253dc22dc3ffffc2f9dc748da9ad9c14a
_btp_dart_commit=6d91665a3e5faa389e9a626c9b0bb79c6f126d57
_int_ifc_commit=77cb0ff9174a3f82a989a535976b90a14c371203
_fvm_ver=3.44.1
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
    'b7169ffb0e258fb9fa91981c7ab862ee1308f168c8a61771efd2803e787ae586'
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

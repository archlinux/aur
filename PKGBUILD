# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-authenticator
pkgver=1.1.4
_commit=04205ef31c8edb37cfc700d0cf7f5647f83374be
pkgrel=2
pkgdesc='Open source and end-to-end encrypted 2FA app. Securely sync and backup 2FA codes easily.'
arch=('x86_64')
url='https://proton.me/authenticator'
license=('GPL-3.0-or-later')
depends=(
    'cairo'
    'dbus'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
makedepends=('cargo' 'git' 'mold' 'nodejs-lts' 'yarn')
source=("ProtonWebClients-$_commit::git+https://github.com/ProtonMail/WebClients.git#commit=$_commit"
        "Proton Authenticator.desktop"
        "add-missing-dnd-kit-sortable.patch"
        "limit-workspace-to-authenticator.patch")
b2sums=('173e01278d9e217d2c36c01135b556b74d6423557b7721be85cf07c2017ac32f84d9de3d45e27df91d19ac389e5d4d311d44c6fe47512415c3eaab519ffee7f1'
        '2d31d11d97e4a8163b199eed52d920d6ef68bb51e91aa6270e00350a3f9f8f4d265a1dfc995eb6a6e3a4a7ba4a52c49dfe66da32c146f36a5c2c44b68bcda531'
        '086ad7c25fbb5462eb04b4df0414ffc7c7491825e8d3294cfe3d10e56a2a7b9d1de6b3519076a175d0b0ecfe21cc30a79ad531a728bbde183b08b6b72e347d81'
        '741725c6d79fcd38ae29ca5a6187e3a7bc966d7b72a959eb8484760d9b3968bd7e3ababd7c9d4f50194299bb02e3317d128bdc48a6a64996fa6a5f3b0b34e93b')

prepare() {
    cd ProtonWebClients-$_commit
    patch -p1 -i "$srcdir/add-missing-dnd-kit-sortable.patch"
    patch -p1 -i "$srcdir/limit-workspace-to-authenticator.patch"
}

build() {
    cd ProtonWebClients-$_commit

    export LDFLAGS="-fuse-ld=mold"
    export RUSTFLAGS="-C link-arg=-fuse-ld=mold"

    yarn install
    yarn workspace proton-authenticator build:desktop
}

package() {
    cd ProtonWebClients-$_commit/applications/authenticator

    install -Dm755 src-tauri/target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/Proton Authenticator.desktop" \
        "$pkgdir/usr/share/applications/Proton Authenticator.desktop"

    cd src-tauri/icons
    install -Dm644 32x32.png "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
    install -Dm644 64x64.png "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
    install -Dm644 128x128.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 128x128@2x.png "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"
}

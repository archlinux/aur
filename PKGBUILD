# Maintainer: Ivan Gabaldon <ivan [d0t] gab [at] inetol [d0t] net>
# Contributor: Sonu Ishaq <sonuishaq67@gmail.com>

pkgname=deskreen
pkgver=2.0.4
pkgrel=1
pkgdesc='Turns any device with a web browser to a second screen for your computer'
arch=('aarch64' 'x86_64' 'i686')
url='https://deskreen.com'
license=('AGPL3')
makedepends=('yarn')
conflicts=("$pkgname-bin")
source=("$pkgname-source.tar.gz::https://github.com/pavlobu/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
noextract=("$pkgname-source.tar.gz")
b2sums=('bef83c836ac722a854b524bc829b8e2f5a395a10d8d5794a148f0ef7f7a9f1292f99e99f219b10a9d550986d224c744047288a62fa37dcc062bebdbe42684e65'
        '96072794fba957f5d9258778f41595c00e8ea3b866b9692f64282212254139c2c85e4b9ca516d4f6efe1a1deb7fc1c269ec09f86c98debe04e4507cecc79457e')

prepare() {
    mkdir -p "$pkgname-source"
    bsdtar -xpf "$pkgname-source.tar.gz" --strip-components=1 -C "$pkgname-source/"
}

build() {
    ### START BUILD PATCHES
    # [LAZY FIX] envelope routines::initialization error -> https://lists.archlinux.org/archives/list/arch-dev-public@lists.archlinux.org/thread/IZT6ADWS5YUUNC7IFBUVYIB7O4QIJGZV/
    export NODE_OPTIONS=--openssl-legacy-provider
    ### END BUILD PATCHES

    cd "$srcdir/$pkgname-source/"

    SKIP_PREFLIGHT_CHECK=true yarn install --frozen-lockfile
    cd app/client/
    SKIP_PREFLIGHT_CHECK=true yarn install --frozen-lockfile
    cd ../../
    SKIP_PREFLIGHT_CHECK=true yarn build

    case "$CARCH" in
        'aarch64')
            yarn electron-builder build --arm64 -l dir
            mv 'release/linux-arm64-unpacked/' 'release/linux-unpacked/'
            ;;
        'x86_64')
            yarn electron-builder build --x64 -l dir
            #mv 'release/linux-x64-unpacked/' 'release/linux-unpacked/'
            ;;
        'i686')
            yarn electron-builder build --ia32 -l dir
            mv 'release/linux-ia32-unpacked/' 'release/linux-unpacked/'
            ;;
    esac
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-source/release/linux-unpacked/"* "$pkgdir/opt/$pkgname/"
    cp "$srcdir/$pkgname-source/resources/icon.png" "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-source/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: Ivan Gabaldon <ivan.gab at inetol dot net>
# Contributor: Sonu Ishaq <sonuishaq67@gmail.com>

pkgname=deskreen
pkgver=2.0.3
pkgrel=5
pkgdesc='Turns any device with a web browser to a second screen for your computer'
arch=('aarch64' 'x86_64' 'i686')
url='https://deskreen.com'
license=('AGPL3')
makedepends=('libxcrypt-compat' 'yarn')
conflicts=("$pkgname-bin")
source=("$pkgname-source.tar.gz::https://github.com/pavlobu/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
noextract=("$pkgname-source.tar.gz")
b2sums=('3e22d44be54b457507a5c0ea8534c70228a7bea92bd7c5b090118835854fe69d2a4c585675eb816c9642269fed95fbceb4ac576dd00d37d644f9c5c649b71fd6'
        'afa917c32b27e56dd12c0e8a755624bffe846fa38b64ba9a202f27366b2c6a7ee715ce9389c9fc37a04c8876563ef4764551bf0cdaa51c67b96628f7e79f4388')

prepare() {
    mkdir -p "$pkgname-$pkgver" "$pkgname-source"
    bsdtar -xpf "$pkgname-source.tar.gz" --strip-components=1 -C "$pkgname-source/"
}

build() {
    cd "$srcdir/$pkgname-source/"

    yarn install --frozen-lockfile
    cd app/client/
    yarn install --frozen-lockfile
    cd ..
    yarn install --frozen-lockfile
    cd ..

    yarn build
    case "$CARCH" in
        'aarch64')
            yarn electron-builder build --linux dir --arm64
            ;;
        'x86_64')
            yarn electron-builder build --linux dir --x64
            ;;
        'i686')
            yarn electron-builder build --linux dir --ia32
            ;;
    esac

    cp -r 'release/linux-unpacked/'* "$srcdir/$pkgname-$pkgver/"
    cp 'resources/icon.png' "$srcdir/$pkgname-$pkgver/"
    cp 'LICENSE' "$srcdir/"
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/"* "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

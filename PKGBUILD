# Maintainer: Iván Gabaldón <contact|@|inetol.net>
# Contributor: Sonu Ishaq <sonuishaq67@gmail.com>

pkgname=deskreen
pkgver=2.0.3
pkgrel=4
pkgdesc='Turns any device with a web browser to a second screen for your computer'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://deskreen.com'
license=('AGPL3')
depends=('nss')
makedepends=('glibc' 'libxcrypt-compat' 'yarn')
conflicts=("$pkgname-bin")
source=("$pkgname-source.tar.gz::https://github.com/pavlobu/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
noextract=("$pkgname-source.tar.gz")
b2sums=('3e22d44be54b457507a5c0ea8534c70228a7bea92bd7c5b090118835854fe69d2a4c585675eb816c9642269fed95fbceb4ac576dd00d37d644f9c5c649b71fd6'
        'ba7d1537ead5757091ec51da21ad1751bb1dcad2fe90cb3b5377f0507f9484643f0d9d784b23d7dccc88fe5f54d9559fd2e945ad4c6170614f1b04979c64e802')

prepare() {
    mkdir -p "$pkgname-$pkgver" "$pkgname-source"
    bsdtar -xpf "$pkgname-source.tar.gz" --strip-components=1 -C "$pkgname-source/"
}

build() {
    cd "$srcdir/$pkgname-source/"

    # DEPS
    yarn install --frozen-lockfile
    cd app/client/
    yarn install --frozen-lockfile
    cd ..
    yarn install --frozen-lockfile
    cd ..

    # BUILD
    yarn build
    if [ "$CARCH" == 'x86_64' ]; then
        yarn electron-builder build --linux deb --x64
        cp "release/${pkgname}_${pkgver}_amd64.deb" "../$pkgname-$pkgver.deb"
    elif [ "$CARCH" == 'i686' ]; then
        yarn electron-builder build --linux deb --ia32
        cp "release/${pkgname}_${pkgver}_i386.deb" "../$pkgname-$pkgver.deb"
    elif [ "$CARCH" == 'aarch64' ]; then
        yarn electron-builder build --linux deb --arm64
        cp "release/${pkgname}_${pkgver}_arm64.deb" "../$pkgname-$pkgver.deb"
    elif [ "$CARCH" == 'armv7h' ]; then
        yarn electron-builder build --linux deb --armv7l
        cp "release/${pkgname}_${pkgver}_armv7l.deb" "../$pkgname-$pkgver.deb"
    fi

    cp 'LICENSE' '../LICENSE'
    bsdtar -xpf "../$pkgname-$pkgver.deb" -C "$srcdir"
    bsdtar -xpf '../data.tar.xz' -C "$srcdir/$pkgname-$pkgver"
}

package() {
    install -d "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/$pkgname-$pkgver/opt/Deskreen/"* "$pkgdir/opt/$pkgname"

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -d "$pkgdir/usr/share/icons"
    cp -r "$srcdir/$pkgname-$pkgver/usr/share/icons/"* "$pkgdir/usr/share/icons/"

    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

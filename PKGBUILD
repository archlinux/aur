# Maintainer: Ivan Gabaldon <aur[at]inetol.net>
# Contributor: Sonu Ishaq <sonuishaq67@gmail.com>

pkgname=deskreen
pkgver=2.0.4
pkgrel=4
pkgdesc='Turn any device into a secondary screen for your computer'
arch=('aarch64'
      'x86_64')
url='https://deskreen.com'
license=('AGPL3')
depends=('alsa-lib'
         'at-spi2-core'
         'cairo'
         'dbus'
         'expat'
         'gcc-libs'
         'gdk-pixbuf2'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libcups'
         'libdrm'
         'libx11'
         'libxcb'
         'libxcomposite'
         'libxdamage'
         'libxext'
         'libxfixes'
         'libxkbcommon'
         'libxrandr'
         'mesa'
         'nspr'
         'nss'
         'pango')
makedepends=('nodejs>=16.20.2'
             'yarn')
conflicts=("$pkgname-bin")
source=("$pkgname-$pkgver.tar.gz::https://github.com/pavlobu/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop")
noextract=("$pkgname-$pkgver.tar.gz")
b2sums=('bef83c836ac722a854b524bc829b8e2f5a395a10d8d5794a148f0ef7f7a9f1292f99e99f219b10a9d550986d224c744047288a62fa37dcc062bebdbe42684e65'
        '076a41b6d494ecdeb3a563b65dfe9d54250cec521e6e54fc9fe084829af1799f3f4e8287dd9bc80e41ddc74d8f7642ebda91158ccf1056bad87d40e8630cb8d6')

prepare() {
    mkdir -p "$pkgname-$pkgver/"
    bsdtar -xpf "$pkgname-$pkgver.tar.gz" --strip-components=1 -C "$pkgname-$pkgver/"

    mv "$pkgname-$pkgver/resources/icon.png" "$srcdir/$pkgname.png"
}

build() {
    # "error:0308010C:digital envelope routines::unsupported" -> https://github.com/webpack/webpack/issues/14532
    export NODE_OPTIONS=--openssl-legacy-provider

    cd "$srcdir/$pkgname-$pkgver/app/client/"
    yarn install --non-interactive --pure-lockfile

    cd "$srcdir/$pkgname-$pkgver/"
    yarn install --non-interactive --pure-lockfile
    yarn build

    case "$CARCH" in
        'aarch64')
            yarn electron-builder build --arm64 -l dir
            mv 'release/linux-arm64-unpacked/' 'release/linux-unpacked/'
            ;;
        'x86_64')
            yarn electron-builder build --x64 -l dir
            ;;
    esac
}

package() {
    install -d "$pkgdir/opt/$pkgname/"
    cp -r "$srcdir/$pkgname-$pkgver/release/linux-unpacked/"* "$pkgdir/opt/$pkgname/"

    install -d "$pkgdir/usr/bin/"
    ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm644 "$srcdir/$pkgname.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
    install -Dm644 "$srcdir/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}

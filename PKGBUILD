# Maintainer: aquova <mail at aquova dot net>
# Contributor: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>

pkgname=stardrop
_pkgname=Stardrop
pkgver=1.9.0
pkgrel=1
pkgdesc='An open-source, cross-platform mod manager for Stardew Valley'
url='https://github.com/Floogen/Stardrop'
options=("strip" "!debug")
arch=("x86_64")
license=("GPL3")
depends=('dotnet-runtime')
makedepends=('dotnet-sdk' 'libicns')
source=(
    "${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "stardrop.desktop"
)
sha256sums=(
    'bc153b32e7b7dcf6187ce39d4cdf09669656f710e4fe01929d65da1e26c7f1a9'
    'cfd312d94b81122a6faade6799ea195b52114e60574ca2d1706f94da00d27b17'
)

prepare() {
    icns2png -x -s 512x512 "$srcdir/$_pkgname-$pkgver/$_pkgname/Assets/Stardrop.icns"
}

build() {
    cd $_pkgname-$pkgver
    dotnet publish $_pkgname -c "Release" --runtime "linux-x64"
}

package() {
    mkdir -p $pkgdir/opt/$pkgname
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/icons/hicolor/512x512/apps
    mkdir -p $pkgdir/usr/share/applications

    cd $srcdir/$_pkgname-$pkgver/$_pkgname/bin/Release/linux-x64
    cp -a * $pkgdir/opt/$pkgname
    ln -sf /opt/$pkgname/$_pkgname $pkgdir/usr/bin/$pkgname

    install -m 644 $srcdir/Stardrop_512x512x32.png $pkgdir/usr/share/icons/hicolor/512x512/apps/stardrop.png
    install -m 644 $srcdir/stardrop.desktop $pkgdir/usr/share/applications/stardrop.desktop
}

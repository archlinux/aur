# Maintainer: haya3218 <stophayapls123 at proton dot me>
# Contributor: haya3218 <stophayapls123 at proton dot me>

pkgname=high-voltage-ring
pkgver=3.1
pkgdesc='A level editor for Dr. Robotniks Ring Racers'
pkgrel=2
arch=('x86_64' 'aarch64')
license=(GPL-3.0-or-later)
url='https://git.do.srb2.org/KartKrew/high-voltage-ring/'
depends=('mono' 'mono-msbuild' 'libx11' 'mesa' 'wine')
makedepends=('make')

# Sources are sourced from my own repository, as the official GitHub mirror is inactive
source=("$pkgname-$pkgver.tar.gz::https://github.com/hayaunderscore/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
    "unofficial.kartkrew.HighVoltageRing.desktop"
    "unofficial.kartkrew.HighVoltageRing.png"
    "mono-fix.patch"
    "gdcc-wine-fix.patch"
    "gdcc-acc"
    "high-voltage-ring.sh"
)

sha256sums=(
    '441dd6316a06ce06cb3ca121420f440e842bbec3bfdd157763fd0d0ae49c73e2'
    'ecd06cbeac1d1c9e23691ccaad8d9959f2efcd6286268352d1ad1e28f7ca77c3'
    'f2f671b6cf419ef37225df93e316a4b122d789809c7a04782b08f7e663155f2c'
    '25e680dd3640ba9307b03943fc186723eaa2ca63b52bab2b1a916d5b56f5f7b2'
    '28c474ba3535b9a0ebe6b1f9317394345159c27d93e5896cfb8ff62314cebbc9'
    'b303e5e407a46a80e4ebdde860a480d7b160f0b91602eaf941ad7aa0c64033e5'
    'f4159ebbf50047ad8729a06b9ddac3e1408fc6249be95000fabfa46ca2488f85'
)

build() {
    cd "$pkgname-$pkgver"
    # Apply the fix for Mono builds
    patch --binary -p0 < ../mono-fix.patch
    # Also apply wine fix for gdcc-acc
    # Hopefully deprecate once I get the source tree for a native build of it
    patch --binary -p0 < ../gdcc-wine-fix.patch
    make
    cd ".."
}

package() {
    # For desktop files and executable
    install -Dm644 unofficial.kartkrew.HighVoltageRing.png "$pkgdir"/usr/share/pixmaps/unofficial.kartkrew.HighVoltageRing.png
    install -Dm644 unofficial.kartkrew.HighVoltageRing.desktop "$pkgdir"/usr/share/applications/unofficial.kartkrew.HighVoltageRing.desktop
    install -Dm644 high-voltage-ring.sh "$pkgdir"/usr/bin/high-voltage-ring
    # Just in case...
    chmod +x "$pkgdir"/usr/bin/high-voltage-ring

    # For the build files
    rm -rf "$pkgdir"/usr/share/HighVoltageRing
    mkdir -p "$pkgdir"/usr/share/HighVoltageRing
    cd "$srcdir/$pkgname-$pkgver/Build"
    find "." -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/HighVoltageRing/{}" \;
    cd "$srcdir"

    # Wine gdcc-acc executable
    install -Dm644 gdcc-acc "$pkgdir"/usr/share/HighVoltageRing/Compilers/RingRacers/gdcc-acc
    # Just in case...
    chmod +x "$pkgdir"/usr/share/HighVoltageRing/Compilers/RingRacers/gdcc-acc
}

# Maintainer: haya3218 <stophayapls123 at proton dot me>
# Contributor: haya3218 <stophayapls123 at proton dot me>

pkgname=high-voltage-ring-fixes-git
pkgver=v3.1.r5.g9f4db75
pkgdesc='A level editor for Dr. Robotniks Ring Racers'
pkgrel=1
arch=('x86_64' 'aarch64')
license=(GPL-3.0-or-later)
url='https://git.do.srb2.org/KartKrew/high-voltage-ring/'
depends=('mono' 'mono-msbuild' 'libx11' 'mesa' 'wine')
provides=('high-voltage-ring')
conflicts=('high-voltage-ring')
makedepends=('make')

# Sources are sourced from my own repository, as the official GitHub mirror is inactive
source=("git+https://github.com/hayaunderscore/high-voltage-ring.git#branch=fixes"
    "unofficial.kartkrew.HighVoltageRing.desktop"
    "unofficial.kartkrew.HighVoltageRing.png"
    "high-voltage-ring.sh"
)

sha256sums=(
    'SKIP'
    'ecd06cbeac1d1c9e23691ccaad8d9959f2efcd6286268352d1ad1e28f7ca77c3'
    'f2f671b6cf419ef37225df93e316a4b122d789809c7a04782b08f7e663155f2c'
    'f4159ebbf50047ad8729a06b9ddac3e1408fc6249be95000fabfa46ca2488f85'
)

pkgver() {
    git -C "high-voltage-ring" describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "high-voltage-ring"
    make
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
    cd "$srcdir/high-voltage-ring/Build"
    find "." -type f -exec install -Dm 644 "{}" "$pkgdir/usr/share/HighVoltageRing/{}" \;
    cd "$srcdir"
}

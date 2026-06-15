# Maintainer: Advik <advikmurthy12@gmail.com>
pkgname=amplify
pkgver=1.2.4
pkgrel=1
pkgdesc="Sound Effects Soundboard with PipeWire/PulseAudio virtual mic routing"
arch=('any')
url="https://github.com/Sage563/Amplify"
license=('MIT')
depends=(
    'python>=3.10'
    'python-gobject'         # gi bindings
    'gtk4'
    'libadwaita'
    'pipewire'               # or pulseaudio, paplay/pactl come with either
    'pipewire-pulse'         # provides paplay + pactl via PipeWire's PA layer
)
makedepends=(
    'python-setuptools'
)
optdepends=(
    'pulseaudio-utils: alternative to pipewire-pulse for paplay/pactl'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/Sage563/Amplify/archive/v$pkgver.tar.gz")
sha256sums=('6cb4be29c1b668deb9f5b82a8d71195a3d2b10858e2692e9515f8bc10d329063')

# For local builds during dev: comment the source/sha256sums above and use:
# source=("$pkgname::git+file:///path/to/your/local/repo")

build() {
    if [[ -d "$srcdir/$pkgname" ]]; then
        cd "$srcdir/$pkgname"
    else
        cd "$srcdir/Amplify-$pkgver"
    fi
    python setup.py build
}

package() {
    if [[ -d "$srcdir/$pkgname" ]]; then
        cd "$srcdir/$pkgname"
    else
        cd "$srcdir/Amplify-$pkgver"
    fi
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    # Desktop entry
    install -Dm644 assets/amplify.desktop \
        "$pkgdir/usr/share/applications/amplify.desktop"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

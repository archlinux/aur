# Maintainer: taxin <taxin404@duck.com>
pkgname=uad-ng-git
pkgver=r1.2.0.53d2ef2
pkgrel=1
pkgdesc="Cross-platform GUI written in Rust using ADB to debloat non-rooted Android devices (next generation, development git version)"
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation"
license=('GPL3')
depends=('android-tools' 'fontconfig' 'vulkan-icd-loader')
makedepends=('cargo' 'git')
provides=('universal-android-debloater')
conflicts=('universal-android-debloater' 'universal-android-debloater-bin' 'universal-android-debloater-git')
source=(
    "$pkgname::git+https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation.git"
    "uad-ng.desktop"
    "uad-ng-logo.png::https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation/raw/main/resources/assets/logo-light.png"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # Count commits since latest tag, append short hash
    local commits hash tag
    tag=$(git describe --tags --abbrev=0 2>/dev/null | sed 's/^v//')
    if [ -n "$tag" ]; then
        commits=$(git rev-list --count "${tag}"..HEAD)
        hash=$(git rev-parse --short HEAD)
        printf "r%s.%s" "$tag" "$hash"
    else
        commits=$(git rev-list --count HEAD)
        hash=$(git rev-parse --short HEAD)
        printf "r%s.%s" "$commits" "$hash"
    fi
}

build() {
    cd "$srcdir/$pkgname"
    cargo build --release -p uad-gui
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/uad-gui "$pkgdir/usr/bin/uad-ng"
    install -Dm644 "$srcdir/uad-ng-logo.png" "$pkgdir/usr/share/pixmaps/uad-ng.png"
    install -Dm644 "$srcdir/uad-ng.desktop" "$pkgdir/usr/share/applications/uad-ng.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

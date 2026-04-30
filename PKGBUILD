# Maintainer: mexus <gilaldpellaeon@gmail.com>
#
# Template — not a usable PKGBUILD on its own.
# To publish to the AUR:
#   1. Copy the contents of this directory into the AUR repo.
#   2. Run `./prepare.sh` (uses the latest GitHub release) or
#      `./prepare.sh X.Y.Z` to pin a version. The script renders this template,
#      runs updpkgsums, and writes .SRCINFO.
#   3. Commit & push.
pkgname=pacrank-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Pick the fastest Archlinux mirrors (prebuilt binary)"
arch=('x86_64')
url="https://github.com/mexus/pacrank"
license=('Apache-2.0' 'MIT')
provides=('pacrank')
conflicts=('pacrank')
depends=('gcc-libs' 'glibc')
optdepends=('sudo: required at runtime to rewrite /etc/pacman.d/mirrorlist')
source=(
    "pacrank-$pkgver-$CARCH.tar.gz::$url/releases/download/v$pkgver/pacrank-$CARCH-unknown-linux-gnu.tar.gz"
    "LICENSE-MIT-$pkgver::$url/raw/v$pkgver/LICENSE-MIT"
    "LICENSE-APACHE-$pkgver::$url/raw/v$pkgver/LICENSE-APACHE"
)
sha256sums=('fffa4f800a8ba53a7c5cf526ea047823bae8f2e0a9ed8d8e996f3fe24c8d3c43'
            '1f4501dd650e746acbfb3b11a4143ec4334751180817115a41b8583b60909548'
            '8e026767a7a93aa2d295f7a0b912d438aae888004d42a45c9510954a9efdb3d2')

package() {
    install -Dm755 "$srcdir/pacrank" "$pkgdir/usr/bin/pacrank"

    # Generate shell completions from the freshly installed binary.
    install -d "$pkgdir/usr/share/bash-completion/completions" \
               "$pkgdir/usr/share/zsh/site-functions" \
               "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir/usr/bin/pacrank" --generate-completions bash \
        > "$pkgdir/usr/share/bash-completion/completions/pacrank"
    "$pkgdir/usr/bin/pacrank" --generate-completions zsh \
        > "$pkgdir/usr/share/zsh/site-functions/_pacrank"
    "$pkgdir/usr/bin/pacrank" --generate-completions fish \
        > "$pkgdir/usr/share/fish/vendor_completions.d/pacrank.fish"

    install -Dm644 "$srcdir/LICENSE-MIT-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 "$srcdir/LICENSE-APACHE-$pkgver" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}

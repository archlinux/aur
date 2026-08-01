# Maintainer: Pulsar <Pulsar33550336@163.com>

pkgname=tuack-ng-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="重构后的 tuack 项目，旨在提供更加高效和轻量的出题体验。"
url="https://github.com/tuack-ng/tuack-ng"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("tuack-ng")
conflicts=("tuack-ng")
depends=("gcc-libs" "glibc")
source=("https://github.com/tuack-ng/tuack-ng/releases/download/$pkgver/tuack-ng-linux-x86_64.zip")
sha256sums=('46e5b07dfce80cad603d313ab7ff1bb94c8180c923d50b012f792c89a89db78b')
optdepends=(
    'typst: Needed for rendering PDF'
    'git: Needed for lfs management'
)
options=('!debug')  # useless in Rust project

package() {
    install -Dm755 tuack-ng -t "$pkgdir/usr/bin"

    install -dm755 "$pkgdir/usr/share/tuack-ng/"
    cd assets
    find . -type d -exec install -dm755 "$pkgdir/usr/share/tuack-ng/{}" \;
    find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/tuack-ng/{}" \;
    find ./checkers -type f ! -name "*.*" -exec chmod 755 "$pkgdir/usr/share/tuack-ng/{}" \;

    cd ..

    mkdir -vp "$pkgdir/usr/share/zsh/site-functions"
    ./tuack-ng gen complete zsh >"$pkgdir/usr/share/zsh/site-functions/_tuack-ng"

    mkdir -vp "$pkgdir/usr/share/bash-completion/completions"
    ./tuack-ng gen complete bash >"$pkgdir/usr/share/bash-completion/completions/tuack-ng"

    mkdir -vp "$pkgdir/usr/share/fish/vendor_completions.d"
    ./tuack-ng gen complete fish >"$pkgdir/usr/share/fish/vendor_completions.d/tuack-ng.fish"
}

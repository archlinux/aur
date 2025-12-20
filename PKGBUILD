# Maintainer: MieraK <mrkpwnz@gmail.com>
pkgname=rmpc-git
_pkgname=rmpc
pkgver=0.10.0.r31.g7bbedb9
pkgrel=1
pkgdesc='A beautiful and configurable TUI client for MPD'
url='https://rmpc.mierak.dev/'
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
depends=(gcc-libs glibc)
optdepends=(
    'yt-dlp: for youtube playback'
    'ffmpeg: for youtube playback'
    'python-mutagen: for youtube playback'
    'ueberzugpp: for alternative album art method'
    'cava: for music visualisation')
conflicts=('rmpc')
provides=('rmpc')
makedepends=(cargo git)
source=("git+https://github.com/mierak/rmpc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --frozen
}

prepare() {
    cd "$srcdir/$_pkgname"
    cargo fetch --locked
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --release --frozen
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    cd "$srcdir/$_pkgname/target/completions"
    install -Dm644 "$_pkgname.bash" "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
    install -Dm644 "$_pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
    install -Dm644 "_$_pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"

    cd "$srcdir/$_pkgname/target/man"
    install -Dm644 "$_pkgname.1" "$pkgdir/usr/share/man/man1/rmpc.1"

    cd "$srcdir/$_pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}

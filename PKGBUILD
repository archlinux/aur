# Maintainer: Glob876 <gleb87687@gmail.com>

pkgname=mediacli-git
_pkgname=mediacli
pkgver=r16.c242274
pkgrel=1
pkgdesc="Advanced console media suite around yt-dlp & FFmpeg with TUI and background queue"
arch=('x86_64' 'aarch64')
url="https://github.com/Glob876/mediacli"
license=('MIT')

depends=(
    'yt-dlp'
    'ffmpeg'
)

optdepends=(
    'atomicparsley: Embedding artwork and tags into MP4/M4A'
    'deno: JavaScript runtime for yt-dlp signature decryption'
)

makedepends=(
    'go'
    'git'
)

provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/Glob876/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"

    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
    export LDFLAGS="-s -w"

    go build -ldflags="$LDFLAGS" -o "$_pkgname" .
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

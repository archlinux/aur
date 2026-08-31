pkgname=anpan-git
pkgver=0.4.0.r6.g88dd31e
pkgrel=1
pkgdesc="Feed a link, bake a file — minimal terminal downloader (VCS latest)"
arch=('x86_64' 'aarch64')
url="https://github.com/KabosuNeko/anpan"
license=('MIT')
provides=('anpan')
conflicts=('anpan' 'anpan-bin')
makedepends=('git' 'go')
optdepends=(
    'aria2: for multi-connection acceleration, creator archives, and BitTorrent'
    'ffmpeg: for media multiplexing and audio extraction'
)
source=("git+https://github.com/KabosuNeko/anpan.git")
sha256sums=('SKIP')

pkgver() {
    cd anpan
    git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd anpan
    export CGO_ENABLED=0
    go build -trimpath -ldflags="-s -w -X github.com/KabosuNeko/anpan/cmd.Version=$(git describe --tags --always)" -o anpan .
}

package() {
    cd anpan
    install -Dm755 anpan "${pkgdir}/usr/bin/anpan"
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}

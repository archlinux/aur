# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=mon2cam-git
_pkgname=Mon2Cam
pkgver=r84.e3f26c7
pkgrel=1
pkgdesc="Workaround for multi-monitor Discord screensharing"
arch=("any")
url="https://github.com/ShayBox/$_pkgname"
license=("MIT")
depends=(
    "deno"
    "xorg-xrandr"
    "ffmpeg"
)
makedepends=(
    "git"
    "deno"
)
optdepends=(
    "v4l2loopback-dkms: virtual webcam driver"
    "wf-recorder: wlroots compositor (wayland) support"
)
provides=("mon2cam")
source=(
    "git+$url.git"
    "shebang"
    "Mon2Cam.desktop"
)
sha256sums=(
    "SKIP"
    "1174500c3fa06a04215189c9a9b6e334456c97fc962cc63c4ad6eee6bb215e98"
    "5f7100d7c06257db8bcd9d23d0f70897f145ec561cf54dd0bfede948498af9da"
)

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    
    deno bundle --unstable src/mod.ts > "$_pkgname.ts"
    cat "$srcdir/shebang" "$_pkgname.ts" > "$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/mon2cam"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# Maintainer: SocketByte <business@socketbyte.pl>
pkgname=upscale-git
pkgver=0.1.0
pkgrel=1
pkgdesc="AI-powered image and video upscaling tool (RealESRGAN, SwinIR, Anime4K)"
arch=('x86_64')
url="https://github.com/SocketByte/upscale"
license=('MIT')
depends=('ffmpeg' 'realesrgan-ncnn-vulkan-bin' 'python' 'python-pip')
optdepends=(
    'cuda: GPU acceleration for SwinIR'
)
makedepends=('go')
install=$pkgname.install
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/upscale"
    git describe --long --tags --always | sed 's/^v//;s/-/+/g'
}

build() {
    cd "$srcdir/upscale"
    export CGO_ENABLED=0
    export GOFLAGS="-buildvcs=false"
    go build -trimpath -ldflags "-s -w" -o upscale .
}

package() {
    cd "$srcdir/upscale"

    install -Dm755 upscale "$pkgdir/usr/bin/upscale"

    install -Dm755 install.sh "$pkgdir/usr/share/upscale/install.sh"

    install -dm755 "$pkgdir/usr/share/upscale/tools/anime4k"
    for glsl in tools/anime4k/*.glsl; do
        install -Dm644 "$glsl" \
            "$pkgdir/usr/share/upscale/tools/anime4k/$(basename "$glsl")"
    done

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/upscale/LICENSE"
}

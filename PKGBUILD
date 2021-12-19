# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=filetovox
pkgver=1.14
pkgrel=1
pkgdesc="Tool for convert files into Magicavoxel file"
url="https://github.com/Zarbuz/FileToVox"
license=('MIT')
arch=('x86_64' 'armv7h' 'aarch64')
depends=('libgdiplus')
makedepends=('dotnet-sdk')
source=("https://github.com/Zarbuz/FileToVox/archive/$pkgver.tar.gz")
sha256sums=('187f790398da8b20ccd678eb2285dc9e7860589e5201767d77f24abf5af23b81')
options=(!strip)

build() {
    cd "$srcdir/FileToVox-$pkgver"
    export DOTNET_CLI_TELEMETRY_OPTOUT=1
    ## Select runtime
    runtime="linux-x64"
    if [ "$CARCH" == "armv7h" ]; then
        runtime="linux-arm"
    elif [ "$CARCH" == "aarch64" ]; then
        runtime="linux-arm64"
    fi
    ## Enable libgdiplus
    echo '{"configProperties": {"System.Drawing.EnableUnixSupport": true}}' \
        > SchematicToVoxCore/runtimeconfig.template.json
    ## Build as single file
    dotnet publish SchematicToVoxCore \
        -p:PublishSingleFile=true \
        -r $runtime \
        -c Release \
        -o bin
}

package() {
    mkdir -p "$pkgdir/opt/filetovox"
    cp -ar "$srcdir/FileToVox-$pkgver/bin/." "$pkgdir/opt/filetovox"

    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/filetovox/FileToVox" "$pkgdir/usr/bin/FileToVox"

    install -Dm644 "${srcdir}/FileToVox-$pkgver/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

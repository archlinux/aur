# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=filetovox
pkgver=1.15
pkgrel=1
pkgdesc="Tool for convert files into Magicavoxel file"
url="https://github.com/Zarbuz/FileToVox"
license=('MIT')
arch=('x86_64' 'armv7h' 'aarch64')
depends=('libgdiplus')
makedepends=('dotnet-sdk')
source=("https://github.com/Zarbuz/FileToVox/archive/$pkgver.tar.gz")
sha256sums=('35a3d24bae202e1f8d4f534ea91b5261d7f1faf097e2f50fb116735ed9b88233')
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
    ## Build as single file
    dotnet publish SchematicToVoxCore \
        -p:PublishSingleFile=true \
        -p:PublishTrimmed=true \
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

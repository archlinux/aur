# Maintainer: krant <aleksey.vasilenko@gmail.com>

pkgname=filetovox
pkgver=1.16
pkgrel=3
pkgdesc="Tool for convert files into MagicaVoxel file"
url="https://github.com/Zarbuz/FileToVox"
license=('MIT')
arch=('x86_64' 'armv7h' 'aarch64')
depends=()
makedepends=('dotnet-sdk')
source=("https://github.com/Zarbuz/FileToVox/archive/$pkgver.tar.gz")
sha256sums=('05d8013f7cd166279790517135c499b6269e093714c8d3875f303466f8659148')
options=(!strip)

build() {
    cd "$srcdir/FileToVox-$pkgver"
    rm nuget.config
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
        --self-contained \
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

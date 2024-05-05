# Maintainer: Thomas Schneider <thomas@brainfuck.space>

pkgbase=ente
_pkgbase=ente-photos
pkgname=(ente-server ente-web) 
pkgver=0.8.81
pkgrel=2
pkgdesc="End to End Encrypted alternative to Google Photos" 
arch=('x86_64')
url="https://github.com/ente-io/ente"
license=('AGPLv3')
depends=('libsodium')
makedepends=('go' 'git' 'nodejs' 'yarn')
source=("${_pkgbase}-$pkgver.tar.gz::$url/archive/refs/tags/photos-v${pkgver}.tar.gz"
        "ente-museum.service"
        "git+https://github.com/ente-io/PhotoSwipe.git"
        "git+https://github.com/abhinavkgrd/ffmpeg.wasm.git")
backup=('etc/ente/configurations/local.yaml')
sha256sums=('2473e38bb3d9eda7122bf6a12e6de63205cea877c18f6ebe1b961e4b5575e7ce'
            'd632886a9068ee4a2cdd6bccbd7cf87dc196660b45a0888d5b50f4565365af1c'
            'SKIP'
            'SKIP')

prepare() {
    # they use git submodules both repos haven't been updated in over 3 years
    # I could only use a stable release on ffmpeg-wasm
#    rm -rf "$srcdir/$pkgbase-v$pkgver/web/apps/photos/thirdparty/ffmpeg-wasm"
#    cp -a ${srcdir}/ffmpeg.wasm-0.10.1 "$srcdir/$pkgbase-v$pkgver/web/apps/photos/thirdparty/ffmpeg-wasm"
#    git clone https://github.com/ente-io/PhotoSwipe.git "$srcdir/$pkgbase-v$pkgver/web/apps/photos/thirdparty/photoswipe" || echo Already pulled
#    git clone https://github.com/abhinavkgrd/ffmpeg.wasm.git "$srcdir/$pkgbase-v$pkgver/web/apps/photos/thirdparty/ffmpeg-wasm" || echo I should solve this correctly some time in the future
#    cd "$srcdir/$pkgbase-v$pkgver/web/apps/photos/thirdparty/photoswipe"
#    git checkout single-thread
     cd "${srcdir}/${_pkgbase}-v${pkgver}"
#     git init
#     git submodule init
#     git config submodule.web/apps/photos/thirdparty/ffmpeg-wasm.url "${srcdir}/ffmpeg.wasm"
#     git config submodule.web/apps/photos/thirdparty/photoswipe.url "${srcdir}/PhotoSwipe"
#     git -c protocol.file.allow=always submodule update
     rm -rf web/apps/photos/thirdparty/ffmpeg-wasm
     rm -rf web/apps/photos/thirdparty/photoswipe
     git clone "${srcdir}/ffmpeg.wasm" web/apps/photos/thirdparty/ffmpeg-wasm
     git clone "${srcdir}/PhotoSwipe" web/apps/photos/thirdparty/photoswipe
     # Ugly patch
     sed 's/^\(\s\+mt:\)/\/\/\1/' -i "${srcdir}/ente-photos-v0.8.81/web/apps/photos/src/services/wasm/ffmpeg.ts"
#     cd "${srcdir}/${_pkgbase}-v${pkgver}/web/apps/photos/thirdparty/ffmpeg-wasm"
     
}

build() {
    cd "$srcdir/${_pkgbase}-v${pkgver}/server"
    echo "Build musem"
#    export CGO_ENABLED=0
    export GOOS=linux
    go mod tidy
    go build -o museum cmd/museum/main.go
# web
    echo "Build web"
    cd "$srcdir/${_pkgbase}-v$pkgver/web"
    yarn install
    yarn next telemetry disable
#    NEXT_PUBLIC_ENTE_ENDPOINT=http://10.0.0.3:8080 yarn build
    NEXT_PUBLIC_ENTE_ENDPOINT=http://10.0.0.3:8080 yarn build:photos
}

package_ente-server() {
    pkgdesc="End to End Encrypted alternative to Google Photos - Server component"
    optdepends=('postgresql'  'minio')

    cd "$srcdir/${_pkgbase}-v$pkgver/server"

    mkdir -p "$pkgdir/etc/ente/configurations/" "$pkgdir/etc/ente/migrations/" "$pkgdir/etc/ente/mail-templates/"
    # Install the binary
    install -Dm755 museum "$pkgdir/usr/bin/museum"

    # Install configurations
    install -Dm644 configurations/* "$pkgdir/etc/ente/configurations/"

    # Install migrations
    install -Dm644 migrations/* "$pkgdir/etc/ente/migrations/"

    # Install mail templates
    install -Dm644 mail-templates/* "$pkgdir/etc/ente/mail-templates/"

    # Install LICENSE file
#    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgbase}/LICENSE"

    # Create systemd service
    install -Dm644 "${srcdir}/ente-museum.service" "$pkgdir/etc/systemd/system/ente-museum.service"
    install -vDm644 "${srcdir}/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -vDm644 "${srcdir}/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

package_ente-web() {
    pkgdesc="End to End Encrypted alternative to Google Photos - Web component"
    optdepends=('nginx')

    cd "$srcdir/${_pkgbase}-v$pkgver/web/apps/photos/out"

    mkdir -p "$pkgdir/usr/share/webapps/ente"
    # Install the web component
    cp -r * "$pkgdir/usr/share/webapps/ente"  # This should be changed to a more robust installation method

    # Install nginx configuration
#  install -Dm644 nginx/ente.conf "$pkgdir/etc/nginx/sites-available/ente.conf"
}

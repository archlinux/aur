# Maintainer: Thomas Schneider <thomas@brainfuck.space>

pkgbase=ente
_pkgbase=ente-photos
pkgname=(ente-server ente-web) 
pkgver=1.2.8
pkgrel=0
pkgdesc="End to End Encrypted alternative to Google Photos" 
arch=('x86_64')
url="https://github.com/ente-io/ente"
license=('AGPLv3')
depends=('libsodium')
makedepends=('go' 'git' 'nodejs-lts-iron' 'yarn')
source=("${_pkgbase}-$pkgver.tar.gz::$url/archive/refs/tags/photos-v${pkgver}.tar.gz"
        "ente-museum.service"
        "sysusers.conf"
        "tmpfiles.conf"
        "ente-web-nginx-example.conf"
        "git+https://github.com/ente-io/PhotoSwipe.git"
        "git+https://github.com/abhinavkgrd/ffmpeg.wasm.git")
backup=('etc/ente/configurations/local.yaml')
sha256sums=('0b9fe0a4c7028e0ddee4de5fcd63d0bc1f8622bbd87fa01a0878d60575522367'
            'd632886a9068ee4a2cdd6bccbd7cf87dc196660b45a0888d5b50f4565365af1c'
            '49f07f3e3519b242b12aaa7d8d10c5e1fa934a6ccdf8bfda0bd41c55654c37c2'
            'eb8f5dbec1e34ef68b733cb73d93cb854e81fea278727b5f914dab2d578371e0'
            '84e916a1fef6ee1367572b09e8aba10a61222792faf13f758d31e66263dc8e51'
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
#     sed 's/^\(\s\+mt:\)/\/\/\1/' -i "${srcdir}/${_pkgbase}-v${pkgver}/web/apps/photos/src/worker/ffmpeg.worker.ts"
     # sed 's/^\(\s\+mt:\)/\/\/\1/' -i "${srcdir}/${_pkgbase}-v${pkgver}/web/packages/new/photos/services/ffmpeg/worker.ts"
#     /web/apps/photos/src/worker/ffmpeg.worker.ts"
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
    git submodule update --init --recursive
    yarn install
    yarn next telemetry disable
#    NEXT_PUBLIC_ENTE_ENDPOINT=http://localhost:8080 yarn build
#    NEXT_PUBLIC_ENTE_ENDPOINT=http://localhost:8080 yarn build:photos
    if [ "$NEXT_PUBLIC_ENTE_ENDPOINT" ];then
        echo "Using $NEXT_PUBLIC_ENTE_ENDPOINT"
        yarn build:photos
    else
        NEXT_PUBLIC_ENTE_ENDPOINT=/api yarn build:photos
    fi
}

package_ente-server() {
    pkgdesc="End to End Encrypted alternative to Google Photos - Server component"
    optdepends=('postgresql'  'minio')

    cd "$srcdir/${_pkgbase}-v$pkgver/server"
    
    echo "Install museum"
    mkdir -p "$pkgdir/etc/ente/configurations/" "$pkgdir/etc/ente/migrations/" "$pkgdir/etc/ente/mail-templates/" "$pkgdir/etc/ente/web-templates/"
    # Install the binary
    install -Dm755 museum "$pkgdir/usr/bin/museum"

    echo "Install configuration"
    # Install configurations
    install -Dm644 configurations/* "$pkgdir/etc/ente/configurations/"

    echo "Install migrations"
    # Install migrations
    install -Dm644 migrations/* "$pkgdir/etc/ente/migrations/"

    echo "Install templates"
    # Install mail templates
    # install -Dm644 mail-templates/* "$pkgdir/etc/ente/mail-templates/"
    cp -r mail-templates/* "$pkgdir/etc/ente/mail-templates/"
    cp -r web-templates/* "$pkgdir/etc/ente/web-templates/"

    echo "Install license"
    # Install LICENSE file
#    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgbase}/LICENSE"

    echo "Install systemd service"
    # Create systemd service
    install -vDm644 "${srcdir}/ente-museum.service" "$pkgdir/etc/systemd/system/ente-museum.service"
    install -vDm644 "${srcdir}/tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
    install -vDm644 "${srcdir}/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

package_ente-web() {
    pkgdesc="End to End Encrypted alternative to Google Photos - Web component"
    optdepends=('nginx')

    cd "$srcdir/${_pkgbase}-v$pkgver/web/apps/photos/out"

    mkdir -p "$pkgdir/usr/share/webapps/ente" "${pkgdir}/usr/lib/ente/"
    # Install the web component
    cp -r * "$pkgdir/usr/share/webapps/ente"  # This should be changed to a more robust installation method

    # Install nginx configuration
#  install -Dm644 nginx/ente.conf "$pkgdir/etc/nginx/sites-available/ente.conf"
    install -vDm644 ${srcdir}/ente-web-nginx-example.conf "${pkgdir}/usr/lib/ente/"
}

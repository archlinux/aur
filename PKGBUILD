# Maintainer: p.devil <p dot devil at gmail dot com>
pkgbase="patreon-downloader"
_pkgbase="PatreonDownloader"
pkgname="$pkgbase"
pkgver="0.10.1.2"
pkgrel="1"

pkgdesc="downloads content posted by creators on patreon.com"
arch=("x86_64")
url="https://github.com/AlexCSDev/${pkgbase}"
license=("MIT")

depends=('zlib' 'krb5')
makedepends=("dotnet-sdk>=5.0.0" "git")
options=(!strip)

source=(
    "${pkgbase}-${pkgver}::git+https://github.com/AlexCSDev/${_pkgbase}#tag=${pkgver}"
    "universal-downloader-platform::git+https://github.com/AlexCSDev/UniversalDownloaderPlatform.git"
)
sha1sums=('SKIP' 'SKIP')
sha256sums=('SKIP' 'SKIP')

prepare() {
    cd "${pkgbase}-${pkgver}"
    git submodule init
    git config submodule."submodules/UniversalDownloaderPlatform".url \
        "${srcdir}/universal-downloader-platform"
    git submodule update
}

build() {
    cd "${pkgbase}-${pkgver}/PatreonDownloader.App"

    dotnet publish \
        --configuration Release \
	    --framework net5.0 \
        --runtime linux-x64 \
        --self-contained \
        -p:DefineConstants=PACKAGED \
        -p:PublishReadyToRun=true \
        -p:PublishSingleFile=true \
        -p:PublishTrimmed=true \
        -p:TrimMode=link \
        -p:DebuggerSupport=false \
        -p:EnableUnsafeBinaryFormatterSerialization=false \
        -p:EnableUnsafeUTF7Encoding=false \
        -p:InvariantGlobalization=true \
        -o publish
}

package() {
    cd "${pkgbase}-${pkgver}/PatreonDownloader.App"
    install -dm755 "${pkgdir}/usr/bin"
    install -m755 "publish/PatreonDownloader.App" "${pkgdir}/usr/bin/${pkgbase}"

    install -Dm644 "${srcdir}/${pkgbase}-${pkgver}/LICENSE.md" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

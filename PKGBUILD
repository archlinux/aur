# Maintainer: KNX Monitor Team <support@knxmonitor.dev>
pkgname=knxmonitor
pkgver=0.10.14
pkgrel=1
pkgdesc="KNX/EIB bus monitoring and debugging tool"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/KnxMonitor"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'openssl')
makedepends=('dotnet-sdk>=9.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metaneutrons/KnxMonitor/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a4641feae44a47985791488b9812a5c373a77c7abbcbe955b8d67247bc44840')  # Will be updated with actual SHA

prepare() {
    cd "$srcdir/KnxMonitor-$pkgver"

    # Restore NuGet packages
    dotnet restore KnxMonitor/KnxMonitor.csproj
}

build() {
    cd "$srcdir/KnxMonitor-$pkgver"

    # Determine runtime based on architecture
    case "$CARCH" in
        x86_64)
            _runtime="linux-x64"
            ;;
        aarch64)
            _runtime="linux-arm64"
            ;;
        *)
            error "Unsupported architecture: $CARCH"
            return 1
            ;;
    esac

    # Build the application
    dotnet publish KnxMonitor/KnxMonitor.csproj \
        --configuration Release \
        --runtime "$_runtime" \
        --self-contained true \
        --output publish \
        -p:PublishSingleFile=true \
        -p:IncludeNativeLibrariesForSelfExtract=true \
        -p:IncludeAllContentForSelfExtract=true \
        -p:EnableCompressionInSingleFile=true
}

check() {
    cd "$srcdir/KnxMonitor-$pkgver"

    # Basic functionality test
    ./publish/KnxMonitor --version
    ./publish/KnxMonitor --help
}

package() {
    cd "$srcdir/KnxMonitor-$pkgver"

    # Install binary
    install -Dm755 publish/KnxMonitor "$pkgdir/usr/bin/knxmonitor"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install man page
    if [ -f "docs/knxmonitor.1" ]; then
        install -Dm644 docs/knxmonitor.1 "$pkgdir/usr/share/man/man1/knxmonitor.1"
    fi

    # Install example CSV file
    if [ -f "knx-addresses.csv" ]; then
        install -Dm644 knx-addresses.csv "$pkgdir/usr/share/doc/$pkgname/examples/knx-addresses.csv"
    fi
}

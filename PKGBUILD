# Maintainer: Red007Master <Red007Master@gmail.com>
pkgname=redpoweroffinformer-git
pkgver=r29.6aca905
pkgrel=2
pkgdesc="A tool to inform about power-off events"
arch=('x86_64')
url="https://github.com/Red007Master/RedPowerOffInformer"
license=('GPL3')
depends=()
makedepends=('dotnet-sdk-9.0' 'git')
provides=('redpoweroffinformer')
conflicts=('redpoweroffinformer')
options=('!strip')
source=("git+https://github.com/Red007Master/RedPowerOffInformer.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/RedPowerOffInformer"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/RedPowerOffInformer"
    
    # Set DOTNET environment variables for reproducible builds
    # export DOTNET_CLI_TELEMETRY_OPTOUT=1
    # export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=1
    # export DOTNET_NOLOGO=1
    
    # -p:EnableCompressionInSingleFile=true \
    # -p:IncludeNativeLibrariesForSelfExtract=true \

    # -p:PublishTrimmed=true \
    
    dotnet publish -c Release -r linux-x64 \
        --self-contained \
        -p:PublishSingleFile=true \
        -p:PublishReadyToRun=true \
        -p:DebugType=None \
        -p:DebugSymbols=false \
        -o publish
}

package() {
    cd "$srcdir/RedPowerOffInformer"

    # Install the binary
    install -Dm755 "publish/RedPowerOffInformer" "$pkgdir/usr/bin/redpoweroffinformer"
    
    # Install license file if it exists
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
    
    # Install documentation if it exists
    if [ -f README.md ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}

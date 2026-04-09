# Maintainer: noahsub <https://github.com/noahsub>
pkgname=hyprvoid
pkgver=1.0.0
pkgrel=1
pkgdesc="A highly customizable window minimization manager built for Hyprland."
arch=('x86_64')
url="https://github.com/noahsub/hyprvoid"
license=('BSD-3-Clause')

# Runtime dependencies
depends=(
    'hyprland'
    'grim'
)

# Make dependencies
makedepends=(
    'dotnet-sdk'
    'patchelf'
)

# Source code from the specific version tag in the repository
source=("git+https://github.com/noahsub/hyprvoid.git#tag=v${pkgver}")
sha256sums=('SKIP')

# Build the project
build() {
    cd "$srcdir/$pkgname"
    dotnet publish -c Release -r linux-x64 --self-contained true /p:PublishAot=true /p:StripSymbols=true /p:OptimizationPreference=Size /p:PublishSingleFile=true
}

# Package the project
package(){
    cd "$srcdir/$pkgname"
    
    # Install executable
    install -Dm755 "bin/Release/net10.0/linux-x64/publish/hyprvoid" "$pkgdir/usr/bin/hyprvoid"
    
    # Install libraries
    install -Dm644 "bin/Release/net10.0/linux-x64/publish/libHarfBuzzSharp.so" "$pkgdir/usr/lib/hyprvoid/libHarfBuzzSharp.so"
    install -Dm644 "bin/Release/net10.0/linux-x64/publish/libSkiaSharp.so" "$pkgdir/usr/lib/hyprvoid/libSkiaSharp.so"
    
    # Set RPATH for the executable to find the libraries
    patchelf --set-rpath '$ORIGIN/../lib/hyprvoid' "$pkgdir/usr/bin/hyprvoid"
    
    # Install configuration files
    install -Dm644 "Config/hyprvoid.conf" "$pkgdir/usr/share/hyprvoid/hyprvoid.conf"
    install -Dm644 "Config/hyprvoid.json" "$pkgdir/usr/share/hyprvoid/hyprvoid.json"
    mkdir -p "$pkgdir/usr/share/hyprvoid/themes"
    for theme in Themes/*; do
        install -Dm644 "$theme" "$pkgdir/usr/share/hyprvoid/themes/$(basename "$theme")"
    done    
}


# Maintainer: sTiKyt <stikyt@proton.me>

pkgname=stack-wallet-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="Fully open source multicoin cryptocurrency wallet"
arch=('x86_64')
url="https://stackwallet.com/"
license=('GPL-3.0-or-later')
depends=('gtk3' 'libsecret' 'nss' 'alsa-lib')
makedepends=('patchelf')
provides=('stack-wallet')
conflicts=('stack-wallet' 'stack-wallet-appimage')
source=(
    "sw-v${pkgver}-linux.AppImage::https://github.com/cypherstack/stack_wallet/releases/download/build_316/sw-v${pkgver}-linux.AppImage"
    "stack-wallet.desktop"
    "LICENSE::https://raw.githubusercontent.com/cypherstack/stack_wallet/build_316/LICENSE"
)
sha256sums=(
    '81e0f7edce0f41c6d3a090d906893213f959274f81b3d36e448d941fc8391fbf'
    '2a8a718692c208b85822edf7370bd0c0d41645a3da36fc2d75c785b2ba462796'
    '8b1ba204bb69a0ade2bfcf65ef294a920f6bb361b317dba43c7ef29d96332b9b'
)
noextract=("sw-v${pkgver}-linux.AppImage")
options=('!strip')

prepare() {
    chmod +x "sw-v${pkgver}-linux.AppImage"
    ./"sw-v${pkgver}-linux.AppImage" --appimage-extract
    
    # Fix execstack flags on wallet libraries that cause "cannot enable executable stack" errors
    patchelf --clear-execstack squashfs-root/lib/monero_libwallet2_api_c.so
    patchelf --clear-execstack squashfs-root/lib/wownero_libwallet2_api_c.so
    patchelf --clear-execstack squashfs-root/lib/salvium_libwallet2_api_c.so
    
    # Fix RUNPATH on all libraries so they can find each other
    # The AppImage build has hardcoded paths from the build machine
    for lib in squashfs-root/lib/*.so*; do
        if [[ -f "$lib" && ! -L "$lib" ]]; then
            patchelf --set-rpath '$ORIGIN' "$lib" 2>/dev/null || true
        fi
    done
}

package() {
    local instdir="$pkgdir/usr/lib/stack-wallet"
    
    # Create installation directory
    install -dm755 "$instdir"
    
    # Install binary
    install -Dm755 squashfs-root/stack_wallet "$instdir/stack_wallet"
    
    # Install bundled libraries
    install -dm755 "$instdir/lib"
    cp -r squashfs-root/lib/* "$instdir/lib/"
    
    # Install data directory (flutter_assets + icudtl.dat)
    install -dm755 "$instdir/data"
    cp -r squashfs-root/data/* "$instdir/data/"
    
    # Create wrapper script that sets LD_LIBRARY_PATH
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/stack-wallet" << 'EOF'
#!/bin/bash
exec env LD_LIBRARY_PATH=/usr/lib/stack-wallet/lib /usr/lib/stack-wallet/stack_wallet "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/stack-wallet"
    
    # Desktop entry
    install -Dm644 stack-wallet.desktop "$pkgdir/usr/share/applications/stack-wallet.desktop"
    
    # Icon
    install -Dm644 squashfs-root/stackwallet.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/stack-wallet.png"
    
    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

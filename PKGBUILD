# Maintainer: mazix <mazix@bk.ru>

pkgname=perplexity
pkgver=1.1.3
pkgrel=7
pkgdesc='Native Perplexity AI client for Linux'
arch=('x86_64')
url='https://github.com/mazixs/perplexity'
license=('Apache 2.0')
depends=('electron' 'wget')
optdepends=('libappindicator-gtk3: for tray icon support')
#conflicts=('')
source=("perplexity.desktop"
        "perplexity.png"
        "launcher.sh"
        "default.conf")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    # Download the latest binary package dynamically
    local download_url=$(curl -s "https://api.github.com/repos/mazixs/perplexity/releases/latest" \
        | grep "browser_download_url" \
        | grep "pkg.tar.zst" \
        | cut -d '"' -f 4)
    
    if [ -z "$download_url" ]; then
        echo "Error: Could not find download URL for latest release"
        exit 1
    fi
    
    echo "Downloading from: $download_url"
    wget -O "perplexity-latest.pkg.tar.zst" "$download_url"
}

package() {
    # Extract the binary package
    cd "${srcdir}"
    bsdtar -xf "perplexity-latest.pkg.tar.zst"
    
    # Copy extracted files to package directory
    if [ -d "usr" ]; then
        cp -r usr "${pkgdir}/"
    fi
    if [ -d "opt" ]; then
        cp -r opt "${pkgdir}/"
    fi
    if [ -d "etc" ]; then
        cp -r etc "${pkgdir}/"
    fi
    
    # Install additional files from source
    install -Dm644 "perplexity.desktop" "${pkgdir}/usr/share/applications/perplexity.desktop"
    install -Dm644 "perplexity.png" "${pkgdir}/usr/share/pixmaps/perplexity.png"
    install -Dm755 "launcher.sh" "${pkgdir}/usr/bin/perplexity"
    install -Dm644 "default.conf" "${pkgdir}/etc/perplexity/default.conf"
}